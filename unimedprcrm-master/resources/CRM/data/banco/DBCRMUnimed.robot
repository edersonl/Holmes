
*** Settings ***
Resource    ../../../../main.resource
Library    DatabaseLibrary
Library    DebugLibrary

*** Variables ***
# Exemplo:
# ${DB_CONNECT_STRING} =    'user/mypasswd@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=myipaddress)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=mysid)))'
@{LIST_COD_PLA_FAMILIAR}
@{LIST_COD_PLN_ASSIST}
${size_list}=   0
${DB_NAME}=    neg116        # qualidade 116
${DB_USER}=    root
${DB_PASS}=    Crm975

# base QA PLSQL:
${DB_CONNECT_STRING} =    '${DB_USER}/${DB_PASS}@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP) (Host = 192.168.1.100) (Port=10110))) (CONNECT_DATA=(SID=prod187)))'

# Base MySql - Qualidade
${DBHostMySql}         192.168.1.79
${DBNameMySql}         qualidade
# ${DBNameMySql}         homologa187
${DBPassMySql}         Crm975
${DBPortMySql}         3306
${DBUserMySql}         root

${DB_MYSQL_CONNECT_STRING} =    database='${DBNameMySql}', user='${DBUserMySql}', password='${DBPassMySql}', host='${DBHostMySql}', port=${DBPortMySql}


*** Keywords ***
ConnectDatabase
    connect to database using custom params    cx_Oracle    ${DB_CONNECT_STRING}

DisconnectDatabase
    disconnect from database

ConnectDatabaseMySql
    Connect To Database Using Custom Params  pymysql    ${DB_MYSQL_CONNECT_STRING}

DisconnectDatabaseMySql
    disconnect from database

###  novos cenario 1 ####
Query - Consultar Plano Coletivo Empresarial SG
    ConnectDatabase
    @{QUERY_PLANO}=      Query       SELECT DISTINCT C.PLA_NUMERO, C.PLN_CODIGO, P.PDT_CODIGO FROM combinacao C INNER JOIN PLANO_PRODUTO PP ON C.PLA_NUMERO=PP.PLA_NUMERO INNER JOIN PRODUTO P ON PP.PDT_CODIGO=P.PDT_CODIGO WHERE C.PLN_DT_EXC IS NULL AND PP.PLP_DT_EXC IS NULL AND P.PDT_DT_EXC IS NULL AND PP.PLP_COBRA_MENS='N' AND C.PLN_DESCRICAO like 'COLETIVO EMPRESARIAL%' ORDER BY C.PLA_NUMERO ASC

    ${SIZE}     Get Length     ${QUERY_PLANO}
    IF      $SIZE < 1
        Log To Console      Nenhum Codigo de planos Coletivo Empresarial encontrado
        Fail        Nenhum Codigo de planos Coletivo Empresarial encontrado
        DisconnectDatabase
    ELSE
        Log        Quantidade: ${SIZE}
        Log        Codigos Planos: @{QUERY_PLANO}
        ${TEST}     Convert To List     ${QUERY_PLANO}
        ${str_tuple}     Convert To String   ${TEST[0]}
        ${str_pla_cod}      Get Substring       ${str_tuple}     1   4
        ${str_pla_cod}    Remover Caracteres Especiais    ${str_pla_cod}
        Log     ${QUERY_PLANO}
        Log     ${str_pla_cod}
        Set Global Variable    ${str_pla_cod}
        Set Global Variable    ${QUERY_PLANO}
        ${GLOBAL_NAME_PLA_EMPRESARIAL} =     Catenate     ${str_pla_cod}
        ${GLOBAL_NAME_PLA_EMPRESARIAL_2} =     Catenate     ${QUERY_PLANO[40][0]}
        Set Global Variable    ${GLOBAL_NAME_PLA_EMPRESARIAL}
        Set Global Variable    ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
        DisconnectDatabase
        
        Query - Consulta CRM Plano Coletivo Empresarial MYSQL     ${str_pla_cod}
    END    

Query - Consulta CRM Plano Coletivo Empresarial MYSQL
    [Arguments]            ${PLA_COD_SG_1}
    ConnectDatabaseMySql
    ${CONSULTA_PLANO}=     catenate
    ...    SELECT DISTINCT pla_cod_c FROM aos_product_categories_cstm
    ...    INNER JOIN aos_product_categories ON id_c=id
    ...    WHERE pla_cod_c IN('${PLA_COD_SG_1}')
    ...    AND deleted=0;
    ${CONSULTA_PLANO}    Query    ${CONSULTA_PLANO}
    ${lenght}    Get Length     ${CONSULTA_PLANO} 
    IF   $lenght > 0
        Log To Console    Plano Coletivo empresarial: ${CONSULTA_PLANO}
        Log    Plano Coletivo Empresarial CRM: ${CONSULTA_PLANO}
    ELSE
        Log    Erro! nenhum dado encontrado.... ${CONSULTA_PLANO}
        Fail    Erro! nenhum dado encontrado.... Query vazia
    END
    DisconnectDatabaseMySql

###  novos cenario 2 ####
Query - Consultar Produtos Assistenciais Coletivo Empresarial com Tabela de Preço SG
    [Arguments]        ${RESULT_QUERY_PLA}
    ConnectDatabase
    ${QUERY_PLSQL_ASSIST}=     catenate
    ...    SELECT DISTINCT C.PLA_NUMERO, C.PLN_CODIGO, P.PDT_CODIGO
    ...    FROM   combinacao C
    ...    INNER JOIN PLANO_PRODUTO PP ON C.PLA_NUMERO=PP.PLA_NUMERO
    ...    INNER JOIN PRODUTO P ON PP.PDT_CODIGO=P.PDT_CODIGO
    ...    WHERE  C.PLN_DT_EXC IS NULL
    ...    AND    PP.PLP_DT_EXC IS NULL
    ...    AND    P.PDT_DT_EXC IS NULL
    ...    AND    PP.PLP_COBRA_MENS='N'
    ...    AND    C.PLN_DESCRICAO like 'COLETIVO EMPRESARIAL%'
    ...    AND    C.PLA_NUMERO IN ('${RESULT_QUERY_PLA}')
    ...    ORDER BY C.PLN_CODIGO ASC
    ${QUERY_PLSQL_ASSIST}    Query    ${QUERY_PLSQL_ASSIST}
    ${length}       Get Length      ${QUERY_PLSQL_ASSIST}
    IF  $length > 0
        Log To Console    Produto Assistencial com tabela de preço: ${QUERY_PLSQL_ASSIST}
        Log     Produto Assistencial com tabela de preço: ${QUERY_PLSQL_ASSIST}
        Set Global Variable  ${QUERY_PLSQL_ASSIST}
        ${GLOBAL_ASSISTENCIAL_EMPRESARIAL} =     Catenate        ${QUERY_PLSQL_ASSIST[0][1]}
        ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2} =     Catenate        ${QUERY_PLSQL_ASSIST[9][1]}
        Set Global Variable  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
        Set Global Variable  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
        DisconnectDatabase
        Query - Consulta no CRM Produtos Assistenciais Coletivo Empresarial com Tabela de Preço MYSQL       ${QUERY_PLSQL_ASSIST[0][1]} 
    ELSE
        DisconnectDatabase
        Log To Console    Erro, Nenhum Produto Assistencial Coletivo Empresarial com tabela de preço
    END


Query - Consulta no CRM Produtos Assistenciais Coletivo Empresarial com Tabela de Preço MYSQL
    [Arguments]             ${PDT_COD_SG_2}
    ConnectDatabaseMySql
    ${QUERY_2_MYSQL}=     catenate
    ...    SELECT	prodass.part_number FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    WHERE prodassc.tipo_c = 'assistencial'
    ...    AND prodass.part_number IN('${PDT_COD_SG_2}')
    ...    AND prodass.deleted = 0;
    ${QUERY_2_MYSQL}    Query    ${QUERY_2_MYSQL}
    ${lenght2}    Get Length     ${QUERY_2_MYSQL} 
    IF   $lenght2 > 0
        Log To Console    Plano produtos assistenciais: ${QUERY_2_MYSQL}
        Log    Plano com produtos assistenciais com tabela de preço: ${QUERY_2_MYSQL}
    ELSE
        Log    Erro! nenhum dado encontrado....
    END
    DisconnectDatabaseMySql


###  cenario 3 ####
Query - Consultar Produtos Acessorios Coletivo Empresarial com tabela de preço SG
    [Arguments]             ${RESULT_QUERY_PLA}
    ConnectDatabase
    ${QUERY_PLSQL_ACESSOR}=     catenate
    ...    SELECT DISTINCT C.PLA_NUMERO, C.PLN_CODIGO, PP.PDT_CODIGO
    ...    FROM   combinacao C
    ...    INNER JOIN PLANO_PRODUTO PP ON C.PLA_NUMERO=PP.PLA_NUMERO
    ...    INNER JOIN PRODUTO P ON PP.PDT_CODIGO=P.PDT_CODIGO
    ...    WHERE  C.PLN_DT_EXC IS NULL
    ...    AND    PP.PLP_DT_EXC IS NULL
    ...    AND    P.PDT_DT_EXC IS NULL
    ...    AND    PP.PLP_COBRA_MENS='N'
    ...    AND    C.PLN_DESCRICAO like 'COLETIVO EMPRESARIAL%'
    ...    AND    C.PLA_NUMERO IN ('${RESULT_QUERY_PLA}')
    ...     ORDER BY PP.PDT_CODIGO ASC
    ${QUERY_PLSQL_ACESSOR}    Query    ${QUERY_PLSQL_ACESSOR}
    ${lenght3}    Get Length     ${QUERY_PLSQL_ACESSOR} 
    IF   $lenght3 > 0
        Log To Console    Plano produtos acessorio: ${QUERY_PLSQL_ACESSOR}
        Log    Plano com produtos acessorios com tabela de preço: ${QUERY_PLSQL_ACESSOR}
        Set Global Variable     ${QUERY_PLSQL_ACESSOR}
        DisconnectDatabase
        Query - Consulta no CRM Produtos Acessorios com tabela de preço MYSQL     ${QUERY_PLSQL_ACESSOR[0][2]}
    ELSE
        Log    Erro! nenhum Plano com produtos acessorios com tabela de preço ... ${QUERY_PLSQL_ACESSOR}
        DisconnectDatabase
        Fail    Erro! nenhum Plano com produtos acessorios com tabela de preço
    END

###  cenario 3 ####
Query - Consulta no CRM Produtos Acessorios com tabela de preço MYSQL
    [Arguments]         ${PLA_COD_SG_3}
    ConnectDatabaseMySql
    ${QUERY_3_MYSQL}=     catenate
    ...    SELECT	prodass.part_number FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    WHERE prodass.part_number IN('${PLA_COD_SG_3}')
    ...    AND prodass.deleted = 0;
    ${QUERY_3_MYSQL}        Query    ${QUERY_3_MYSQL}
    ${lenght3}    Get Length     ${QUERY_3_MYSQL} 
    IF   $lenght3 > 0
        Log To Console    Plano com produtos acessorios com tabela de preço: ${QUERY_3_MYSQL}
        Log    Plano com produtos acessorios com tabela de preço: ${QUERY_3_MYSQL}
    ELSE
        Log To Console    Plano com produtos acessorios com tabela de preço
    END
    DisconnectDatabaseMySql

