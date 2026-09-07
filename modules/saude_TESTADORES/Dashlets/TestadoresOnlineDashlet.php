<?php
/**
 * Dashlet de Testadores Online
 * Exibe em tempo real os testadores conectados
 */

if (!class_exists('TestadoresOnlineDashlet')) {
    class TestadoresOnlineDashlet extends SugarDashlet
    {
        /**
         * Constructor
         */
        public function __construct($id, $definition = [], $options = [])
        {
            parent::__construct($id, $definition, $options);
            
            $this->title = $GLOBALS['app_string_strings']['LBL_MODULE_TITLE'];
            $this->description = 'Visualize quem está online para execução de testes';
            $this->height = '400px';
            $this->width = '250px';
            $this->cssClass = 'testadores-dashlet';
            $this->useThemeLayout = true;
            
            // Configurações
            $this->config = [
                'refresh_interval' => 30, // segundos
                'show_email' => true,
                'show_status' => true,
            ];
        }
        
        /**
         * Exibe o dashlet
         */
        public function display()
        {
            global $current_user, $sugar_config;
            
            $db = $GLOBALS['db'];
            
            // Obtém testadores online
            $query = "
                SELECT 
                    t.id,
                    t.usuario_id,
                    t.usuario_nome,
                    t.usuario_email,
                    t.usuario_login,
                    t.data_hora_login,
                    t.status,
                    TIMESTAMPDIFF(SECOND, t.data_hora_login, NOW()) as segundos_online,
                    TIMESTAMPSEC_TO_TIME(TIMESTAMPDIFF(SECOND, t.data_hora_login, NOW())) as tempo_formatado
                FROM saude_testadores_conexoes t
                WHERE t.status = 'ONLINE'
                ORDER BY t.data_hora_login ASC
            ";
            
            $result = $db->query($query);
            $testadores = [];
            
            while ($row = $db->fetchByAssoc($result)) {
                $testadores[] = $row;
            }
            
            // Carrega template
            $this->ss->assign('testadores', $testadores);
            $this->ss->assign('refresh_interval', $this->config['refresh_interval']);
            $this->ss->assign('show_email', $this->config['show_email']);
            $this->ss->assign('show_status', $this->config['show_status']);
            
            return $this->ss->fetch('modules/saude_TESTADORES/tpls/TestadoresOnlineDashlet.tpl');
        }
        
        /**
         * Exibe o config do dashlet
         */
        public function displayOptions()
        {
            return parent::displayOptions();
        }
        
        /**
         * Salva as configurações
         */
        public function saveOptions($request)
        {
            if (isset($request['refresh_interval'])) {
                $this->config['refresh_interval'] = (int)$request['refresh_interval'];
            }
            if (isset($request['show_email'])) {
                $this->config['show_email'] = (bool)$request['show_email'];
            }
            if (isset($request['show_status'])) {
                $this->config['show_status'] = (bool)$request['show_status'];
            }
            
            return true;
        }
        
        /**
         * Define as configurações
         */
        public function setOptions($options)
        {
            if (isset($options['refresh_interval'])) {
                $this->config['refresh_interval'] = $options['refresh_interval'];
            }
            if (isset($options['show_email'])) {
                $this->config['show_email'] = $options['show_email'];
            }
            if (isset($options['show_status'])) {
                $this->config['show_status'] = $options['show_status'];
            }
        }
    }
}