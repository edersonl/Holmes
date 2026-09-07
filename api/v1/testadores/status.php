<?php
/**
 * API REST para controle de status de testadores
 * endpoint: /v1/testadores/status
 */

require_once('include/entryPoint.php');
require_once('include/auditoria/AuditoriaManager.php');

header('Content-Type: application/json');

// Verifica o método HTTP
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        getStatus();
        break;
    case 'POST':
        updateStatus();
        break;
    case 'PUT':
        updateStatus();
        break;
    default:
        http_response_code(405);
        echo json_encode(['error' => 'Método não permitido']);
        break;
}

/**
 * Obtém o status atual do usuário
 */
function getStatus()
{
    global $current_user, $sugar_config;
    
    $response = [
        'status' => 'success',
        'data' => []
    ];
    
    // Verifica se usuário está autenticado
    if (!isset($current_user) || !is_object($current_user) || empty($current_user->id)) {
        $response['status'] = 'error';
        $response['message'] = 'Usuário não autenticado';
        echo json_encode($response);
        return;
    }
    
    // Informações do usuário
    $usuario_id = $current_user->id;
    $usuario_nome = $current_user->user_name;
    $usuario_email = $current_user->email1;
    $usuario_login = $current_user->user_name;
    
    // Informações da sessão
    $ip_address = $_SERVER['REMOTE_ADDR'] ?? null;
    $navegador = $_SERVER['HTTP_USER_AGENT'] ?? '';
    $ambiente = obterAmbiente();
    $sessao_id = session_id();
    
    // Verifica conexão ativa
    $db = $GLOBALS['db'];
    $query = "
        SELECT id, data_hora_login, status, data_hora_status
        FROM saude_testadores_conexoes
        WHERE usuario_id = ?
        AND status = 'ONLINE'
        ORDER BY data_hora_login DESC
        LIMIT 1
    ";
    
    $result = $db->query($query, [$usuario_id]);
    $row = $db->fetchByAssoc($result);
    
    $data = [
        'usuario_id' => $usuario_id,
        'usuario_nome' => $usuario_nome,
        'usuario_email' => $usuario_email,
        'usuario_login' => $usuario_login,
        'ip_address' => $ip_address,
        'navegador' => $navegador,
        'ambiente' => $ambiente,
        'sessao_id' => $sessao_id,
    ];
    
    if ($row) {
        $data['status'] = $row['status'];
        $data['data_hora_login'] = $row['data_hora_login'];
        $data['data_hora_status'] = $row['data_hora_status'];
        $data['conexoes_ativas'] = true;
    } else {
        $data['status'] = 'OFFLINE';
        $data['conexoes_ativas'] = false;
    }
    
    $response['data'] = $data;
    echo json_encode($response);
}

/**
 * Atualiza o status do usuário (ONLINE/OFFLINE)
 */