### CENARIO 04 ####
Query - Consulta no CRM Vinculo de Produtos Acessorios em Produtos Assistenciais Coletivo Empresarial MYSQL
    ConnectDatabaseMySql
    ${QUERY_4_MYSQL}=     catenate
    ...    SELECT	planprodass.pla_cod_c PLANO, prodass.part_number AS ASSISTENCIAL,	
    ...    (	SELECT GROUP_CONCAT(prodaceperm.part_number) FROM aos_products_aos_products_2_c prodperm
	...    	LEFT JOIN aos_products prodaceperm ON prodaceperm.id = prodperm.aos_products_aos_products_2aos_products_idb
    ...        INNER JOIN saude_preco_aos_products_c precoac ON precoac.saude_preco_aos_productsaos_products_idb = prodaceperm.id AND precoac.deleted = 0
	...    	INNER JOIN saude_preco preco ON preco.id = precoac.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
	...    	WHERE prodperm.aos_products_aos_products_2aos_products_ida = prodass.id 
	...    	AND prodperm.deleted = 0) AS ACES_PERMITIDOS
    ...    FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    INNER JOIN aos_product_categories_cstm planprodass on planprodass.id_c=prodass.aos_product_category_id
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    WHERE prodass.part_number IN('${QUERY_PLSQL_ASSIST[0][1]}')
    ...    AND prodass.deleted = 0;
    ${QUERY_4_MYSQL}    Query    ${QUERY_4_MYSQL}
    ${size}     Get Length      ${QUERY_4_MYSQL}
    IF   $size > 0
        Log    Vinculos de produtos Acessorio em Assistencial: ${QUERY_4_MYSQL}
    
    ELSE
        Log To Console  Erro nenhum Vinculos de produtos Acessorio em Assistencial
        Fail        Erro nenhum Vinculos de produtos Acessorio em Assistencial
    END
    DisconnectDatabaseMySql


####### CENARIO 05 ########
####### CENARIO 13 ########
####### CENARIO 21 ########
Query - Consultar no CRM Vinculo de alçada de produtos assistenciais MYSQL
    ConnectDatabaseMySql
    ${QUERY_5_MYSQL}=     catenate
    ...    SELECT	planprodass.pla_cod_c PLANO, prodass.part_number AS ASSISTENCIAL,	
    ...    (	SELECT GROUP_CONCAT(prodaceperm.part_number) FROM aos_products_aos_products_2_c prodperm
	...    	LEFT JOIN aos_products prodaceperm ON prodaceperm.id = prodperm.aos_products_aos_products_2aos_products_idb
    ...     INNER JOIN saude_preco_aos_products_c precoac ON precoac.saude_preco_aos_productsaos_products_idb = prodaceperm.id AND precoac.deleted = 0
	...    	INNER JOIN saude_preco preco ON preco.id = precoac.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
	...    	WHERE prodperm.aos_products_aos_products_2aos_products_ida = prodass.id 
	...    	AND prodperm.deleted = 0) AS ACES_PERMITIDOS
    ...    FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    LEFT JOIN aos_product_categories_cstm planprodass on planprodass.id_c=prodass.aos_product_category_id
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    INNER JOIN saude_alcada_aos_products_1_c alcadProd on alcadProd.saude_alcada_aos_products_1aos_products_idb=prodass.id AND alcadProd.deleted=0
    ...    WHERE prodass.part_number IN('${QUERY_PLSQL_ASSIST[0][1]}')
    ...    AND prodass.deleted = 0;
    ${QUERY_5_MYSQL}    Query    ${QUERY_5_MYSQL}
    ${size_5}     Get Length      ${QUERY_5_MYSQL}
    IF   $size_5 > 0
        Log    Vinculos de alçada de produtos Assistencial: ${QUERY_5_MYSQL}
    ELSE
        Log To Console  Erro nenhum Vinculos de alçada de produtos Assistencial
        Fail       Erro nenhum Vinculos de alçada de produtos Assistencial:
    END
    DisconnectDatabaseMySql

######  cenario 6  #######
######  cenario 14  #######
######  cenario 22 #######
#### ajustar variavel que é chamada, chamar variavel de produtos acessorios
Query - Consultar no CRM Vinculo de alçada de produtos acessorio MYSQL
    [Arguments]     ${QUERY_PLSQL_ASSIST}
    ConnectDatabaseMySql
    ${QUERY_6_MYSQL}=     catenate
    ...    SELECT	planprodass.pla_cod_c PLANO, prodass.part_number AS ASSISTENCIAL,	
    ...    (	SELECT GROUP_CONCAT(prodaceperm.part_number) FROM aos_products_aos_products_2_c prodperm
	...    	LEFT JOIN aos_products prodaceperm ON prodaceperm.id = prodperm.aos_products_aos_products_2aos_products_idb
    ...     INNER JOIN saude_preco_aos_products_c precoac ON precoac.saude_preco_aos_productsaos_products_idb = prodaceperm.id AND precoac.deleted = 0
	...    	INNER JOIN saude_preco preco ON preco.id = precoac.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
	...    	WHERE prodperm.aos_products_aos_products_2aos_products_ida = prodass.id 
	...    	AND prodperm.deleted = 0) AS ACES_PERMITIDOS
    ...    FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    LEFT JOIN aos_product_categories_cstm planprodass on planprodass.id_c=prodass.aos_product_category_id
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    INNER JOIN saude_alcada_aos_products_1_c alcadProd on alcadProd.saude_alcada_aos_products_1aos_products_idb=prodass.id AND alcadProd.deleted=0
    ...    WHERE prodass.part_number IN('${QUERY_PLSQL_ASSIST}')
    ...    AND prodass.deleted = 0;
    ${QUERY_6_MYSQL}    Query    ${QUERY_6_MYSQL}
    ${size_6}     Get Length      ${QUERY_6_MYSQL}
    IF   $size_6 > 0
        Log    Vinculos de alçada de produtos Acessorio: ${QUERY_6_MYSQL}
    ELSE
        Log To Console  Erro nenhum Vinculos de alçada de produtos Acessorio
        Fail       Erro nenhum Vinculos de alçada de produtos Acessorio
    END
    DisconnectDatabaseMySql


#### CENARIO 7  ########
#### CENARIO 15 #######
#### CENARIO 23 ########
Query - CONSULTAR VINCULO DE CONVÊNIO EM ALÇADA NO CRM
    ConnectDatabaseMySql
    ${QUERY_7_MYSQL}=     catenate
    ...    SELECT
    ...    '=======' PRODUTO,
    ...    planprodass.pla_cod_c PLANO,
    ...    prodass.part_number AS ASSISTENCIAL,
    ...    prodassc.tipo_contratacao_c,
    ...    (SELECT GROUP_CONCAT(prodaceperm.part_number)
    ...    FROM    aos_products_aos_products_2_c prodperm
    ...            LEFT JOIN            aos_products prodaceperm ON prodaceperm.id = prodperm.aos_products_aos_products_2aos_products_idb
    ...            INNER JOIN            saude_preco_aos_products_c precoac ON precoac.saude_preco_aos_productsaos_products_idb = prodaceperm.id                AND precoac.deleted = 0
    ...            INNER JOIN            saude_preco preco ON preco.id = precoac.saude_preco_aos_productssaude_preco_ida                AND preco.deleted = 0
	...    	WHERE            prodperm.aos_products_aos_products_2aos_products_ida = prodass.id
	...					 AND prodperm.deleted = 0) AS ACES_PERMITIDOS,
    ...    '=======' CONVENIO,
    ...    conv.codigo,
    ...    conv.data_ini,
    ...    conv.data_fim,
    ...    conv.name,
    ...    conv.nome_comercializacao,
    ...    conv.description,
    ...    '=======' ALCADA,
    ...    alc.data_ini,
    ...    alc.data_fim,
    ...    alc.modulo,
    ...    alc.name,
    ...    alc.percentual_acrescimo_ate,
    ...    alc.percentual_desconto_ate,
    ...    alc.vincula_todos
    ...    FROM    aos_products prodass
    ...    INNER JOIN    aos_products_cstm prodassc ON prodass.id = prodassc.id_c        AND prodass.deleted = 0
    ...    LEFT JOIN    aos_product_categories_cstm planprodass ON planprodass.id_c = prodass.aos_product_category_id
    ...    INNER JOIN    saude_convenio_aos_products_1_c conv_prod ON conv_prod.saude_convenio_aos_products_1aos_products_idb = prodass.id        AND conv_prod.deleted = 0
    ...    INNER JOIN    saude_alcada_saude_convenio_1_c alc_conv ON conv_prod.saude_convenio_aos_products_1saude_convenio_ida = alc_conv.saude_alcada_saude_convenio_1saude_convenio_idb
    ...    INNER JOIN    saude_alcada alc ON alc_conv.saude_alcada_saude_convenio_1saude_alcada_ida = alc.id        AND alc.deleted = 0
    ...    INNER JOIN    saude_alcada_cstm alc_c ON alc.id = alc_c.id_c
    ...    INNER JOIN    saude_convenio conv ON conv_prod.saude_convenio_aos_products_1saude_convenio_ida = conv.id        AND conv.deleted = 0;
    ${QUERY_7_MYSQL}    Query    ${QUERY_7_MYSQL}
    ${size_7}     Get Length      ${QUERY_7_MYSQL}
    IF   $size_7 > 0
        Log    Vinculos de convenio em alçadas: ${QUERY_7_MYSQL}
        ${COLUM_PLN_COD}    Get Variables Value   ${QUERY_7_MYSQL[0][2]}
        ${COLUM_COD_CONVENIO}    Get Variables Value   ${QUERY_7_MYSQL[1][1]}
        Set Global Variable         ${COLUM_COD_CONVENIO}
        ${COLUM_SIZE}     Get Length      ${COLUM_PLN_COD}
        IF      $COLUM_SIZE > 0
            Log To Console    Coluna Assistencial: ${COLUM_PLN_COD}
        ELSE

            Log To Console  Erro nenhum PLN_CODIGO encontrado na coluna Assistencial
        END
    ELSE
        Log To Console  Erro nenhum vinculo encontrado
        Fail        Nenhum produto acessorio vinculado 
    END
    DisconnectDatabaseMySql



## cenario 9  ####
Query - Consultar Plano Coletivo por Adesão SG
    ConnectDatabase
    @{QUERY_PLANO_9}=    Query     SELECT DISTINCT C.PLA_NUMERO FROM combinacao C INNER JOIN PLANO_PRODUTO PP ON C.PLA_NUMERO=PP.PLA_NUMERO INNER JOIN PRODUTO P ON PP.PDT_CODIGO=P.PDT_CODIGO WHERE C.PLN_DT_EXC IS NULL AND PP.PLP_DT_EXC IS NULL AND P.PDT_DT_EXC IS NULL AND PP.PLP_COBRA_MENS='N' AND C.PLN_DESCRICAO like 'COLETIVO ADESAO%' ORDER BY C.PLA_NUMERO ASC

    ${SIZE}     Get Length     ${QUERY_PLANO_9}
    IF      $SIZE < 1
        Log To Console      Erro nenhum Plano Coletivo por Adesão encontado
        DisconnectDatabase
        Fail      Erro nenhum dado encontado
    ELSE
        Log        PLA_CODIGOS dos Planos Coletivo Adesão: @{QUERY_PLANO_9}
        Log        Quantidade: ${SIZE}
        ${TEST}     Convert To List     ${QUERY_PLANO_9}
        ${str_tuple}     Convert To String   ${TEST[0]}        # aqui pegamos o 3° dado que retorna da query
        ${str_pla_cod}      Get Substring       ${str_tuple}     1   4
        ${str_pla_cod}    Remover Caracteres Especiais    ${str_pla_cod}
        Log     ${str_pla_cod}
        Set Global Variable     ${str_pla_cod}
        Set Global Variable     ${QUERY_PLANO_9}
        ${GLOBAL_NAME_PLA_ADESAO} =     Catenate     ${str_pla_cod}
        ${GLOBAL_NAME_PLA_ADESAO_2} =     Catenate     ${QUERY_PLANO_9[0][0]}
        Set Global Variable    ${GLOBAL_NAME_PLA_ADESAO}
        Set Global Variable    ${GLOBAL_NAME_PLA_ADESAO_2}
        DisconnectDatabase
        Query - Consultar no CRM Plano Coletivo Adesão MYSQL         ${str_pla_cod}
    END    

