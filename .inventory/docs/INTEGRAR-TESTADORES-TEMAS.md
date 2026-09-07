# Integração do Sistema de Testadores nos Temas

Este documento descreve como integrar o sistema de controle de testadores nos temas do SuiteCRM.

## Passos de Integração

### 1. Incluir o JavaScript no Tema

Adicione a seguinte linha no arquivo `themes/SugarUnimed/header.tpl` ou no head do tema:

```smarty
{if $MODULE == 'Home' || $MODULE == 'saude_TESTS_EXECUCAO'}
    <script src="include/javascript/testadores.js"></script>
{/if}
```

Ou adicione diretamente no head do tema:

```html
<script src="include/javascript/testadores.js"></script>
```

### 2. Incluir o CSS no Tema

Adicione a seguinte linha no arquivo `themes/SugarUnimed/header.tpl` ou no head do tema:

```html
<link rel="stylesheet" href="themes/SugarUnimed/custom.css">
```

### 3. Adicionar Hook de Login ao entryPoint

Edite o arquivo `include/entryPoint.php` e adicione o seguinte código no final, após a inicialização do `$current_user`:

```php
///////////////////////////////////////////////////////////////////////////////
////	SISTEMA DE CONTROLE DE TESTADORES
if (!empty($current_user) && is_object($current_user) && !empty($current_user->id)) {
    require_once('include/auditoria/AuditoriaManager.php');
    $auditoria = new AuditoriaManager();
    
    // Registra login na auditoria
    $auditoria->registrarOperacao(
        'LOGIN', 
        'System', 
        'Login', 
        'System', 
        '', 
        'Usuário fez login no sistema'
    );
    
    // Registra conexão de testador (se não houver conexão ativa)
    $db = $GLOBALS['db'];
    
    // Verifica se já existe conexão ativa
    $query = "
        SELECT id FROM saude_testadores_conexoes 
        WHERE usuario_id = ? 
        AND status = 'ONLINE' 
        ORDER BY data_hora_login DESC 
        LIMIT 1
    ";
    
    $result = $db->query($query, [$current_user->id]);
    $row = $db->fetchByAssoc($result);
    
    if (!$row) {
        // Cria nova conexão
        $ip_address = $_SERVER['REMOTE_ADDR'] ?? null;
        $navegador = $_SERVER['HTTP_USER_AGENT'] ?? '';
        $sessao_id = session_id();
        $ambiente = 'Desenvolvimento';
        
        if (!empty($sugar_config['site_url'])) {
            $url = $sugar_config['site_url'];
            if (strpos($url, 'localhost') !== false || strpos($url, '192.168.1.78') !== false) {
                $ambiente = 'Desenvolvimento';
            } elseif (strpos($url, 'homologa') !== false || strpos($url, 'qualidade') !== false) {
                $ambiente = 'Homologação';
            } elseif (strpos($url, 'producao') !== false || strpos($url, 'unimed') !== false) {
                $ambiente = 'Produção';
            }
        }
        
        $id = sprintf(
            '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            mt_rand(0, 0xffff), mt_rand(0, 0xffff),
            mt_rand(0, 0xffff),
            mt_rand(0, 0x0fff) | 0x4000,
            mt_rand(0, 0x3fff) | 0x8000,
            mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
        );
        
        $query = "
            INSERT INTO saude_testadores_conexoes (
                id, data_hora_login, usuario_id, usuario_nome, usuario_email, usuario_login,
                ip_address, navegador, ambiente, sessao_id, status, data_hora_status
            ) VALUES (?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, 'ONLINE', NOW())
        ";
        
        $params = [
            $id,
            $current_user->id,
            $current_user->user_name,
            $current_user->email1,
            $current_user->user_name,
            $ip_address,
            $navegador,
            $ambiente,
            $sessao_id
        ];
        
        $db->query($query, $params);
    }
}
////	FIM DO SISTEMA DE CONTROLE DE TESTADORES
///////////////////////////////////////////////////////////////////////////////
```

### 4. Verificar Integração

1. Acesse o SuiteCRM
2. Faça login
3. Verifique se aparece o botão "Online" no topo da página (próximo ao nome do usuário)
4. Clique no botão para alterar o status

## Configuração Manual do Botão

Se o botão não aparecer automaticamente, adicione o seguinte código no arquivo `themes/SugarUnimed/header.tpl`, dentro do header:

```smarty
<div id="testadores-status-btn" class="btn-group" style="margin-left: 15px; cursor: pointer;">
    <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fa fa-circle" style="color: #00ff00; margin-right: 5px;"></i> Online
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu">
        <li><a href="#" onclick="toggleStatus('OFFLINE')">Ir para Offline</a></li>
        <li role="separator" class="divider"></li>
        <li><a href="#" onclick="openTestadoresPanel()">Ver testadores</a></li>
    </ul>
</div>
```

## Troubleshooting

### Botão não aparece

- Verifique se o arquivo `testadores.js` foi carregado
- Verifique se o usuário está autenticado
- Verifique se há erros no console do navegador

### Status não atualiza

- Verifique se a API `/api/v1/testadores/status` está funcionando
- Verifique se a tabela `saude_testadores_conexoes` existe e tem dados
- Verifique se há erros no log do PHP

### Dashlet não carrega

- Verifique se a tabela `saude_testadores_conexoes` existe
- Verifique se o usuário tem permissões de leitura
- Verifique se o arquivo `TestadoresOnlineDashlet.php` foi carregado corretamente

## Personalização

### Alterar Intervalo de Atualização

No arquivo `testadores.js`, altere o valor de `refresh_interval`:

```javascript
window.TESTADORES_CONFIG = {
    refresh_interval: 15000, // 15 segundos
    // ...
};
```

### Alterar Cores

No arquivo `custom.css`, altere as cores dos botões:

```css
#testadores-status-btn .btn-success {
    background-color: #00995D; /* Cor da Unimed */
    border-color: #007a4b;
}
```

## Manutenção

### Atualizar JavaScript

Após alterar o arquivo `testadores.js`, limpe o cache do navegador:

```
Ctrl + Shift + R (Windows/Linux)
Cmd + Shift + R (Mac)
```

### Limpar Cache do SuiteCRM

Acesse o SuiteCRM e vá em:

1. Administração > Limpeza do Sistema > Limpar Cache

Ou manualmente:

```
rm -rf cache/images/*
rm -rf cache/js/*
rm -rf cache/modules/*
```