<?php
/**
 * AuditoriaBeanHelper - Integração com SugarBean para auditoria automática
 * Monitora todas as operações de create, update, delete e registra na auditoria
 */

if (!class_exists('AuditoriaBeanHelper')) {
    class AuditoriaBeanHelper
    {
        /**
         * Hook para pré-create
         * Registra informações antes da criação
         */
        public static function beforeCreate($bean, $event, $arguments)
        {
            global $current_user;
            
            if (!AUDITORIA_HABILITADA) {
                return;
            }
            
            // Define o usuário atual como criador se não estiver definido
            if (empty($bean->id_criado_por) && !empty($current_user->id)) {
                $bean->id_criado_por = $current_user->id;
                $bean->nome_criado_por = $current_user->user_name;
            }
            
            // Valida se o usuário está tentando alterar campos de auditoria
            self::validarCamposAuditoria($bean);
        }
        
        /**
         * Hook para pós-create
         * Registra criação na auditoria
         */
        public static function afterCreate($bean, $event, $arguments)
        {
            if (!AUDITORIA_HABILITADA) {
                return;
            }
            
            $auditoria = new AuditoriaManager();
            $modulo = $bean->module_dir;
            $tela = self::obterTelaAtual();
            $entidade = $bean->module_name;
            $registro_id = $bean->id;
            
            $auditoria->registrarCriacao(
                $modulo,
                $tela,
                $entidade,
                $registro_id,
                "Criou registro em {$modulo}",
                $bean->toArray()
            );
        }
        
        /**
         * Hook para pré-update
         * Registra informações antes da atualização
         */
        public static function beforeUpdate($bean, $event, $arguments)
        {
            if (!AUDITORIA_HABILITADA) {
                return;
            }
            
            // Valida se o usuário está tentando alterar campos de auditoria
            self::validarCamposAuditoria($bean);
        }
        
        /**
         * Hook para pós-update
         * Registra atualização na auditoria
         */
        public static function afterUpdate($bean, $event, $arguments)
        {
            if (!AUDITORIA_HABILITADA) {
                return;
            }
            
            $auditoria = new AuditoriaManager();
            $modulo = $bean->module_dir;
            $tela = self::obterTelaAtual();
            $entidade = $bean->module_name;
            $registro_id = $bean->id;
            
            // Obtém dados anteriores (se disponíveis)
            $dados_anteriores = null;
            if (!empty($arguments['old_values'])) {
                $dados_anteriores = $arguments['old_values'];
            }
            
            $auditoria->registrarAtualizacao(
                $modulo,
                $tela,
                $entidade,
                $registro_id,
                "Alterou registro em {$modulo}",
                $dados_anteriores,
                $bean->toArray()
            );
        }
        
        /**
         * Hook para pós-delete
         * Registra exclusão na auditoria
         */
        public static function afterDelete($bean, $event, $arguments)
        {
            if (!AUDITORIA_HABILITADA) {
                return;
            }
            
            $auditoria = new AuditoriaManager();
            $modulo = $bean->module_dir;
            $tela = self::obterTelaAtual();
            $entidade = $bean->module_name;
            $registro_id = $bean->id;
            
            $auditoria->registrarExclusao(
                $modulo,
                $tela,
                $entidade,
                $registro_id,
                "Excluiu registro em {$modulo}",
                $bean->toArray()
            );
        }
        
        /**
         * Valida se o usuário está tentando alterar campos de auditoria
         * Retorna true se válido, false se tentativa de manipulação
         */
        public static function validarCamposAuditoria($bean)
        {
            $auditoria = new AuditoriaManager();
            $data = $bean->toArray();
            $modulo = $bean->module_dir;
            $entidade = $bean->module_name;
            $registro_id = $bean->id;
            
            return $auditoria->validarCamposAuditoria($data, $modulo, $entidade, $registro_id);
        }
        
        /**
         * Obtém a tela atual
         */
        private static function obterTelaAtual()
        {
            $tela = 'Não especificado';
            
            if (isset($_REQUEST['action'])) {
                $tela = $_REQUEST['action'];
            } elseif (isset($_REQUEST['return_action'])) {
                $tela = $_REQUEST['return_action'];
            } elseif (isset($_SERVER['REQUEST_URI'])) {
                $tela = basename($_SERVER['REQUEST_URI']);
            }
            
            return $tela;
        }
    }
}