###### cenario 9 ####
Query - Consultar no CRM Plano Coletivo Adesão MYSQL
    [Arguments]    ${QUERY_PLANO_9}
    ConnectDatabaseMySql
    ${QUERY_9_MYSQL}=     catenate
    ...    SELECT DISTINCT pla_cod_c FROM aos_product_categories_cstm
    ...    INNER JOIN aos_product_categories ON id_c=id
    ...    WHERE pla_cod_c IN('${QUERY_PLANO_9}')
    ...    AND deleted=0;
    ${QUERY_9_MYSQL}        Query    ${QUERY_9_MYSQL}
    ${size_9}        Get Length    ${QUERY_9_MYSQL}
    IF    $size_9 > 0
        Log       Planos Coletivo Adesao: ${QUERY_9_MYSQL}
    ELSE
        Log     Erro nenhum Plano Coletivo Adesao encontrado no bando do CRM || ${QUERY_9_MYSQL}
    END
    DisconnectDatabaseMySql

## cenario 10  ####
Query - Consultar Produtos Assistenciais Coletivo Adesão com Tabela de Preço SG
    [Arguments]         ${RESULT_QUERY_PLA}
    ConnectDatabase
    ${QUERY_PLSQL_ASSIST}=     catenate
    ...    SELECT DISTINCT C.PLA_NUMERO, C.PLN_CODIGO
    ...    FROM   combinacao C
    ...    INNER JOIN PLANO_PRODUTO PP ON C.PLA_NUMERO=PP.PLA_NUMERO
    ...    INNER JOIN PRODUTO P ON PP.PDT_CODIGO=P.PDT_CODIGO
    ...    WHERE  C.PLN_DT_EXC IS NULL
    ...    AND    PP.PLP_DT_EXC IS NULL
    ...    AND    P.PDT_DT_EXC IS NULL
    ...    AND    PP.PLP_COBRA_MENS='N'
    ...    AND    C.PLN_DESCRICAO like 'COLETIVO ADESAO%'
    ...    AND    C.PLA_NUMERO IN ('${RESULT_QUERY_PLA}')
    ...    ORDER BY C.PLN_CODIGO ASC
    ${QUERY_PLSQL_ASSIST}    Query    ${QUERY_PLSQL_ASSIST}
    ${length}       Get Length      ${QUERY_PLSQL_ASSIST}
    IF  $length > 0
        Log To Console    Produto Assistencial com tabela de preço: ${QUERY_PLSQL_ASSIST}
        Log     Produto Assistencial com tabela de preço: ${QUERY_PLSQL_ASSIST}
        Set Global Variable  ${QUERY_PLSQL_ASSIST}
        ${GLOBAL_ASSISTENCIAL_ADESAO} =     Catenate        ${QUERY_PLSQL_ASSIST[0][1]}
        Set Global Variable  ${GLOBAL_ASSISTENCIAL_ADESAO}
        # ${GLOBAL_NAME_PDT_ASSISTENCIAL_2}
        DisconnectDatabase
        Query - Consultar no CRM Produtos Assistenciais Coletivo Adesão com Tabela de Preço MYSQL        ${QUERY_PLSQL_ASSIST[0][1]}
    ELSE
        DisconnectDatabase
        Log To Console    Erro nenhum Produto Assistencial Coletivo Adesão com tabela de preço
    END


## cenario 10  ####
Query - Consultar no CRM Produtos Assistenciais Coletivo Adesão com Tabela de Preço MYSQL
    [Arguments]        ${PLA_COD_10}
    ConnectDatabaseMySql
    ${QUERY_10_MYSQL}=     catenate
    ...    SELECT	prodass.part_number FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    WHERE prodassc.tipo_c = 'assistencial'
    ...    AND prodass.part_number IN('${PLA_COD_10}')
    ...    AND prodass.deleted = 0;
    ${QUERY_10_MYSQL}        Query    ${QUERY_10_MYSQL}
    ${size_10}        Get Length    ${QUERY_10_MYSQL}
    IF    $size_10 > 0
        Log       Planos Coletivo Adesao com tabel de preço: ${QUERY_10_MYSQL}
    ELSE
        Log     Erro nenhum Plano Coletivo Adesao com tabela de preço encontrado no bando do CRM
    END
    DisconnectDatabaseMySql

Consultar no CRM Produtos Assistenciais Coletivo Adesão com Tabela de Preço MYSQL para cenario 38
    [Arguments]         ${RESULT_QUERY_PLA}
   ConnectDatabase
    ${QUERY_PLSQL_ASSIST}=     catenate
    ...    SELECT DISTINCT C.PLA_NUMERO, C.PLN_CODIGO
    ...    FROM   combinacao C
    ...    INNER JOIN PLANO_PRODUTO PP ON C.PLA_NUMERO=PP.PLA_NUMERO
    ...    INNER JOIN PRODUTO P ON PP.PDT_CODIGO=P.PDT_CODIGO
    ...    WHERE  C.PLN_DT_EXC IS NULL
    ...    AND    PP.PLP_DT_EXC IS NULL
    ...    AND    P.PDT_DT_EXC IS NULL
    ...    AND    PP.PLP_COBRA_MENS='N'
    ...    AND    C.PLN_DESCRICAO like 'COLETIVO ADESAO%'
    ...    AND    C.PLA_NUMERO IN ('${RESULT_QUERY_PLA}')
    ...    ORDER BY C.PLN_CODIGO ASC
    ${QUERY_PLSQL_ASSIST}    Query    ${QUERY_PLSQL_ASSIST}
    ${length}       Get Length      ${QUERY_PLSQL_ASSIST}
    IF  $length > 0
        Log To Console    Produto Assistencial com tabela de preço: ${QUERY_PLSQL_ASSIST}
        Log     Produto Assistencial com tabela de preço: ${QUERY_PLSQL_ASSIST}
        Set Global Variable  ${QUERY_PLSQL_ASSIST}
    ELSE
        Log To Console    Erro nenhum Produto Assistencial com tabela de preço
        Fail         Erro nenhum Produto Assistencial com tabela de preço   
    END
    DisconnectDatabase

## cenario 11 ###
Query - Consultar Produtos Acessorios Coletivo Adesão com Tabela de Preço SG
    [Arguments]         ${RESULT_QUERY_PLA}
    ConnectDatabase
    ${QUERY_PLSQL_ACESSOR}=     catenate
    ...    SELECT DISTINCT C.PLA_NUMERO, C.PLN_CODIGO, PP.PDT_CODIGO
    ...    FROM   combinacao C
    ...    INNER JOIN PLANO_PRODUTO PP ON C.PLA_NUMERO=PP.PLA_NUMERO
    ...    INNER JOIN PRODUTO P ON PP.PDT_CODIGO=P.PDT_CODIGO
    ...    WHERE  C.PLN_DT_EXC IS NULL
    ...    AND    PP.PLP_DT_EXC IS NULL
    ...    AND    P.PDT_DT_EXC IS NULL
    ...    AND    PP.PLP_COBRA_MENS='N'
    ...    AND    C.PLN_DESCRICAO like 'COLETIVO ADESAO%'
    ...    AND    C.PLA_NUMERO IN ('${RESULT_QUERY_PLA}')
    ...    ORDER BY PP.PDT_CODIGO ASC
    ${QUERY_PLSQL_ACESSOR}    Query    ${QUERY_PLSQL_ACESSOR}
    ${size_11}        Get Length    ${QUERY_PLSQL_ACESSOR}
    IF    $size_11 > 0
        Log To Console    ${QUERY_PLSQL_ACESSOR}
        Log       Planos Coletivo Adesao: ${QUERY_PLSQL_ACESSOR}
        Set Global Variable      ${QUERY_PLSQL_ACESSOR}
        DisconnectDatabase
        Query - Consultar no CRM Produtos Acessorios Coletivo Adesão com Tabela de Preço MYSQL       ${QUERY_PLSQL_ACESSOR[1][2]} 
    ELSE
        Log     ${QUERY_PLSQL_ACESSOR}
        Log     Erro nenhum Plano Coletivo Adesao encontrado no Sistema de Gestão
        DisconnectDatabase
    END

## cenario 11  ####
Query - Consultar no CRM Produtos Acessorios Coletivo Adesão com Tabela de Preço MYSQL
    [Arguments]        ${PLA_COD_11}
    ConnectDatabaseMySql
    ${QUERY_11_MYSQL}=     catenate
    ...    SELECT	prodass.part_number FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    WHERE prodass.part_number IN('${PLA_COD_11}')
    ...    AND prodass.deleted = 0;
    ${QUERY_11_MYSQL}    Query    ${QUERY_11_MYSQL}
    ${size_11}        Get Length    ${QUERY_11_MYSQL}
    IF    $size_11 > 0
        Log To Console    ${QUERY_11_MYSQL}
        Log       Planos Coletivo Adesao: ${QUERY_11_MYSQL}
    ELSE
        Log     ${QUERY_11_MYSQL}
    END
    DisconnectDatabaseMySql

## Cenario 12 ####
Query - Consulta no CRM Vinculo de Produtos Acessorios em Produtos Assistenciais Coletivo Adesão MYSQL
    ConnectDatabaseMySql
    ${QUERY_12_MYSQL}=     catenate
    ...    SELECT	planprodass.pla_cod_c PLANO, prodass.part_number AS ASSISTENCIAL,	
    ...    (	SELECT GROUP_CONCAT(prodaceperm.part_number) FROM aos_products_aos_products_2_c prodperm
	...    	LEFT JOIN aos_products prodaceperm ON prodaceperm.id = prodperm.aos_products_aos_products_2aos_products_idb
    ...        INNER JOIN saude_preco_aos_products_c precoac ON precoac.saude_preco_aos_productsaos_products_idb = prodaceperm.id AND precoac.deleted = 0
	...    	INNER JOIN saude_preco preco ON preco.id = precoac.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
	...    	WHERE prodperm.aos_products_aos_products_2aos_products_ida = prodass.id 
	...    	AND prodperm.deleted = 0) AS ACES_PERMITIDOS
    ...     FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    INNER JOIN aos_product_categories_cstm planprodass on planprodass.id_c=prodass.aos_product_category_id
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    WHERE prodass.part_number IN('${QUERY_PLSQL_ACESSOR[0][2]}')
    ...    AND prodass.deleted = 0;
    ${QUERY_12_MYSQL}       Query     ${QUERY_12_MYSQL}
    ${size_12}        Get Length    ${QUERY_12_MYSQL}
    IF    $size_12 > 0
        Log To Console    ${QUERY_12_MYSQL}
        Log       Vinculo de produto acessorio em assistenciais: ${QUERY_12_MYSQL}
    ELSE
        Log     Erro nenhum Vinculo de produto acessorio em assistenciais Coletivo Adesão: ${QUERY_12_MYSQL}
    END    
    DisconnectDatabaseMySql



