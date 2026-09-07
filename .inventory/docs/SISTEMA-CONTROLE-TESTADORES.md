# Sistema de Controle de Testadores Online

## Visão Geral

O sistema de controle de testadores permite rastrear e monitorar quem está disponível para execução de testes. Não restringe acesso, apenas registra e monitora a disponibilidade dos testadores.

## Componentes Implementados

### 1. Tabela de Conexões (saude_testadores_conexoes)

Armazena o histórico de conexões de todos os testadores.

**Campos principais:**
- `id`: Identificador único (UUID)
- `data_hora_login`: Data e hora de entrada online
- `data_hora_logout`: Data e hora de saída (offline)
- `tempo_conectado_segundos`: Tempo total conectado em segundos
- `usuario_id`: ID do usuário do sistema
- `usuario_nome`: Nome do usuário
- `usuario_email`: E-mail do usuário
- `ip_address`: Endereço IP do usuário
- `navegador`: Informações do navegador
- `ambiente`: Ambiente (desenvolvimento, homologação, produção)
- `sessao_id`: ID da sessão PHP
- `status`: ONLINE, OFFLINE ou DESCONECTADO
- `data_hora_status`: Data e hora da última alteração de status

### 2. Sistema de Auditoria (saude_auditoria)

Registra todas as operações realizadas no sistema com identificação completa do usuário.

**Campos principais:**
- `operacao`: CREATE, UPDATE, DELETE, READ, APPROVE, REJECT, EXECUTE, VALIDATE
- `modulo`: Módulo onde a operação foi realizada
- `tela`: Tela/página onde a operação foi realizada
- `entidade`: Entidade afetada
- `registro_id`: ID do registro afetado
- `dados_anteriores` / `dados_novos`: Dados para operações de UPDATE
- `ip_address`, `navegador`, `sessao_id`: Informações da sessão

### 3. Módulo Personalizado (saude_TESTADORES)

Módulo SuiteCRM para gerenciamento de testadores.

**Arquivos:**
- `vardefs.php`: Definições da tabela
- `saude_TESTADORES.php`: Classe principal
- `Menu.php`: Menu de navegação
- `metadata/*.php`: Views (edit, list, detail)
- `language/pt_BR.lang.php`: Arquivo de idioma
- `Dashlets/TestadoresOnlineDashlet.php`: Dashlet de visualização
- `tpls/TestadoresOnlineDashlet.tpl`: Template do dashlet

### 4. API REST

**Endpoint:** `/api/v1/testadores/status`

**Métodos:**
- `GET`: Obtém status atual do usuário
- `POST/PUT`: Atualiza status (ONLINE/OFFLINE)

### 5. Auditoria Manager

Classe central para registro e validação de auditoria.

**Arquivo:** `include/auditoria/AuditoriaManager.php`

**Métodos principais:**
- `registrarOperacao()`: Registra qualquer operação
- `registrarCriacao()`: Registra criação
- `registrarAtualizacao()`: Registra atualização
- `registrarExclusao()`: Registra exclusão
- `registrarAprovacao()`: Registra aprovação
- `registrarReprovacao()`: Registra reprovação
- `registrarExecucao()`: Registra execução
- `registrarValidacao()`: Registra validação
- `validarCamposAuditoria()`: Valida campos protegidos

## Instalação

### 1. Executar Scripts SQL

```bash
php .inventory/scripts/executar-migrations-testadores.php
```

Ou executar manualmente os scripts:
- `.inventory/scripts/criar-tabela-testadores.sql`
- `.inventory/scripts/criar-tabela-auditoria.sql`

### 2. Verificar Configuração

Certifique-se de que as seguintes linhas existem no `config.php`:

```php
'testadores' => [
    'habilitado' => true,
    'refresh_interval' => 30, // segundos
    'max_conexoes_ativas' => 5,
],
```

### 3. Definir Hook de Login

Adicionar hook para registrar login automaticamente:

```php
// No entryPoint.php ou local apropriado
require_once('include/auditoria/AuditoriaManager.php');
$auditoria = new AuditoriaManager();
$auditoria->registrarOperacao('LOGIN', 'System', 'Login', 'System', '', 'Usuário fez login');
```

## Uso

### API REST