function updateStatus()
{
    global $current_user, $sugar_config;
    
    $response = [
        'status' => 'success',
        'data' => []
    ];
    
    // Verifica se usuário está autenticado
    if (!isset($current_user) || !is_object($current_user) || empty($current_user->id)) {
        $response['status'] = 'error';
        $response['message'] = 'Usuário não autenticado';
        echo json_encode($response);
        return;
    }
    
    // Obtém os dados da requisição
    $input = file_get_contents('php://input');
    $data = json_decode($input, true);
    
    if (!isset($data['status']) || !in_array($data['status'], ['ONLINE', 'OFFLINE'])) {
        $response['status'] = 'error';
        $response['message'] = 'Status inválido. Use ONLINE ou OFFLINE';
        echo json_encode($response);
        return;
    }
    
    $novo_status = $data['status'];
    $usuario_id = $current_user->id;
    
    // Informações do usuário
    $usuario_nome = $current_user->user_name;
    $usuario_email = $current_user->email1;
    $usuario_login = $current_user->user_name;
    
    // Informações da sessão
    $ip_address = $_SERVER['REMOTE_ADDR'] ?? null;
    $navegador = $_SERVER['HTTP_USER_AGENT'] ?? '';
    $ambiente = obterAmbiente();
    $sessao_id = session_id();
    
    $db = $GLOBALS['db'];
    
    if ($novo_status === 'ONLINE') {
        // Registra login
        $id = UUID();
        $query = "
            INSERT INTO saude_testadores_conexoes (
                id, data_hora_login, usuario_id, usuario_nome, usuario_email, usuario_login,
                ip_address, navegador, ambiente, sessao_id, status, data_hora_status
            ) VALUES (?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, 'ONLINE', NOW())
        ";
        $params = [$id, $usuario_id, $usuario_nome, $usuario_email, $usuario_login, $ip_address, $navegador, $ambiente, $sessao_id];
        
        if ($db->query($query, $params)) {
            $response['message'] = 'Status alterado para ONLINE';
            $response['data'] = [
                'id' => $id,
                'status' => 'ONLINE',
                'data_hora_login' => date('Y-m-d H:i:s'),
            ];
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao alterar status para ONLINE';
        }
    } else {
        // Registra logout
        // Encontra a conexão ativa
        $query = "
            SELECT id, data_hora_login, data_hora_logout
            FROM saude_testadores_conexoes
            WHERE usuario_id = ?
            AND status = 'ONLINE'
            ORDER BY data_hora_login DESC
            LIMIT 1
        ";
        
        $result = $db->query($query, [$usuario_id]);
        $row = $db->fetchByAssoc($result);
        
        if ($row) {
            $data_hora_login = $row['data_hora_login'];
            $data_hora_logout = date('Y-m-d H:i:s');
            
            // Calcula tempo conectado
            $tempo_conectado = strtotime($data_hora_logout) - strtotime($data_hora_login);
            
            // Atualiza o registro
            $query = "
                UPDATE saude_testadores_conexoes
                SET data_hora_logout = ?,
                    tempo_conectado_segundos = ?,
                    status = 'OFFLINE',
                    data_hora_status = NOW()
                WHERE id = ?
            ";
            
            $params = [$data_hora_logout, $tempo_conectado, $row['id']];
            
            if ($db->query($query, $params)) {
                $response['message'] = 'Status alterado para OFFLINE';
                $response['data'] = [
                    'id' => $row['id'],
                    'status' => 'OFFLINE',
                    'data_hora_login' => $data_hora_login,
                    'data_hora_logout' => $data_hora_logout,
                    'tempo_conectado_segundos' => $tempo_conectado,
                ];
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Erro ao alterar status para OFFLINE';
            }
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Nenhuma conexão ativa encontrada para este usuário';
        }
    }
    
    echo json_encode($response);
}

/**
 * Obtém o ambiente atual
 */
function obterAmbiente()
{
    global $sugar_config;
    
    $url = isset($sugar_config['site_url']) ? $sugar_config['site_url'] : '';
    
    if (strpos($url, 'localhost') !== false || strpos($url, '192.168.1.78') !== false) {
        return 'Desenvolvimento';
    } elseif (strpos($url, 'homologa') !== false || strpos($url, 'qualidade') !== false) {
        return 'Homologação';
    } elseif (strpos($url, 'producao') !== false || strpos($url, 'unimed') !== false) {
        return 'Produção';
    }
    
    return 'Desconhecido';
}

/**
 * Gera UUID
 */
function UUID()
{
    return sprintf(
        '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        // 32 bits for "time_low"
        mt_rand(0, 0xffff), mt_rand(0, 0xffff),
        // 16 bits for "time_mid"
        mt_rand(0, 0xffff),
        // 16 bits for "time_hi_and_version",
        // four most significant bits holds version number 4
        mt_rand(0, 0x0fff) | 0x4000,
        // 16 bits for "clock_seq_hi_and_reserved",
        // four most significant bits holds the two most significant bits of clock sequence
        mt_rand(0, 0x3fff) | 0x8000,
        // 48 bits for "node"
        mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
    );
}