#### cenario 17 ######
Query - Consultar Plano Individual Familiar SG 
    ConnectDatabase
    ${QUERY_PLANO_17}=    catenate
    ...     SELECT
    ...     comb.PLN_CODIGO  AS COMBINACAO,
    ...     pla.PLA_NUMERO AS PLANO,
    ...     (CASE
    ...    WHEN(pla.PLA_MODALIDADE_ANS = 2) THEN 'Individual/Familiar'
    ...    WHEN(pla.PLA_MODALIDADE_ANS = 3) THEN 'Coletivo Empresarial'
    ...    WHEN(pla.PLA_MODALIDADE_ANS = 4) THEN 'Coletivo Adesão'
    ...     END) AS TIPO_CONTRATACAO,
    ...     pla.PLA_MODALIDADE_ANS  
    ...     FROM
    ...     combinacao comb
    ...     INNER JOIN PLANO pla ON comb.PLA_NUMERO = pla.PLA_NUMERO 
    ...     WHERE
    ...     comb.PLN_DT_EXC IS NULL
    ...     --AND C.PLN_DESCRICAO LIKE 'INDIVIDUAL FAMILIAR%'
    ...     ORDER BY 
    ...     comb.PLA_NUMERO ASC;
    ${QUERY_PLANO_17}       Query     ${QUERY_PLANO_17}
    ${SIZE}     Get Length     ${QUERY_PLANO_17}
    IF      $SIZE < 1
        Log To Console      Erro nenhum Plano Individual Familiar no SG encontado
        DisconnectDatabase
        Fail     Erro nenhum Plano Individual Familiar no SG encontado
    ELSE
        Log        Quantidade: ${SIZE}
        Log        PLA_COD Individual Familiar: ${QUERY_PLANO_17}
        @{QUERY_PLANO_17_LIST}   Convert To List     ${QUERY_PLANO_17}
        FOR     ${item}     IN     @{QUERY_PLANO_17_LIST}
            IF  $size_list == 3
                Log     Entrou no segundo BREAK    console=yes
                BREAK
            ELSE    
                FOR     ${info}     IN      @{item}
                    IF     $info == 'Individual/Familiar'
                        Log    encontrou item familiar    console=yes
                        ${str_pln_cod_assist} =      Catenate    ${item[0]}
                        ${str_pla_cod} =             Catenate    ${item[1]}
                        Append To List      ${LIST_COD_PLA_FAMILIAR}    ${str_pla_cod}
                        Append To List      ${LIST_COD_PLN_ASSIST}      ${str_pln_cod_assist}
                        ## remover itens duplicados das listas acima
                        ${SORT_LIST_PLA}           Remove Duplicates       ${LIST_COD_PLA_FAMILIAR}
                        ${SORT_LIST_ASSIST}    Remove Duplicates       ${LIST_COD_PLN_ASSIST}
                        ${size_list}           Get Length              ${SORT_LIST_PLA}
                        IF  $size_list == 3
                            Log     Entrou no BREAK    console=yes
                            Set Global Variable  ${SORT_LIST_PLA}
                            ${GLOBAL_NAME_PLA_PF} =    Catenate        ${SORT_LIST_PLA[0]}
                            ${GLOBAL_NAME_PLA_PF_2} =    Catenate        ${SORT_LIST_PLA[1]}
                            Set Global Variable  ${SORT_LIST_ASSIST}
                            ${GLOBAL_ASSISTENCIAL_PF} =    Catenate        ${SORT_LIST_ASSIST[0]}
                            ${GLOBAL_ASSISTENCIAL_PF_2} =    Catenate        ${SORT_LIST_ASSIST[1]}
                            
                            Set Global Variable  ${GLOBAL_ASSISTENCIAL_PF}
                            Set Global Variable  ${GLOBAL_ASSISTENCIAL_PF_2}
                            BREAK
                        
                        ELSE
                            Log     ainda não encheu a lista....: ${SORT_LIST_PLA}    console=yes
                        END
                        
                    ELSE
                        CONTINUE
                            
                    END 
                END
            END    
        END
        DisconnectDatabase
        Query - Consultar no CRM Plano Individual Familiar MYSQL        ${SORT_LIST_PLA[0]}
    END    

## cenario 17  ####
Query - Consultar no CRM Plano Individual Familiar MYSQL
    [Arguments]         ${RESULT_QUERY_PLA}
    ConnectDatabaseMySql
    ${QUERY_MYSQL_17}=    catenate
    ...    SELECT DISTINCT pla_cod_c FROM aos_product_categories_cstm
    ...    INNER JOIN aos_product_categories ON id_c=id
    ...    WHERE pla_cod_c IN('${RESULT_QUERY_PLA}')
    ...    AND deleted=0;
    ${QUERY_MYSQL_17}    Query    ${QUERY_MYSQL_17}
    ${size_17}        Get Length    ${QUERY_MYSQL_17}
    IF    $size_17 > 0
        Log To Console    ${QUERY_MYSQL_17}
        Log       Plano Individual Familiar: ${QUERY_MYSQL_17}
    ELSE
        Log      Erro nenhum Plano Individual Familiar encontrado no bando do CRM || ${QUERY_MYSQL_17}
    END  
    DisconnectDatabaseMySql

######## cenario 18 #######
Query - Consultar Produtos Assistenciais Individual Familiar com Tabela de Preço SG
    [Arguments]         ${RESULT_QUERY_PLA}
    ConnectDatabase
    ${QUERY_PLSQL_ASSIST}=     catenate
    ...    SELECT DISTINCT C.PLA_NUMERO, C.PLN_CODIGO
    ...    FROM   combinacao C
    ...    INNER JOIN PLANO_PRODUTO PP ON C.PLA_NUMERO=PP.PLA_NUMERO
    ...    INNER JOIN PRODUTO P ON PP.PDT_CODIGO=P.PDT_CODIGO
    ...    WHERE  C.PLN_DT_EXC IS NULL
    ...    AND    PP.PLP_DT_EXC IS NULL
    ...    AND    P.PDT_DT_EXC IS NULL
    ...    AND    PP.PLP_COBRA_MENS='N'
    ...    AND    C.PLN_DESCRICAO like 'INDIVIDUAL FAMILIAR%'
    ...    AND    C.PLA_NUMERO IN ('${RESULT_QUERY_PLA}')
    ...    ORDER BY C.PLN_CODIGO ASC
    ${QUERY_PLSQL_ASSIST}    Query    ${QUERY_PLSQL_ASSIST}
    ${length}       Get Length      ${QUERY_PLSQL_ASSIST}
    IF  $length > 0
        Log To Console    Produto Assistencial com tabela de preço: ${QUERY_PLSQL_ASSIST}
        Log     Produto Assistencial com tabela de preço: ${QUERY_PLSQL_ASSIST}
        Set Global Variable  ${QUERY_PLSQL_ASSIST}
        ${GLOBAL_ASSISTENCIAL_PF} =     Catenate        ${SORT_LIST_ASSIST[1]}
        Set Global Variable  ${GLOBAL_ASSISTENCIAL_PF}

        ${GLOBAL_ASSISTENCIAL_PF_2} =     Catenate        ${SORT_LIST_ASSIST[2]}
        Set Global Variable  ${GLOBAL_ASSISTENCIAL_PF_2}

        DisconnectDatabase
        Query - Consultar no CRM Produtos Assistenciais Individual Familiar com Tabela de Preço MYSQL      ${QUERY_PLSQL_ASSIST[0][1]}
    ELSE
        DisconnectDatabase
        Log To Console    Erro nenhum Produto Assistencial Individual Familiar com tabela de preço
    END


######## cenario 18 #######
Query - Consultar no CRM Produtos Assistenciais Individual Familiar com Tabela de Preço MYSQL
    [Arguments]        ${PLA_COD_18}
    ConnectDatabaseMySql
    ${QUERY_18_MYSQL}=     catenate
    ...    SELECT	prodass.part_number FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    WHERE prodassc.tipo_c = 'assistencial'
    ...    AND prodass.part_number IN('${PLA_COD_18}')
    ...    AND prodass.deleted = 0;
    ${QUERY_18_MYSQL}    Query    ${QUERY_18_MYSQL}
    ${size_18}        Get Length    ${QUERY_18_MYSQL}
    IF    $size_18 > 0
        Log To Console    ${QUERY_18_MYSQL}
        Log       Planos Individual Fmailiar com tabel de preço: ${QUERY_18_MYSQL}
    ELSE
        Log     Erro nenhum Plano Individual Fmailiar com tabela de preço encontrado no bando do CRM
    END
    DisconnectDatabaseMySql


######## cenario 19 ##########
Query - Consultar Produtos Acessorios Individual Familiar com tabela de Preço SG
    [Arguments]         ${RESULT_QUERY_PLA}
    ConnectDatabase
    ${QUERY_PLSQL_ACESSOR}=     catenate
    ...    SELECT DISTINCT C.PLA_NUMERO, C.PLN_CODIGO, PP.PDT_CODIGO
    ...    FROM   combinacao C
    ...    INNER JOIN PLANO_PRODUTO PP ON C.PLA_NUMERO=PP.PLA_NUMERO
    ...    INNER JOIN PRODUTO P ON PP.PDT_CODIGO=P.PDT_CODIGO
    ...    WHERE  C.PLN_DT_EXC IS NULL
    ...    AND    PP.PLP_DT_EXC IS NULL
    ...    AND    P.PDT_DT_EXC IS NULL
    ...    AND    PP.PLP_COBRA_MENS='N'
    ...    AND    C.PLN_DESCRICAO like 'INDIVIDUAL FAMILIAR%'
    ...    AND    C.PLA_NUMERO IN ('${RESULT_QUERY_PLA}')
    ...    ORDER BY PP.PDT_CODIGO ASC
    ${QUERY_PLSQL_ACESSOR}    Query    ${QUERY_PLSQL_ACESSOR}
    ${size_19}        Get Length    ${QUERY_PLSQL_ACESSOR}
    IF    $size_19 > 0
        Log To Console    ${QUERY_PLSQL_ACESSOR}
        Log       Planos Individual Familiar: ${QUERY_PLSQL_ACESSOR}
        Set Global Variable      ${QUERY_PLSQL_ACESSOR}
        DisconnectDatabase
        Query - Consultar no CRM Produtos Acessorios Individual Familiar com Tabela de Preço MYSQL         ${QUERY_PLSQL_ACESSOR[1][2]} 
    ELSE
        Log     ${QUERY_PLSQL_ACESSOR}
        DisconnectDatabase
    END


######## cenario 19 ##########
Query - Consultar no CRM Produtos Acessorios Individual Familiar com Tabela de Preço MYSQL  
    [Arguments]        ${PLA_COD_19}
    ConnectDatabaseMySql
    ${QUERY_19_MYSQL}=     catenate
    ...    SELECT	prodass.part_number FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    WHERE prodass.part_number IN('${PLA_COD_19}')
    ...    AND prodass.deleted = 0;
    ${QUERY_19_MYSQL}    Query    ${QUERY_19_MYSQL}
    ${size_19}        Get Length    ${QUERY_19_MYSQL}
    IF    $size_19 > 0
        Log To Console    ${QUERY_19_MYSQL}
        Log       Planos Individual Familiar: ${QUERY_19_MYSQL}
    ELSE
        Log     ${QUERY_19_MYSQL}
        Fail    Erro nenhum Plano Individual Familiar encontrado no bando do CRM
    END
    DisconnectDatabaseMySql


######### CENARIO 20 TESTARRRRR ##########
Query - Consulta no CRM Vinculo de Produtos Acessorios em Produtos Assistenciais Individual Familiar MYSQL
    ConnectDatabaseMySql
    ${QUERY_MYSQL_20}=    catenate
    ...    SELECT	planprodass.pla_cod_c PLANO, prodass.part_number AS ASSISTENCIAL,	
    ...    (	SELECT GROUP_CONCAT(prodaceperm.part_number) FROM aos_products_aos_products_2_c prodperm
	...    	LEFT JOIN aos_products prodaceperm ON prodaceperm.id = prodperm.aos_products_aos_products_2aos_products_idb
    ...        INNER JOIN saude_preco_aos_products_c precoac ON precoac.saude_preco_aos_productsaos_products_idb = prodaceperm.id AND precoac.deleted = 0
	...    	INNER JOIN saude_preco preco ON preco.id = precoac.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
	...    	WHERE prodperm.aos_products_aos_products_2aos_products_ida = prodass.id 
	...    	AND prodperm.deleted = 0) AS ACES_PERMITIDOS
    ...    FROM aos_products prodass
    ...    INNER JOIN aos_products_cstm prodassc ON prodass.id = prodassc.id_c
    ...    INNER JOIN aos_product_categories_cstm planprodass on planprodass.id_c=prodass.aos_product_category_id
    ...    INNER JOIN saude_preco_aos_products_c precoass ON precoass.saude_preco_aos_productsaos_products_idb = prodass.id AND precoass.deleted = 0
    ...    INNER JOIN saude_preco preco ON preco.id = precoass.saude_preco_aos_productssaude_preco_ida AND preco.deleted = 0
    ...    WHERE prodass.part_number IN('${QUERY_PLSQL_ACESSOR[0][1]}')
    ...    AND prodass.deleted = 0;
    ${QUERY_MYSQL_20}    Query    ${QUERY_MYSQL_20}
    ${size_20}        Get Length    ${QUERY_MYSQL_20}
    IF    $size_20 > 0
        Log To Console    ${QUERY_MYSQL_20}
        Log       Vinculo de Produto acessorio em produtos assistencial Individual Familiar: ${QUERY_MYSQL_20}
    ELSE
        Log     ${QUERY_MYSQL_20}
        Fail    Erro nenhum Vinculo de Produto acessorio em produtos assistencial encontrado no bando do CRM
    END  
    DisconnectDatabaseMySql



