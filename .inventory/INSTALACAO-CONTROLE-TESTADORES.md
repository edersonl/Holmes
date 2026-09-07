# Instalação do Sistema de Controle de Testadores

Este documento descreve os passos para instalar e configurar o sistema de controle de testadores.

## Pré-requisitos

- Acesso administrativo ao banco de dados MySQL
- Acesso ao sistema de arquivos do servidor
- Conhecimento básico de SuiteCRM

## Passos de Instalação

### 1. Executar Scripts SQL

Execute o script de migração para criar as tabelas necessárias:

```bash
cd .inventory/scripts
php executar-migrations-testadores.php
```

Ou execute manualmente:

```bash
mysql -u root -p develop < criar-tabela-testadores.sql
mysql -u root -p develop < criar-tabela-auditoria.sql
mysql -u root -p develop < criar-index-auditoria.sql
```

### 2. Verificar Tabelas Criadas

```sql
USE develop;

SHOW TABLES LIKE 'saude_testadores_conexoes';
SHOW TABLES LIKE 'saude_auditoria';
```

### 3. Configurar o Sistema de Auditoria

As configurações já foram adicionadas ao `config.php`:

```php
'testadores' => [
    'habilitado' => true,
    'refresh_interval' => 30,
    'max_conexoes_ativas' => 5,
],
```

### 4. Integrar com Entry Point

Adicione o seguinte código ao final do arquivo `entryPoint.php` para registrar login automático:

```php
// Registro automático de login
require_once('include/auditoria/AuditoriaManager.php');
$auditoria = new AuditoriaManager();

if (isset($current_user) && is_object($current_user) && !empty($current_user->id)) {
    // Registra login na auditoria
    $auditoria->registrarOperacao('LOGIN', 'System', 'Login', 'System', '', 'Usuário fez login');
}
```

### 5. Adicionar Hook de Login

No arquivo `include/entryPoint.php`, após a verificação de usuário, adicione:

```php
// Registra status de conexão quando usuário entra no sistema
require_once('api/v1/testadores/status.php');
```

### 6. Adicionar Dashlet à Homepage

1. Acesse a homepage do SuiteCRM
2. Clique em "Configure Layout"
3. Adicione o dashlet "Testadores Online"

### 7. Configurar Permissões

Certifique-se de que os usuários têm permissões de leitura/escrita nas tabelas:

```sql
GRANT SELECT, INSERT, UPDATE ON develop.saude_testadores_conexoes TO 'root'@'localhost';
GRANT SELECT, INSERT ON develop.saude_auditoria TO 'root'@'localhost';
```

## Verificação da Instalação

### 1. Verificar Tabelas

```sql
SELECT COUNT(*) FROM saude_testadores_conexoes;
SELECT COUNT(*) FROM saude_auditoria;
```

### 2. Testar API

```bash
# Testar endpoint de status
curl -X GET http://localhost/crm-unimed/api/v1/testadores/status
```

### 3. Testar Dashboard

Acesse a homepage e verifique se o dashlet "Testadores Online" está funcionando.

## Configurações Adicionais

### Intervalo de Atualização

Para alterar o intervalo de atualização do dashlet, modifique no `config.php`:

```php
'testadores' => [
    'refresh_interval' => 30, // Altere para o valor desejado em segundos
],
```

### Habilitar/Desabilitar Auditoria

No arquivo `include/auditoria/config_auditoria.php`:

```php
define('AUDITORIA_HABILITADA', false); // Desabilita auditoria
```

## Desinstalação

Para remover o sistema:

1. Excluir as tabelas:

```sql
DROP TABLE saude_testadores_conexoes;
DROP TABLE saude_auditoria;
```

2. Remover configurações do `config.php`

3. Remover arquivos do sistema de auditoria

## Troubleshooting

### Tabelas não criadas

Verifique se os scripts SQL foram executados sem erros:

```sql
SHOW TABLES LIKE 'saude_testadores%';
```

### Erro de conexão

Verifique as credenciais no `dbconfig.php` e a conectividade com o banco de dados.

### Dashlet não carrega

Verifique se o usuário tem permissões de leitura nas tabelas e se há dados na tabela `saude_testadores_conexoes`.

### API não responde

Verifique se o arquivo `api/v1/testadores/status.php` existe e se as dependências estão instaladas.

## Suporte

Para dúvidas ou problemas, contate a equipe de desenvolvimento.