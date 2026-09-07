<?php
/**
 * Definições da view de edição para saude_TESTADORES
 */
$viewdefs['saude_TESTADORES']['EditView'] = array(
    'templateMeta' => array(
        'form' => array('enctype' => 'multipart/form-data'),
        'maxColumns' => '2',
        'widths' => array(
            array('label' => '10', 'field' => '30'),
            array('label' => '10', 'field' => '30'),
        ),
    ),
    'panels' => array(
        'default' => array(
            array(
                array(
                    'name' => 'data_hora_login',
                    'displayParams' => array('readonly' => true),
                ),
                array(
                    'name' => 'data_hora_logout',
                    'displayParams' => array('readonly' => true),
                ),
            ),
            array(
                array(
                    'name' => 'tempo_conectado_segundos',
                    'displayParams' => array('readonly' => true),
                ),
                array(
                    'name' => 'status',
                    'displayParams' => array('readonly' => true),
                ),
            ),
            array(
                array(
                    'name' => 'usuario_nome',
                    'displayParams' => array('readonly' => true),
                ),
                array(
                    'name' => 'usuario_email',
                    'displayParams' => array('readonly' => true),
                ),
            ),
            array(
                array(
                    'name' => 'usuario_login',
                    'displayParams' => array('readonly' => true),
                ),
                array(
                    'name' => 'ip_address',
                    'displayParams' => array('readonly' => true),
                ),
            ),
            array(
                array(
                    'name' => 'navegador',
                    'displayParams' => array('readonly' => true),
                ),
                array(
                    'name' => 'ambiente',
                    'displayParams' => array('readonly' => true),
                ),
            ),
        ),
    ),
);