############ FIM DAS QUERYS DAS MASSAS ##################

Query - Validação Valor Beneficiarios em Contrato
    [Arguments]    @{arg1}
    ConnectDatabase
    ${QUERY}=    catenate 
    ...    SELECT * FROM 
    ...    (SELECT    pc.PCC_DT_VIGENCIA, vm.PDT_CODIGO, vm.PPC_VAL_MENSALIDADE, pc.PLN_CODIGO, pc.PCC_IDADE_MIN, pc.PCC_VAL_MENSALIDADE
    ...    FROM       PRECO_PRODUTO_CONTRATO vm
    ...    INNER JOIN PRECO_PRODUTO_COMB_CONTRATO pc ON pc.CON_CODIGO = vm.CON_CODIGO
    ...    WHERE      vm.CON_CODIGO = ${DADOS_CONTRATO[0]}     
    ...    AND        vm.CON_SEQUENCIA = 0  #Var                     
    ...    AND        vm.PLA_NUMERO = 3018    #Var                      
    ...    AND        pc.PCC_VAL_MENSALIDADE <> 0
    ...    AND        pc.PLN_CODIGO = 5045     #Var    
    ...    AND        pc.PCC_NRO_USUARIOS < 3
    ...    AND        PCC_IDADE_MIN <= ${DADOS_BENEF[5]}
    ...    ORDER BY   pc.PCC_IDADE_MIN DESC)
    ...    WHERE      rownum = 1
    ${QUERY_V}      Query       ${QUERY}
    DisconnectDatabase
Query - Validação Conta e Contrato
    ${e}  Run Keyword And Ignore Error    Validação Conta e Contrato PF
    Run Keyword If  "${e[0]}" == "FAIL"   Validação Conta e Contrato PJ

    # Run Keyword If  '${TIPO_CONTA[0]}' == 'Cliente (PF)'  Validação Conta e Contrato PF
    # Run Keyword If  '${TIPO_CONTA[0]}' == 'Cliente (PJ)'  Validação Conta e Contrato PJ

Validação Conta e Contrato PF
    ConnectDatabase
    ${QUERY_C}=    catenate
    ...    SELECT con.CON_NOME, con.CON_NOME_FANTASIA, con.CON_TIPO_PESSOA, con.CON_CGC_CPF, con.CEP_CODIGO, con.CON_ENDERECO, con.CON_COMPL, 
    ...           con.CON_NUMERO, con.CON_BAIRRO_FAT, con.CON_CIDADE, con.EST_CODIGO, con.CON_DDD_CELULAR, con.CON_FONE_CELULAR, con.CON_E_MAIL1,
    ...           c.CTP_DT_INCLUSAO, c.CTP_SITUACAO, c.CTP_NUM_CONTR 
    ...    FROM contratante con
    ...    INNER JOIN CONTRATO c on c.con_codigo = con.con_codigo
    ...    WHERE con.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    AND con.CON_SEQUENCIA = 0
    ${QUERY_C}      Query       ${QUERY_C}
    DisconnectDatabase
    # Validar Nome, CPF, CEP, Endereco, Numero, Bairro, Cidade, Estado, DDD, Celular, Email, F-Data Inclusão, F-Situação, Numero Contrato
    Should Be Equal      ${QUERY_C[0][0]}      ${DADOS_CONTA[0]}      Valores Divergentes: 
    Should Be Equal      ${QUERY_C[0][3]}      ${DADOS_CONTA[1]}      Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][4]}      ${DADOS_CONTA[11]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][5]}      ${DADOS_CONTA[12]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][7]}      ${DADOS_CONTA[13]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][8]}      ${DADOS_CONTA[14]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][9]}      ${DADOS_CONTA[17]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][10]}     ${DADOS_CONTA[16]}     Valores Divergentes:
    #Should Be Equal      ${QUERY_C[0][12]}     ${DADOS_CONTA[20]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][16]}     ${DADOS_CONTRATO[2]}   Valores Divergentes:
    # ${DADOS_CONTA[0]}   
    # ${DADOS_CONTA[1]}   
    # ${DADOS_CONTA[11]}  
    # ${DADOS_CONTA[12]}  
    # ${DADOS_CONTA[13]}  
    # ${DADOS_CONTA[14]}  
    # ${DADOS_CONTA[17]}  
    # ${DADOS_CONTA[16]}  
    # ${DADOS_CONTA[20]}  
    # ${DADOS_CONTRATO[2]}

Validação Conta e Contrato PJ
    ConnectDatabase
    ${QUERY_C}=    catenate
    ...    SELECT con.CON_NOME, con.CON_NOME_FANTASIA, con.CON_TIPO_PESSOA, con.CON_CGC_CPF, con.CEP_CODIGO, con.CON_ENDERECO, con.CON_COMPL, 
    ...           con.CON_NUMERO, con.CON_BAIRRO_FAT, con.CON_CIDADE, con.EST_CODIGO, con.CON_DDD_CELULAR, con.CON_FONE_CELULAR, con.CON_E_MAIL1,
    ...           c.CTP_DT_INCLUSAO, c.CTP_SITUACAO, c.CTP_NUM_CONTR 
    ...    FROM contratante con
    ...    INNER JOIN CONTRATO c on c.con_codigo = con.con_codigo
    ...    WHERE con.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    AND con.CON_SEQUENCIA = 0
    ${QUERY_C}      Query       ${QUERY_C}
    DisconnectDatabase
    # Validar Nome, CNPJ, CEP, Endereco, Numero, Bairro, Cidade, Estado, DDD, Celular, Email, F-Data Inclusão, F-Situação, Numero Contrato
    Should Be Equal      ${QUERY_C[0][0]}      ${DADOS_CONTA[0]}      Valores Divergentes: 
    Should Be Equal      ${QUERY_C[0][1]}      ${DADOS_CONTA[0]}      Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][3]}      ${DADOS_CONTA[1]}      Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][4]}      ${DADOS_CONTA[3]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][5]}      ${DADOS_CONTA[4]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][7]}      ${DADOS_CONTA[5]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][8]}      ${DADOS_CONTA[6]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][9]}      ${DADOS_CONTA[9]}     Valores Divergentes:
    Should Be Equal      ${QUERY_C[0][10]}      ${DADOS_CONTA[8]}     Valores Divergentes:
    # Should Be Equal      ${QUERY_C[0][11]}     ${DADOS_CONTA[8]}     Valores Divergentes:
    # Should Be Equal      ${QUERY_C[0][16]}     ${DADOS_CONTRATO[2]}   Valores Divergentes:


Query - Validação Beneficiario - Titular e Dependente
# ----Dados Pessoais, email, telefone, carencia----
    ConnectDatabase
    ${QUERY_B}=    catenate
    ...    select distinct p.NOME, p.NOMESOCIAL, p.NOMEMAE, p.NOMEPAI, ep.EMAIL, c.CDD_NOME as naturalidade,
    ...           pu.PDU_DT_BASE_CARENCIA as carencia, p.DATANASCIMENTO, p.DATAADOCAO, p.DATAEXCLUSAO, p.DATAOBITO,
    ...           case SEXO             when 1 then 'feminino' when 2 then 'masculino' end sexo,
    ...           case GENEROSOCIAL     when 1 then 'feminino' when 2 then 'masculino' when 3 then 'ignorado' end genero_social,
    ...           case ESTADOCIVIL      when 7 then 'separado' when 8 then 'divorciado' when 9 then 'casado'
    ...                                 when 10 then 'solteiro' when 11 then 'viúvo' when 12 then 'união estável' end estado_civil,
    ...           case RACA             when 1 then 'Branco' when 2 then 'Negro' when 3 then 'Pardo'
    ...                                 when 4 then 'Amarelo' when 5 then 'Indigena' when 6 then 'Não Informado' end raca,
    ...           case GRAUESCOLARIDADE when 1 then 'Primario Incompleto' when 2 then 'Primario Completo' when 3 then 'Primeiro Grau Completo' when 4 then 'Primeiro Grau Incompleto'
    ...                                 when 5 then 'Segundo Grau Incompleto' when 6 then 'Segundo Grau Completo' when 7 then 'Terceiro Grau Incompleto' when 8 then 'Terceiro Grau Completo'
    ...                                 when 9 then 'Indefinido' when 10 then 'Analfabeto' when 11 then 'Mestrado' when 12 then 'Doutorado'
    ...                                 when 13 then 'Livre Docencia' when 14 then 'Pós Graduação' when 15 then 'Pós Doutorado' end escolaridade,
    ...           tp.DDD, tp.NUMERO
    ...    from usuario u
    ...    inner join pessoa p on u.pessoa = p.id
    ...    inner join cidade c on c.id= p.CIDADENATURALIDADE
    ...    inner join produto_usuario pu on pu.uss_codigo = u.uss_codigo and pu.uni_codigo = u.uni_codigo
    ...    inner join telefonepessoa tp on tp.pessoa = p.id
    ...    inner join emailpessoa ep on ep.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    ${QUERY_B}      Query       ${QUERY_B}
    DisconnectDatabase
    ${e}  Run Keyword And Ignore Error    Should Be Equal      ${QUERY_B[0][0]}      ${DADOS_BENEF[0]}
    Run Keyword If  "${e[0]}" == "PASS"   Validação Beneficiario - Titular    @{DADOS_BENEF}
    Run Keyword If  "${e[0]}" == "FAIL"   Query - Validação Beneficiario - Dependente

    ${f}  Run Keyword And Ignore Error    Should Be Equal      ${QUERY_B[1][0]]}      ${DADOS_BENEF[0]}
    Run Keyword If  "${f[0]}" == "PASS"   Validação Beneficiario - Titular    @{DADOS_BENEF}
    Run Keyword If  "${f[0]}" == "FAIL"   Query - Validação Beneficiario - Dependente



Query - Validação Beneficiario - Titular
# ----Dados Pessoais, email, telefone, carencia----
    ConnectDatabase
    ${QUERY_B}=    catenate
    ...    select distinct p.NOME, p.NOMESOCIAL, p.NOMEMAE, p.NOMEPAI, ep.EMAIL, c.CDD_NOME as naturalidade,
    ...           pu.PDU_DT_BASE_CARENCIA as carencia, p.DATANASCIMENTO, p.DATAADOCAO, p.DATAEXCLUSAO, p.DATAOBITO,
    ...           case SEXO             when 1 then 'feminino' when 2 then 'masculino' end sexo,
    ...           case GENEROSOCIAL     when 1 then 'feminino' when 2 then 'masculino' when 3 then 'ignorado' end genero_social,
    ...           case ESTADOCIVIL      when 7 then 'separado' when 8 then 'divorciado' when 9 then 'casado'
    ...                                 when 10 then 'solteiro' when 11 then 'viúvo' when 12 then 'união estável' end estado_civil,
    ...           case RACA             when 1 then 'Branco' when 2 then 'Negro' when 3 then 'Pardo'
    ...                                 when 4 then 'Amarelo' when 5 then 'Indigena' when 6 then 'Não Informado' end raca,
    ...           case GRAUESCOLARIDADE when 1 then 'Primario Incompleto' when 2 then 'Primario Completo' when 3 then 'Primeiro Grau Completo' when 4 then 'Primeiro Grau Incompleto'
    ...                                 when 5 then 'Segundo Grau Incompleto' when 6 then 'Segundo Grau Completo' when 7 then 'Terceiro Grau Incompleto' when 8 then 'Terceiro Grau Completo'
    ...                                 when 9 then 'Indefinido' when 10 then 'Analfabeto' when 11 then 'Mestrado' when 12 then 'Doutorado'
    ...                                 when 13 then 'Livre Docencia' when 14 then 'Pós Graduação' when 15 then 'Pós Doutorado' end escolaridade,
    ...           tp.DDD, tp.NUMERO
    ...    from usuario u
    ...    inner join pessoa p on u.pessoa = p.id
    ...    inner join cidade c on c.id= p.CIDADENATURALIDADE
    ...    inner join produto_usuario pu on pu.uss_codigo = u.uss_codigo and pu.uni_codigo = u.uni_codigo
    ...    inner join telefonepessoa tp on tp.pessoa = p.id
    ...    inner join emailpessoa ep on ep.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    ${QUERY_B}      Query       ${QUERY_B}
    DisconnectDatabase
    Run Keyword    Validação Beneficiario - Titular     @{DADOS_BENEF}
    

