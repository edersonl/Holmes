<?php
/**
 * Definições da view de lista para saude_TESTADORES
 */
$viewdefs['saude_TESTADORES']['ListView'] = array(
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
        'tempo_conectado_segundos' => array(
            'width' => '10%',
            'label' => 'LBL_TEMPO_CONECTADO',
            'default' => true,
        ),
        'data_hora_logout' => array(
            'width' => '10%',
            'label' => 'LBL_DATA_HORA_LOGOUT',
            'default' => true,
        ),
        'ambiente' => array(
            'width' => '10%',
            'label' => 'LBL_AMBIENTE',
            'default' => false,
        ),
        'ip_address' => array(
            'width' => '10%',
            'label' => 'LBL_IP_ADDRESS',
            'default' => false,
        ),
    ),
    'searchFields' => array(
        'data_hora_login' => array('type' => 'date'),
        'data_hora_logout' => array('type' => 'date'),
        'status' => array('type' => 'enum'),
        'usuario_nome' => array('type' => 'varchar'),
        'usuario_email' => array('type' => 'varchar'),
        'ambiente' => array('type' => 'varchar'),
    ),
);