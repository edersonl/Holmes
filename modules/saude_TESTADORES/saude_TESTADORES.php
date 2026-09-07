<?php
/**
 * Class definition for saude_TESTADORES
 */
if (!class_exists('saude_TESTADORES')) {
    class saude_TESTADORES extends SugarBean
    {
        // Variables com o mesmo nome que os campos do vardefs.php
        public $id;
        public $data_hora_login;
        public $data_hora_logout;
        public $tempo_conectado_segundos;
        public $usuario_id;
        public $usuario_nome;
        public $usuario_email;
        public $usuario_login;
        public $ip_address;
        public $navegador;
        public $ambiente;
        public $sessao_id;
        public $status;
        public $data_hora_status;
        public $criado_em;
        public $modificado_em;
        public $name;
        
        // Tabela associada
        public $table_name = 'saude_testadores_conexoes';
        
        // Nome do módulo
        public $module_dir = 'saude_TESTADORES';
        
        // Nome do objeto
        public $object_name = 'saude_TESTADORES';
        
        // Class name
        public $module_name = 'saude_TESTADORES';
        
        // SugarBean
        public $new_schema = true;
        public $schema_version = 'v1.0.0';
        
        // Lista de campos para busca unificada
        public $search_fields = array();
        
        /**
         * Construtor
         */
        public function __construct()
        {
            parent::__construct();
        }
        
        /**
         * Retorna o nome do módulo
         */
        public function get_module_title()
        {
            return $this->getModuleName();
        }
        
        /**
         * Retorna o nome do módulo
         */
        public function getModuleName()
        {
            return $this->module_name;
        }
    }
}