Validação Beneficiario - Titular 
    [Arguments]     @{DADOS_BENEF}
    # ----Dados Pessoais, email, telefone, carencia----
    ConnectDatabase
    ${QUERY_B}=    catenate
    ...    select distinct p.NOME, p.NOMESOCIAL, p.NOMEMAE, p.NOMEPAI, ep.EMAIL, c.CDD_NOME as naturalidade,
    ...           pu.PDU_DT_BASE_CARENCIA as carencia, p.DATANASCIMENTO, p.DATAADOCAO, p.DATAEXCLUSAO, p.DATAOBITO,
    ...           case SEXO             when 1 then 'feminino' when 2 then 'masculino' end sexo,
    ...           case GENEROSOCIAL     when 1 then 'feminino' when 2 then 'masculino' when 3 then 'ignorado' end genero_social,
    ...           case ESTADOCIVIL      when 7 then 'separado' when 8 then 'divorciado' when 9 then 'casado'
    ...                                 when 10 then 'solteiro' when 11 then 'viúvo' when 12 then 'união estável' end estado_civil,
    ...           case RACA             when 1 then 'Branco' when 2 then 'Negro' when 3 then 'Pardo'
    ...                                 when 4 then 'Amarelo' when 5 then 'Indigena' when 6 then 'Não Informado' end raca,
    ...           case GRAUESCOLARIDADE when 1 then 'Primario Incompleto' when 2 then 'Primario Completo' when 3 then 'Primeiro Grau Completo' when 4 then 'Primeiro Grau Incompleto'
    ...                                 when 5 then 'Segundo Grau Incompleto' when 6 then 'Segundo Grau Completo' when 7 then 'Terceiro Grau Incompleto' when 8 then 'Terceiro Grau Completo'
    ...                                 when 9 then 'Indefinido' when 10 then 'Analfabeto' when 11 then 'Mestrado' when 12 then 'Doutorado'
    ...                                 when 13 then 'Livre Docencia' when 14 then 'Pós Graduação' when 15 then 'Pós Doutorado' end escolaridade,
    ...           tp.DDD, tp.NUMERO
    ...    from usuario u
    ...    inner join pessoa p on u.pessoa = p.id
    ...    inner join cidade c on c.id= p.CIDADENATURALIDADE
    ...    inner join produto_usuario pu on pu.uss_codigo = u.uss_codigo and pu.uni_codigo = u.uni_codigo
    ...    inner join telefonepessoa tp on tp.pessoa = p.id
    ...    inner join emailpessoa ep on ep.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    ...    and p.NOME = '${DADOS_BENEF[0]}'
    ${QUERY_B}      Query       ${QUERY_B}
    DisconnectDatabase
    ${QUERY_B[0][6]}   Convert To String    ${QUERY_B[0][6]}
    ${QUERY_B[0][7]}   Convert To String    ${QUERY_B[0][7]}
    # Titular - Arg0: Nome, Arg1: Vigencia, Arg2: Carencia, Arg3: CPF, Arg4: Data Nasc, Arg5: Idade,
    # ... Arg6: Sexo, Arg7: CNS, Arg8: Tipo, Arg9: Grau Dependencia, Arg10: Cod Familia, Arg11: Nome Mãe, Arg12: Email,
    # ... Arg13: Numero Tel, Arg14: Naturalidade, Arg15: Raça, Arg16: Estado Civil
    Should Be Equal      ${QUERY_B[0][0]}      ${DADOS_BENEF[0]}      Valores Divergentes: 
    Should Be Equal      ${QUERY_B[0][2]}      ${DADOS_BENEF[11]}      Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][4]}      ${DADOS_BENEF[12]}     Valores Divergentes:   
    Should Be Equal      ${QUERY_B[0][5]}      ${DADOS_BENEF[14]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][6]}      ${DADOS_BENEF[2]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][7]}      ${DADOS_BENEF[4]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][11]}      ${DADOS_BENEF[6]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][13]}      ${DADOS_BENEF[16]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][14]}      ${DADOS_BENEF[15]}     Valores Divergentes:
    #Should Be Equal      ${QUERY_B[0][17]}      ${DADOS_BENEF[13]}     Valores Divergentes:

Query - Validação Beneficiario - Dependente
# ----Dados Pessoais, email, telefone, carencia----
    ConnectDatabase
    ${QUERY_B}=    catenate
    ...    select distinct p.NOME, p.NOMESOCIAL, p.NOMEMAE, p.NOMEPAI, ep.EMAIL, c.CDD_NOME as naturalidade,
    ...           pu.PDU_DT_BASE_CARENCIA as carencia, p.DATANASCIMENTO, p.DATAADOCAO, p.DATAEXCLUSAO, p.DATAOBITO,
    ...           case SEXO             when 1 then 'feminino' when 2 then 'masculino' end sexo,
    ...           case GENEROSOCIAL     when 1 then 'feminino' when 2 then 'masculino' when 3 then 'ignorado' end genero_social,
    ...           case ESTADOCIVIL      when 7 then 'separado' when 8 then 'divorciado' when 9 then 'casado'
    ...                                 when 10 then 'solteiro' when 11 then 'viúvo' when 12 then 'união estável' end estado_civil,
    ...           case RACA             when 1 then 'Branco' when 2 then 'Negro' when 3 then 'Pardo'
    ...                                 when 4 then 'Amarelo' when 5 then 'Indigena' when 6 then 'Não Informado' end raca,
    ...           case GRAUESCOLARIDADE when 1 then 'Primario Incompleto' when 2 then 'Primario Completo' when 3 then 'Primeiro Grau Completo' when 4 then 'Primeiro Grau Incompleto'
    ...                                 when 5 then 'Segundo Grau Incompleto' when 6 then 'Segundo Grau Completo' when 7 then 'Terceiro Grau Incompleto' when 8 then 'Terceiro Grau Completo'
    ...                                 when 9 then 'Indefinido' when 10 then 'Analfabeto' when 11 then 'Mestrado' when 12 then 'Doutorado'
    ...                                 when 13 then 'Livre Docencia' when 14 then 'Pós Graduação' when 15 then 'Pós Doutorado' end escolaridade,
    ...           tp.DDD, tp.NUMERO
    ...    from usuario u
    ...    inner join pessoa p on u.pessoa = p.id
    ...    inner join cidade c on c.id= p.CIDADENATURALIDADE
    ...    inner join produto_usuario pu on pu.uss_codigo = u.uss_codigo and pu.uni_codigo = u.uni_codigo
    ...    inner join telefonepessoa tp on tp.pessoa = p.id
    ...    inner join emailpessoa ep on ep.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    ${QUERY_B}      Query       ${QUERY_B}
    DisconnectDatabase
    Run Keyword    Validação Beneficiario - Dependente     @{DADOS_BENEF_DEPENDENTE}


Validação Beneficiario - Dependente
    [Arguments]     @{DADOS_BENEF_DEPENDENTE}
    # ----Dados Pessoais, email, telefone, carencia----
    ConnectDatabase
    ${QUERY_B}=    catenate
    ...    select distinct p.NOME, p.NOMESOCIAL, p.NOMEMAE, p.NOMEPAI, ep.EMAIL, c.CDD_NOME as naturalidade,
    ...           pu.PDU_DT_BASE_CARENCIA as carencia, p.DATANASCIMENTO, p.DATAADOCAO, p.DATAEXCLUSAO, p.DATAOBITO,
    ...           case SEXO             when 1 then 'feminino' when 2 then 'masculino' end sexo,
    ...           case GENEROSOCIAL     when 1 then 'feminino' when 2 then 'masculino' when 3 then 'ignorado' end genero_social,
    ...           case ESTADOCIVIL      when 7 then 'separado' when 8 then 'divorciado' when 9 then 'casado'
    ...                                 when 10 then 'solteiro' when 11 then 'viúvo' when 12 then 'união estável' end estado_civil,
    ...           case RACA             when 1 then 'Branco' when 2 then 'Negro' when 3 then 'Pardo'
    ...                                 when 4 then 'Amarelo' when 5 then 'Indigena' when 6 then 'Não Informado' end raca,
    ...           case GRAUESCOLARIDADE when 1 then 'Primario Incompleto' when 2 then 'Primario Completo' when 3 then 'Primeiro Grau Completo' when 4 then 'Primeiro Grau Incompleto'
    ...                                 when 5 then 'Segundo Grau Incompleto' when 6 then 'Segundo Grau Completo' when 7 then 'Terceiro Grau Incompleto' when 8 then 'Terceiro Grau Completo'
    ...                                 when 9 then 'Indefinido' when 10 then 'Analfabeto' when 11 then 'Mestrado' when 12 then 'Doutorado'
    ...                                 when 13 then 'Livre Docencia' when 14 then 'Pós Graduação' when 15 then 'Pós Doutorado' end escolaridade,
    ...           tp.DDD, tp.NUMERO
    ...    from usuario u
    ...    inner join pessoa p on u.pessoa = p.id
    ...    inner join cidade c on c.id= p.CIDADENATURALIDADE
    ...    inner join produto_usuario pu on pu.uss_codigo = u.uss_codigo and pu.uni_codigo = u.uni_codigo
    ...    inner join telefonepessoa tp on tp.pessoa = p.id
    ...    inner join emailpessoa ep on ep.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    ...    and p.NOME = '${DADOS_BENEF_DEPENDENTE[0]}'
    ${QUERY_B}      Query       ${QUERY_B}
    DisconnectDatabase
    ${QUERY_B[0][6]}   Convert To String    ${QUERY_B[0][6]}
    ${QUERY_B[0][7]}   Convert To String    ${QUERY_B[0][7]}
    # Dependente - Arg17: Nome, Arg18: Vigencia, Arg19: Carencia, Arg20: CPF, Arg21: Data Nasc, Arg22: Idade,
    # ... Arg23: Sexo, Arg24: CNS, Arg25: Tipo, Arg26: Grau Dependencia, Ar27: Cod Familia, Arg28: Nome Mãe, Arg29: Email,
    # ... Arg30: Numero Tel, Arg31: Naturalidade, Arg32: Raça, Arg33: Estado Civil
    Should Be Equal      ${QUERY_B[0][0]}      ${DADOS_BENEF_DEPENDENTE[0]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][2]}      ${DADOS_BENEF_DEPENDENTE[11]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][4]}      ${DADOS_BENEF_DEPENDENTE[12]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][5]}      ${DADOS_BENEF_DEPENDENTE[14]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][6]}      ${DADOS_BENEF_DEPENDENTE[2]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][7]}      ${DADOS_BENEF_DEPENDENTE[4]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][11]}      ${DADOS_BENEF_DEPENDENTE[6]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][13]}      ${DADOS_BENEF_DEPENDENTE[16]}     Valores Divergentes:
    Should Be Equal      ${QUERY_B[0][14]}      ${DADOS_BENEF_DEPENDENTE[15]}     Valores Divergentes:
    #Should Be Equal      ${QUERY_B[1][17]}      ${DADOS_BENEF_DEPENDENTE[13]}     Valores Divergentes:


Query - Validação Endereço - Titular e Dependente
    ${e}  Run Keyword And Ignore Error    Validação Conta e Contrato PF
    Run Keyword If  "${e[0]}" == "FAIL"   Validação Conta e Contrato PJ


