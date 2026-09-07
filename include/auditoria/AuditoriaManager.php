<?php
/**
 * AuditoriaManager - Sistema de auditoria centralizada
 * Gerencia o registro de todas as operações com usuário, data/hora e operação
 */

if (!class_exists('AuditoriaManager')) {
    class AuditoriaManager
    {
        private $db;
        private $user_id;
        private $user_name;
        private $user_email;
        private $user_login;
        private $ip_address;
        private $user_agent;
        private $session_id;
        private $enabled = true;
        
        /**
         * Construtor
         */
        public function __construct()
        {
            global $sugar_config, $current_user;
            
            // Conexão com o banco de dados
            $this->db = $GLOBALS['db'];
            
            // Informações do usuário da sessão
            if (isset($current_user) && is_object($current_user)) {
                $this->user_id = $current_user->get('id');
                $this->user_name = $current_user->get('user_name');
                $this->user_email = $current_user->get('email1');
                $this->user_login = $current_user->get('user_name');
            } else {
                // Fallback para informações da sessão
                $this->user_id = isset($_SESSION['authenticated_user_id']) ? $_SESSION['authenticated_user_id'] : null;
                $this->user_name = isset($_SESSION['authenticated_user_name']) ? $_SESSION['authenticated_user_name'] : null;
                $this->user_email = isset($_SESSION['authenticated_user_email']) ? $_SESSION['authenticated_user_email'] : null;
                $this->user_login = isset($_SESSION['authenticated_user_login']) ? $_SESSION['authenticated_user_login'] : null;
            }
            
            // Informações do servidor
            $this->ip_address = $this->getIpAddress();
            $this->user_agent = isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : '';
            $this->session_id = session_id();
        }
        
        /**
         * Obtém o endereço IP do usuário
         */
        private function getIpAddress()
        {
            $ip_keys = ['HTTP_CLIENT_IP', 'HTTP_X_FORWARDED_FOR', 'HTTP_X_FORWARDED', 'HTTP_X_CLUSTER_CLIENT_IP', 'HTTP_FORWARDED_FOR', 'HTTP_FORWARDED', 'REMOTE_ADDR'];
            foreach ($ip_keys as $key) {
                if (isset($_SERVER[$key])) {
                    $ip = $_SERVER[$key];
                    if (strpos($ip, ',') !== false) {
                        $ips = explode(',', $ip);
                        $ip = trim(end($ips));
                    }
                    if (filter_var($ip, FILTER_VALIDATE_IP)) {
                        return $ip;
                    }
                }
            }
            return isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : null;
        }
        
        /**
         * Registra uma operação de auditoria
         */
        public function registrarOperacao($operacao, $modulo, $tela, $entidade, $registro_id, $descricao = '', $dados_anteriores = null, $dados_novos = null)
        {
            if (!$this->enabled) {
                return false;
            }
            
            // Validação dos parâmetros
            if (empty($operacao) || empty($modulo) || empty($tela) || empty($entidade)) {
                return false;
            }
            
            // Formata os dados como JSON se forem arrays
            if (is_array($dados_anteriores)) {
                $dados_anteriores = json_encode($dados_anteriores);
            }
            if (is_array($dados_novos)) {
                $dados_novos = json_encode($dados_novos);
            }
            
            // Insert na tabela de auditoria
            $query = "
                INSERT INTO saude_auditoria (
                    id, usuario_id, usuario_nome, usuario_email, usuario_login,
                    operacao, modulo, tela, entidade, registro_id, descricao,
                    dados_anteriores, dados_novos, ip_address, navegador, sessao_id, data_hora
                ) VALUES (
                    ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW()
                )
            ";
            
            $params = [
                UUID(),
                $this->user_id,
                $this->user_name,
                $this->user_email,
                $this->user_login,
                $operacao,
                $modulo,
                $tela,
                $entidade,
                $registro_id,
                $descricao,
                $dados_anteriores,
                $dados_novos,
                $this->ip_address,
                $this->user_agent,
                $this->session_id
            ];
            
            try {
                $result = $this->db->query($query, $params);
                return $result !== false;
            } catch (Exception $e) {
                // Log do erro mas continua a execução
                error_log("Erro ao registrar auditoria: " . $e->getMessage());
                return false;
            }
        }
        
        /**
         * Registra operação de criação
         */
        public function registrarCriacao($modulo, $tela, $entidade, $registro_id, $descricao = '', $dados = null)
        {
            return $this->registrarOperacao('CREATE', $modulo, $tela, $entidade, $registro_id, $descricao, null, $dados);
        }
        
        /**
         * Registra operação de atualização
         */
        public function registrarAtualizacao($modulo, $tela, $entidade, $registro_id, $descricao = '', $dados_anteriores = null, $dados_novos = null)
        {
            return $this->registrarOperacao('UPDATE', $modulo, $tela, $entidade, $registro_id, $descricao, $dados_anteriores, $dados_novos);
        }
        
        /**
         * Registra operação de exclusão
         */
        public function registrarExclusao($modulo, $tela, $entidade, $registro_id, $descricao = '', $dados = null)
        {
            return $this->registrarOperacao('DELETE', $modulo, $tela, $entidade, $registro_id, $descricao, $dados, null);
        }
        
        /**
         * Registra operação de leitura
         */
        public function registrarLeitura($modulo, $tela, $entidade, $registro_id, $descricao = '')
        {
            return $this->registrarOperacao('READ', $modulo, $tela, $entidade, $registro_id, $descricao);
        }
        
        /**
         * Registra operação de aprovação
         */
        public function registrarAprovacao($modulo, $tela, $entidade, $registro_id, $descricao = '')
        {
            return $this->registrarOperacao('APPROVE', $modulo, $tela, $entidade, $registro_id, $descricao);
        }
        
        /**
         * Registra operação de reprovação
         */
        public function registrarReprovacao($modulo, $tela, $entidade, $registro_id, $descricao = '')
        {
            return $this->registrarOperacao('REJECT', $modulo, $tela, $entidade, $registro_id, $descricao);
        }
        
        /**
         * Registra operação de execução
         */
        public function registrarExecucao($modulo, $tela, $entidade, $registro_id, $descricao = '')
        {
            return $this->registrarOperacao('EXECUTE', $modulo, $tela, $entidade, $registro_id, $descricao);
        }
        
        /**
         * Registra operação de validação
         */
        public function registrarValidacao($modulo, $tela, $entidade, $registro_id, $descricao = '')
        {
            return $this->registrarOperacao('VALIDATE', $modulo, $tela, $entidade, $registro_id, $descricao);
        }
        
        /**
         * Verifica e sanitiza campos de auditoria em dados de entrada
         * Retorna true se os dados são válidos, false caso contrário
         */
        public function validarCamposAuditoria($data, $modulo, $entidade, $registro_id = null)
        {
            // Lista de campos que devem ser somente leitura e validados
            $campos_auditoria = [
                'criado_por',
                'criado_por_id',
                'date_entered',
                'modificado_por',
                'modificado_por_id',
                'date_modified',
                'executor',
                'responsavel',
                'analista',
                'testador',
                'aprovado_por',
                'reprovado_por',
                'validado_por',
                'proprietario',
                'solicitante',
                'revisor',
            ];
            
            // Verifica se o usuário está autenticado
            if (empty($this->user_id)) {
                // Se não houver usuário autenticado, permite a operação mas registra na auditoria
                return true;
            }
            
            // Verifica se o usuário está tentando alterar campos somente leitura
            foreach ($campos_auditoria as $campo) {
                if (isset($data[$campo]) && !empty($data[$campo])) {
                    // Se o valor enviado for diferente do valor do usuário autenticado, bloqueia
                    $valor_enviado = $data[$campo];
                    $valor_correto = $this->user_id;
                    
                    if ($valor_enviado !== $valor_correto && !is_null($valor_correto)) {
                        // Registra tentativa de manipulação
                        $this->registrarOperacao(
                            'AUDIT_BLOCKED',
                            $modulo,
                            'API',
                            $entidade,
                            $registro_id,
                            "Tentativa de alteração de campo somente leitura: {$campo}. Enviado: {$valor_enviado}, Esperado: {$valor_correto}"
                        );
                        return false;
                    }
                }
            }
            
            return true;
        }
        
        /**
         * Retorna o ID do usuário atual
         */
        public function getUsuarioId()
        {
            return $this->user_id;
        }
        
        /**
         * Retorna o nome do usuário atual
         */
        public function getUsuarioNome()
        {
            return $this->user_name;
        }
        
        /**
         * Retorna o e-mail do usuário atual
         */
        public function getUsuarioEmail()
        {
            return $this->user_email;
        }
        
        /**
         * Retorna o login do usuário atual
         */
        public function getUsuarioLogin()
        {
            return $this->user_login;
        }
        
        /**
         * Habilita a auditoria
         */
        public function habilitar()
        {
            $this->enabled = true;
        }
        
        /**
         * Desabilita a auditoria
         */
        public function desabilitar()
        {
            $this->enabled = false;
        }
    }
}