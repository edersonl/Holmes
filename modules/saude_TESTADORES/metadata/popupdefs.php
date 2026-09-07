<?php
/**
 * Definições de popup para saude_TESTADORES
 */
$viewdefs['saude_TESTADORES']['PopupView'] = array(
    'searchFields' => array(
        'data_hora_login' => array('type' => 'date'),
        'data_hora_logout' => array('type' => 'date'),
        'status' => array('type' => 'enum'),
        'usuario_nome' => array('type' => 'varchar'),
        'usuario_email' => array('type' => 'varchar'),
        'ambiente' => array('type' => 'varchar'),
    ),
    'columns' => array(
        'data_hora_login' => array(
            'width' => '10%',
            'label' => 'LBL_DATA_HORA_LOGIN',
            'default' => true,
            'link' => true,
        ),
        'status' => array(
            'width' => '10%',
            'label' => 'LBL_STATUS',
            'default' => true,
        ),
        'usuario_nome' => array(
            'width' => '15%',
            'label' => 'LBL_USUARIO_NOME',
            'default' => true,
            'link' => true,
        ),
        'usuario_email' => array(
            'width' => '20%',
            'label' => 'LBL_USUARIO_EMAIL',
            'default' => true,
        ),
    ),
);