Query - Validação Endereço - Titular
    ${e}  Run Keyword And Ignore Error    Validação Endereço PF - Somente Titular
    Run Keyword If  "${e[0]}" == "FAIL"   Validação Endereço PJ - Somente Titular

    # Run Keyword If  '${TIPO_CONTA[0]}' == 'Cliente (PF)'  Validação Endereço PF - Somente Titular
    # Run Keyword If  '${TIPO_CONTA[0]}' == 'Cliente (PJ)'  Validação Endereço PJ - Somente Titular


Validação Endereço PF
# ----Endereço----
    ConnectDatabase
    ${QUERY_E}=    catenate
    ...    select p.NOME, case TIPOENDERECO when 2 then 'Residencial' when 1 then 'Comercial' end TIPOENDERECO,
    ...           cp.CEP_CODIGO, ep.LOGRADOURO, ep.NUMERO, ep.COMPLEMENTO, ep.BAIRRO, ep.INICIOVIGENCIA, ep.FIMVIGENCIA
    ...    from enderecopessoa ep
    ...    inner join cep_logradouro cp on cp.id = ep.ceplogradouro
    ...    inner join pessoa p on p.id = ep.pessoa
    ...    inner join usuario u on u.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    Log  ${QUERY_E}
    ${QUERY_E}      Query       ${QUERY_E}
    DisconnectDatabase

    # Arg0: Nome, Arg1: CPF/CNPJ, Arg2: Data Nasc, Arg3: Sexo, Arg4: Nome Mãe, Arg5: Estado Civil,
    # ...   Arg6: Naturalidade, Arg7: Raça, Arg8: Pais Nasc, Arg9: Nacionalidade, Arg10: Tipo Endereço,
    # ...   Arg11: CEP, Arg12: Endereço, Arg13: Numero, Arg14: Bairro, Arg15: Complemento, Arg16:UF, Arg17: Cidade, Arg18: Pais,
    # ...   Arg19: Tipo Telefone, Arg20: Numero Telefone

    ${e}  Run Keyword And Ignore Error    Should Be Equal      ${QUERY_E[0][0]}      ${DADOS_BENEF[0]}
    Run Keyword If  "${e[0]}" == "PASS"   Validação Endereço PF - Titular    ${QUERY_E}
    Run Keyword If  "${e[0]}" == "FAIL"   Validação Endereço PF - Dependente   ${QUERY_E}

    ${f}  Run Keyword And Ignore Error    Should Be Equal      ${QUERY_E[1][0]]}      ${DADOS_BENEF[0]}
    Run Keyword If  "${f[0]}" == "PASS"   Validação Endereço PF - Titular    ${QUERY_E}
    Run Keyword If  "${f[0]}" == "FAIL"   Validação Endereço PF - Dependente   ${QUERY_E}


Validação Endereço PF - Titular
    [Arguments]     ${QUERY_E}
    ${DADOS_CONTA[5]}    Convert To String    ${DADOS_CONTA[5]}
    ${DADOS_CONTA[13]}    Convert To String    ${DADOS_CONTA[13]}
    # Validar Tipo Endereço, CEP, Logradouro, Numero, Complemento, Bairro
    Should Be Equal      ${QUERY_E[0][0]}      ${DADOS_BENEF[0]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][1]}      ${DADOS_CONTA[10]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][2]}      ${DADOS_CONTA[11]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][3]}      ${DADOS_CONTA[12]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][4]}      ${DADOS_CONTA[13]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][5]}      ${DADOS_CONTA[15]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][6]}      ${DADOS_CONTA[14]}     Valores Divergentes:

Validação Endereço PF - Dependente
    [Arguments]     ${QUERY_E}
    ${DADOS_CONTA[5]}    Convert To String    ${DADOS_CONTA[5]}
    ${DADOS_CONTA[13]}    Convert To String    ${DADOS_CONTA[13]}
    # Validar Tipo Endereço, CEP, Logradouro, Numero, Complemento, Bairro
    Should Be Equal      ${QUERY_E[1][0]}      ${DADOS_BENEF_DEPENDENTE[0]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][1]}      ${DADOS_CONTA[10]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][2]}      ${DADOS_CONTA[11]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][3]}      ${DADOS_CONTA[12]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][4]}      ${DADOS_CONTA[13]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][5]}      ${DADOS_CONTA[15]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][6]}      ${DADOS_CONTA[14]}     Valores Divergentes:


Validação Endereço PF - Somente Titular
# ----Endereço----
    ConnectDatabase
    ${QUERY_E}=    catenate
    ...    select p.NOME, case TIPOENDERECO when 2 then 'Residencial' when 1 then 'Comercial' end TIPOENDERECO,
    ...           cp.CEP_CODIGO, ep.LOGRADOURO, ep.NUMERO, ep.COMPLEMENTO, ep.BAIRRO, ep.INICIOVIGENCIA, ep.FIMVIGENCIA
    ...    from enderecopessoa ep
    ...    inner join cep_logradouro cp on cp.id = ep.ceplogradouro
    ...    inner join pessoa p on p.id = ep.pessoa
    ...    inner join usuario u on u.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    Log  ${QUERY_E}
    ${QUERY_E}      Query       ${QUERY_E}
    DisconnectDatabase
    ${DADOS_CONTA[13]}    Convert To String    ${DADOS_CONTA[13]}
    # Arg0: Nome, Arg1: CPF/CNPJ, Arg2: Data Nasc, Arg3: Sexo, Arg4: Nome Mãe, Arg5: Estado Civil,
    # ...   Arg6: Naturalidade, Arg7: Raça, Arg8: Pais Nasc, Arg9: Nacionalidade, Arg10: Tipo Endereço,
    # ...   Arg11: CEP, Arg12: Endereço, Arg13: Numero, Arg14: Bairro, Arg15: Complemento, Arg16:UF, Arg17: Cidade, Arg18: Pais,
    # ...   Arg19: Tipo Telefone, Arg20: Numero Telefone

    # Validar Tipo Endereço, CEP, Logradouro, Numero, Complemento, Bairro
    Should Be Equal      ${QUERY_E[0][0]}      ${DADOS_BENEF[0]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][1]}      ${DADOS_CONTA[10]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][2]}      ${DADOS_CONTA[11]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][3]}      ${DADOS_CONTA[12]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][4]}      ${DADOS_CONTA[13]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][5]}      ${DADOS_CONTA[15]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][6]}      ${DADOS_CONTA[14]}     Valores Divergentes:


Validação Endereço PJ
# ----Endereço----
    ConnectDatabase
    ${QUERY_E}=    catenate
    ...    select p.NOME, case TIPOENDERECO when 2 then 'Residencial' when 1 then 'Comercial' end TIPOENDERECO,
    ...           cp.CEP_CODIGO, ep.LOGRADOURO, ep.NUMERO, ep.COMPLEMENTO, ep.BAIRRO, ep.INICIOVIGENCIA, ep.FIMVIGENCIA
    ...    from enderecopessoa ep
    ...    inner join cep_logradouro cp on cp.id = ep.ceplogradouro
    ...    inner join pessoa p on p.id = ep.pessoa
    ...    inner join usuario u on u.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    Log  ${QUERY_E}
    ${QUERY_E}      Query       ${QUERY_E}
    DisconnectDatabase
    # Arg0: Nome, Arg1: CPF/CNPJ, Arg2: Tipo Endereço,
    # ...   Arg3: CEP, Arg4: Endereço, Arg5: Numero, Arg6: Bairro, Arg7: Complemento, Arg8:UF, Arg9: Cidade, Arg10: Pais
    
    ${e}  Run Keyword And Ignore Error    Should Be Equal      ${QUERY_E[0][0]}      ${DADOS_BENEF[0]}
    Run Keyword If  "${e[0]}" == "PASS"   Validação Endereço PJ - Titular    ${QUERY_E}
    Run Keyword If  "${e[0]}" == "FAIL"   Validação Endereço PJ - Dependente   ${QUERY_E}

    ${f}  Run Keyword And Ignore Error    Should Be Equal      ${QUERY_E[1][0]]}      ${DADOS_BENEF[0]}
    Run Keyword If  "${f[0]}" == "PASS"   Validação Endereço PJ - Titular    ${QUERY_E}
    Run Keyword If  "${f[0]}" == "FAIL"   Validação Endereço PJ - Dependente   ${QUERY_E}


Validação Endereço PJ - Titular
    [Arguments]     ${QUERY_E}
    ${DADOS_CONTA[5]}    Convert To String    ${DADOS_CONTA[5]}
    # Validar Tipo Endereço, CEP, Logradouro, Numero, Complemento, Bairro
    Should Be Equal      ${QUERY_E[0][0]}      ${DADOS_CONTA[0]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][1]}      Residencial           Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][2]}      ${DADOS_CONTA[3]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][3]}      ${DADOS_CONTA[4]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][4]}      ${DADOS_CONTA[5]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][5]}      ${DADOS_CONTA[7]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][6]}      ${DADOS_CONTA[6]}     Valores Divergentes:

Validação Endereço PJ - Dependente
    [Arguments]     ${QUERY_E}
    ${DADOS_CONTA[5]}    Convert To String    ${DADOS_CONTA[5]}

    Should Be Equal      ${QUERY_E[1][0]}      ${DADOS_BENEF_DEPENDENTE[0]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][1]}      Residencial           Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][2]}      ${DADOS_CONTA[3]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][3]}      ${DADOS_CONTA[4]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][4]}      ${DADOS_CONTA[5]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][5]}      ${DADOS_CONTA[7]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[1][6]}      ${DADOS_CONTA[6]}     Valores Divergentes:


Validação Endereço PJ - Somente Titular
# ----Endereço----
    ConnectDatabase
    ${QUERY_E}=    catenate
    ...    select p.NOME, case TIPOENDERECO when 2 then 'Residencial' when 1 then 'Comercial' end TIPOENDERECO,
    ...           cp.CEP_CODIGO, ep.LOGRADOURO, ep.NUMERO, ep.COMPLEMENTO, ep.BAIRRO, ep.INICIOVIGENCIA, ep.FIMVIGENCIA
    ...    from enderecopessoa ep
    ...    inner join cep_logradouro cp on cp.id = ep.ceplogradouro
    ...    inner join pessoa p on p.id = ep.pessoa
    ...    inner join usuario u on u.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    Log  ${QUERY_E}
    ${QUERY_E}      Query       ${QUERY_E}
    DisconnectDatabase
    ${DADOS_CONTA[5]}    Convert To String    ${DADOS_CONTA[5]}
    # Arg0: Nome, Arg1: CPF/CNPJ, Arg2: Tipo Endereço,
    # ...   Arg3: CEP, Arg4: Endereço, Arg5: Numero, Arg6: Bairro, Arg7: Complemento, Arg8:UF, Arg9: Cidade, Arg10: Pais
    
    # Validar Tipo Endereço, CEP, Logradouro, Numero, Complemento, Bairro
    Should Be Equal      ${QUERY_E[0][0]}      ${DADOS_CONTA[0]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][1]}      Residencial           Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][2]}      ${DADOS_CONTA[3]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][3]}      ${DADOS_CONTA[4]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][4]}      ${DADOS_CONTA[5]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][5]}      ${DADOS_CONTA[7]}     Valores Divergentes:
    Should Be Equal      ${QUERY_E[0][6]}      ${DADOS_CONTA[6]}     Valores Divergentes:
    