**Obter status atual:**
```bash
curl -X GET http://localhost/crm-unimed/api/v1/testadores/status
```

**Alterar status para ONLINE:**
```bash
curl -X POST http://localhost/crm-unimed/api/v1/testadores/status \
  -H "Content-Type: application/json" \
  -d '{"status":"ONLINE"}'
```

**Alterar status para OFFLINE:**
```bash
curl -X POST http://localhost/crm-unimed/api/v1/testadores/status \
  -H "Content-Type: application/json" \
  -d '{"status":"OFFLINE"}'
```

### Painel de Testadores

O dashlet "Testadores Online" pode ser adicionado à homepage do SuiteCRM.

### Identificação Automática

Sempre que um usuário estiver autenticado, o sistema captura automaticamente:
- ID do usuário
- Nome do usuário
- E-mail
- Login
- IP
- Navegador
- Sessão

## Identificação de Usuário

A prioridade para identificação é:

1. **E-mail corporativo autenticado** (priority: 1)
2. **Nome do usuário autenticado** (priority: 2)
3. **Login da sessão** (priority: 3)

## Proteção de Camada

### Frontend

Campos de auditoria são configurados como somente leitura:
- `criado_por`
- `modificado_por`
- `executor`
- `aprovado_por`
- etc.

### Backend

O `AuditoriaManager` valida e ignora qualquer tentativa de alteração manual de campos protegidos.

## Auditoria

Todas as operações são registradas com:

- Usuário autenticado
- Data/Hora
- Operação executada
- Tela
- Identificador do registro
- Sessão

## Configurações Adicionais

### Atualização do config.php

As configurações do sistema de testadores são:

```php
'testadores' => [
    'habilitado' => true,           // Habilita o sistema
    'refresh_interval' => 30,       // Intervalo de atualização (segundos)
    'max_conexoes_ativas' => 5,     // Máximo de conexões simultâneas
],
```

### Configuração de Auditoria

Arquivo: `include/auditoria/config_auditoria.php`

```php
define('AUDITORIA_HABILITADA', true);  // Habilita auditoria

$GLOBALS['AUDITORIA_MODULOS'] = [...]  // Módulos auditados

$GLOBALS['AUDITORIA_CAMPOS_PROTEGIDOS'] = [...]  // Campos protegidos

$GLOBALS['AUDITORIA_OPERACOES'] = [...]  // Operações auditadas

$GLOBALS['AUDITORIA_LOG'] = [...]  // Configurações de log
```

## Rastreabilidade de Executor

### Regra Obrigatória

Sempre que uma ação for realizada por usuário autenticado, o sistema deve utilizar automaticamente os dados do usuário logado.

### Campos Protegidos

- Executor
- Responsável
- Analista
- Testador
- Usuário
- Criado por
- Alterado por
- Aprovado por
- Reprovado por
- Validado por
- Proprietário
- Solicitante
- Revisor

### Validação

1. Frontend: Campos somente leitura
2. Backend: Validação no `AuditoriaManager`
3. API: Validação nos endpoints REST

## Extensão Futura

O sistema foi preparado para futuras funcionalidades:

- Controle de disponibilidade de testadores
- Alocação automática de execuções
- Distribuição de testes por usuário
- Métricas de produtividade
- Dashboard de capacidade de testes

## troubleshooting

### Erro: "Usuário não autenticado"

Verifique se o usuário está logado no SuiteCRM.

### Erro: "Nenhuma conexão ativa encontrada"

O usuário deve estar no status ONLINE antes de realizar operações.

### Dashlet não carrega

Verifique se a tabela `saude_testadores_conexoes` foi criada e se o usuário tem permissões de leitura.

## Manutenção

### Consultar conexões ativas

```sql
SELECT * FROM saude_testadores_conexoes WHERE status = 'ONLINE';
```

### Consultar histórico de um usuário

```sql
SELECT * FROM saude_testadores_conexoes 
WHERE usuario_id = 'ID_DO_USUARIO' 
ORDER BY data_hora_login DESC;
```

### Consultar auditoria

```sql
SELECT * FROM saude_auditoria 
WHERE modulo = 'saude_TESTS_EXECUCAO' 
ORDER BY data_hora DESC 
LIMIT 100;
```