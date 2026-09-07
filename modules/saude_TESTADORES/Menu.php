<?php
/**
 * Menu do módulo saude_TESTADORES
 */
$module_menu = array();

if (strpos($_SESSION['authenticated_user_id'], '-') === false) {
    // Usuário não autenticado, menu vazio
} else {
    $module_menu[] = array(
        "index.php?module=saude_TESTADORES&action=ListView",
        $GLOBALS['app_string_strings']['LBL_MODULE_TITLE'],
        "saude_TESTADORES",
        'saude_TESTADORES'
    );
}