<?php
/**
 * Hook para entryPoint - Registra login automático de usuários
 * Adicionar ao final do entryPoint.php após a inicialização do current_user
 */

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

// Verifica se o usuário está autenticado
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
        
        $id = UUID();
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

/**
 * Gera UUID
 */
function UUID()
{
    return sprintf(
        '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        mt_rand(0, 0xffff), mt_rand(0, 0xffff),
        mt_rand(0, 0xffff),
        mt_rand(0, 0x0fff) | 0x4000,
        mt_rand(0, 0x3fff) | 0x8000,
        mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
    );
}