Query - Validação Documentos - Titular e Dependente
# ----Documentos----
    ConnectDatabase
    ${QUERY_D}=    catenate
    ...    select p.NOME, case rp.TIPOREGISTRO when 16 then 'RG' when 17 then 'Certidão de Nascimento' when 18 then 'DNV' when 19 then 'Passaporte'
    ...                             when 20 then 'Titulo de Eleitor' when 22 then 'Pis' when 24 then 'Inscrição Municipal' when 25 then 'Inscrição Estadual'
    ...                             when 28 then 'CNS' when 30 then 'Carteira de Habilitação' end tipo_registro, rp.NUMEROREGISTRO, rp.ORGAOEMISSOR, rp.DATAEMISSAO
    ...    from pessoa p
    ...    inner join registropessoa rp on rp.pessoa = p.id
    ...    inner join usuario u on u.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    ${QUERY_D}      Query       ${QUERY_D}
    DisconnectDatabase


    ${e}  Run Keyword And Ignore Error    Should Be Equal      ${QUERY_D[0][0]}      ${DADOS_BENEF[0]}
    Run Keyword If  "${e[0]}" == "PASS"   Validação Documentos - Titular  ${QUERY_D}
    Run Keyword If  "${e[0]}" == "FAIL"   Validação Documentos - Dependente  ${QUERY_D}

    ${f}  Run Keyword And Ignore Error    Should Be Equal      ${QUERY_D[1][0]]}      ${DADOS_BENEF_DEPENDENTE[0]}
    Run Keyword If  "${f[0]}" == "PASS"   Validação Documentos - Titular  ${QUERY_D}
    Run Keyword If  "${f[0]}" == "FAIL"   Validação Documentos - Dependente  ${QUERY_D}


Query - Validação Documentos - Titular
# ----Documentos----
    ConnectDatabase
    ${QUERY_D}=    catenate
    ...    select p.NOME, case rp.TIPOREGISTRO when 16 then 'RG' when 17 then 'Certidão de Nascimento' when 18 then 'DNV' when 19 then 'Passaporte'
    ...                             when 20 then 'Titulo de Eleitor' when 22 then 'Pis' when 24 then 'Inscrição Municipal' when 25 then 'Inscrição Estadual'
    ...                             when 28 then 'CNS' when 30 then 'Carteira de Habilitação' end tipo_registro, rp.NUMEROREGISTRO, rp.ORGAOEMISSOR, rp.DATAEMISSAO
    ...    from pessoa p
    ...    inner join registropessoa rp on rp.pessoa = p.id
    ...    inner join usuario u on u.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    ${QUERY_D}      Query       ${QUERY_D}
    DisconnectDatabase
    Run Keyword  Validação Documentos - Titular  ${QUERY_D}


Validação Documentos - Titular
    [Arguments]     ${QUERY_D}
    Should Be Equal      ${QUERY_D[0][0]}      ${DADOS_BENEF[0]}     Valores Divergentes:
    Should Be Equal      ${QUERY_D[0][2]}      ${DADOS_BENEF[7]}     Valores Divergentes:


Validação Documentos - Dependente
    [Arguments]     ${QUERY_D}
    Should Be Equal      ${QUERY_D[1][0]}      ${DADOS_BENEF_DEPENDENTE[0]}     Valores Divergentes:
    Should Be Equal      ${QUERY_D[1][2]}      ${DADOS_BENEF_DEPENDENTE[7]}     Valores Divergentes:



Query - Validação Beneficiarios importados
    ConnectDatabase
    ${QUERY_BI}=    catenate
    ...     select distinct p.NOME, pu.PDU_DT_BASE_CARENCIA as carencia, p.DATANASCIMENTO, p.DATAEXCLUSAO
    ...     from usuario u
    ...     inner join pessoa p on u.USS_CPF = p.CNP
    ...     inner join produto_usuario pu on pu.con_codigo = u.con_codigo 
    ...     where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...     and u.CON_SEQUENCIA = 0
    ${QUERY_BI}      Query       ${QUERY_BI}
    DisconnectDatabase
    RETURN    ${QUERY_BI}
    

Query - Validação Endereço importados
# ----Endereço----
    ConnectDatabase
    ${QUERY_EI}=    catenate
    ...    select p.NOME, case TIPOENDERECO when 2 then 'Residencial' when 1 then 'Comercial' end TIPOENDERECO,
    ...           cp.CEP_CODIGO, ep.LOGRADOURO, ep.NUMERO, ep.COMPLEMENTO, ep.BAIRRO, ep.INICIOVIGENCIA, ep.FIMVIGENCIA
    ...    from enderecopessoa ep
    ...    inner join cep_logradouro cp on cp.id = ep.ceplogradouro
    ...    inner join pessoa p on p.id = ep.pessoa
    ...    inner join usuario u on u.pessoa = p.id
    ...    where u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    and u.CON_SEQUENCIA = 0
    Log  ${QUERY_EI}
    ${QUERY_EI}      Query       ${QUERY_EI}
    DisconnectDatabase
    RETURN    ${QUERY_EI}



Query - Validação Mov Cadastral
   [Arguments]  ${cod_familia}  ${nome_benef}
# --Consulta por Codigo de Familia ou Código Contrato
    ConnectDatabase
    ${QUERY_MOV}=    catenate
    ...   SELECT DEP_CODIGO,
    ...      case DEP_CODIGO when 0 then 'TITULAR'  when 1 then 'CONJUGE'  when 2 then 'COMPANHEIRO'  when 10 then 'FILHO'
    ...                      when 50 then 'PAIS'    when 52 then 'SOGRO'   when 60 then 'OUTROS'      when 70 then 'FILHO ADOTIVO'    
    ...                      when 12 then 'ENTEADO' when 80 then 'IRMAO'   when 90 then 'AGREGADO'    END GRAU_DEP,
    ...      u.FAM_CODIGO, P.CNP, USS_COMPLETO, USS_DT_EXCLUSAO
    ...   FROM usuario u
    ...   inner join pessoa p on u.pessoa = p.id
#    ...   WHERE U.CON_CODIGO= ${DADOS_CONTRATO[0]}
    ...   WHERE u.FAM_CODIGO=${cod_familia}
    ...   AND USS_COMPLETO='${nome_benef}'
    ...   ORDER BY FAM_CODIGO ASC, DEP_CODIGO ASC
    Log  ${QUERY_MOV}
    ${QUERY_MOV}      Query       ${QUERY_MOV}
    DisconnectDatabase
    RETURN    ${QUERY_MOV}


Resultado da query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser N
    ConnectDatabase
    ${QUERY_UPDATE_PARAM_GERAL}    Execute Sql String    UPDATE PARAMETRO_GERAL SET EMP_MANTER_COD_BENEF = 'N'
    DisconnectDatabase


Resultado da query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser S
    ConnectDatabase
    ${QUERY_UPDATE_PARAM_GERAL}    Execute Sql String    UPDATE PARAMETRO_GERAL SET EMP_MANTER_COD_BENEF = 'S'
    DisconnectDatabase


Query - Validar exclusão de contrato
    [Arguments]  ${arg1}
    # Validar dados CRM x Sistema de Gestão:
    #--Consulta por Codigo Contrato se a Conta, Contrato e Beneficiários estão excluidos
    #...    --INNER JOIN pessoa p on u.pessoa = p.id
    ConnectDatabase
    ${QUERY_EXC_CONTRATO}=    catenate
    ...    SELECT c2.CON_NOME AS nome_conta, c2.CON_NOME_FANTASIA AS nome_fantasia, c2.CON_DT_EXC AS dt_exc_conta, 
    ...      c.CTP_DT_EXC as dt_exc_contrato, u.USS_NOME, u.USS_DT_EXCLUSAO AS dt_exc_beneficiario
    ...    FROM USUARIO u
    ...    INNER JOIN CONTRATO c ON u.CON_CODIGO = c.CON_CODIGO AND u.CON_SEQUENCIA = c.CON_SEQUENCIA
    ...    INNER JOIN CONTRATANTE c2 ON c2.CON_CODIGO = c.CON_CODIGO AND c2.CON_SEQUENCIA = c.CON_SEQUENCIA
    ...    WHERE u.CON_CODIGO = ${DADOS_CONTRATO[0]}
    ...    --AND   c.PLA_NUMERO = '3006'
    ...    AND   u.CON_SEQUENCIA = '0'
    ...    AND     u.USS_NOME = '${nome_benef}'
    ...    ORDER BY dt_exc_beneficiario DESC
    Log  ${QUERY_EXC_CONTRATO}
    ${QUERY_EXC_CONTRATO}      Query       ${QUERY_EXC_CONTRATO}
    DisconnectDatabase
    RETURN    ${QUERY_EXC_CONTRATO}


Query - Limpar Fila de Agendadores
    ConnectDatabaseMySql
    # Conta o numero de contratos em fila
    ${QUERY_COUNT_FILA_AGEND}=    catenate
    ...    select count(*)
    ...     from aos_contracts_cstm
    ...    where sincronizacao_c='1'
    ${QUERY_COUNT_FILA_AGEND}   Execute SQL String    ${QUERY_COUNT_FILA_AGEND}

    # Limpa a Fila dos agendadores
    ${QUERY_LIMPAR_FILA_AGEND}=    catenate
    ...    UPDATE aos_contracts_cstm SET sincronizacao_c = '0' WHERE sincronizacao_c = '1'

    Run Keyword If  '${QUERY_COUNT_FILA_AGEND}' > '0'   Execute SQL String    ${QUERY_LIMPAR_FILA_AGEND}
    DisconnectDatabaseMySql


Executou querys para alterar as datas de criação da Movimentação e Titular
    ConnectDatabaseMySql
    ${DATA_MOV}  Get Current Date
    ${DATA_MOV}  Subtract Time From Date   ${DATA_MOV}     30 days
    ${DATA_MOV}  Convert Date       ${DATA_MOV}     exclude_millis=yes
    ${DATA_MOV}  Convert Date       ${DATA_MOV}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d %H:%M:%S

    ${QUERY_DATA_MOV_CAD1}=    catenate
    ...    UPDATE saude_historico_revisoes
    ...    INNER JOIN saude_movimentacao_cadastral_saude_historico_revisoes_c ON saude_historico_revisoes.id = saude_movimentacao_cadastral_saude_historico_revisoes_c.saude_movi4e7devisoes_idb
    ...    SET saude_historico_revisoes.date_entered = '${DATA_MOV}', saude_historico_revisoes.date_modified = '${DATA_MOV}'
    ...    WHERE saude_movimentacao_cadastral_saude_historico_revisoes_c.saude_movia67adastral_ida = '${ID_MOVIMENTACAO_CADASTRAL}'
    ...    AND saude_historico_revisoes.name = 'Encaminhado para Aprovação'
    Log  ${QUERY_DATA_MOV_CAD1}
    
    ${QUERY_DATA_MOV_CAD1}      Execute SQL String       ${QUERY_DATA_MOV_CAD1}


    ${QUERY_DATA_MOV_CAD2}=    catenate
    ...    UPDATE saude_movimentacao_cadastral
    ...    SET date_entered = '${DATA_MOV}'
    ...    WHERE id = '${ID_MOVIMENTACAO_CADASTRAL}'
    Log  ${QUERY_DATA_MOV_CAD2}
    ${QUERY_DATA_MOV_CAD2}      Execute Sql String       ${QUERY_DATA_MOV_CAD2}


    #Executou a query abaixo, alterando a data de criação para Data atual - 2 dias
    ${QUERY_DATA_TITULAR}=    catenate
    ...    UPDATE saude_beneficiarios
    ...    SET date_entered = '${DATA_MOV}'
    ...    WHERE id = '${ID_TITULAR}
    Log  ${QUERY_DATA_TITULAR}
    ${QUERY_DATA_TITULAR}      Execute SQL String       ${QUERY_DATA_TITULAR}

    DisconnectDatabaseMySql

## GABRIEL ${DADOS_CONTRATO} - LISTA QUE CONTEM OS DADOS
Executar Query para validar coluna situacao dos Beneficiarios 
    ConnectDatabase
    ${QUERY_BENS}=      catenate
    ...    SELECT name,grau_dependencia,ben_situacao_c,data_exclusao_c,exclusao_motivo_c 
    ...    FROM saude_beneficiarios b
    ...    INNER JOIN saude_beneficiarios_cstm bc ON b.id=bc.id_c
    ...    WHERE cpf in('493.758.610-66','162.879.346-73')
    Log  ${QUERY_BENS}
    ${QUERY_BENS}       Query       ${QUERY_BENS}
    DisconnectDatabase



Limpar Variaveis
    Apagar intens    ${DADOS_BENEF}


Apagar intens
    [Arguments]  @{list}
    FOR   ${elem}   IN   @{list}
        Remove values from list    ${list}    ${elem}
    END  