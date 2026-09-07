<?php
/**
 * Configuração do sistema de auditoria
 */

if (!defined('AUDITORIA_HABILITADA')) {
    define('AUDITORIA_HABILITADA', true);
}

// Módulos que devem ser auditados
$GLOBALS['AUDITORIA_MODULOS'] = [
    'saude_CONTRATO',
    'saude_BENEFICIARIOS',
    'saude_TITULO',
    'saude_TESTS_EXECUCAO',
    'saude_TESTS_CENARIOS',
    'saude_TESTS_EVIDENCIAS',
    'saude_TESTS_APROVACOES',
    'saude_TESTS_RESULTADOS',
    'saude_TESTS_VALIDACOES',
    // Módulos padrão do SuiteCRM
    'Accounts',
    'Contacts',
    'Opportunities',
    'Cases',
    'Leads',
    'Tasks',
    'Calls',
    'Meetings',
    'Notes',
    'Emails',
];

// Campos que devem ser protegidos contra alteração manual
$GLOBALS['AUDITORIA_CAMPOS_PROTEGIDOS'] = [
    // Autoria
    'criado_por',
    'criado_por_id',
    'date_entered',
    'modificado_por',
    'modificado_por_id',
    'date_modified',
    
    // Responsabilidade
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
    
    // Fields do SuiteCRM
    'created_by',
    'created_by_name',
    'date_created',
    'modified_user_id',
    'modified_by_name',
    'date_modified',
    'assigned_user_id',
    'assigned_user_name',
];

// Operações que devem ser auditadas
$GLOBALS['AUDITORIA_OPERACOES'] = [
    'CREATE' => 'Criação',
    'UPDATE' => 'Alteração',
    'DELETE' => 'Exclusão',
    'READ' => 'Leitura',
    'APPROVE' => 'Aprovação',
    'REJECT' => 'Reprovação',
    'EXECUTE' => 'Execução',
    'VALIDATE' => 'Validação',
];

// Configurações de logging
$GLOBALS['AUDITORIA_LOG'] = [
    'level' => 'INFO', // DEBUG, INFO, WARN, ERROR, FATAL
    'file' => 'cache/logs/auditoria.log',
    'max_size' => '10MB',
    'max_files' => 10,
];