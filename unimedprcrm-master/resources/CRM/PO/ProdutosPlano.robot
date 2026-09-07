*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary
Library    DateTime
Resource    ../../../main.resource

*** Variables ***
${PLANOS_TITLE_PAGE} =     xpath://div[@class='moduleTitle']/h2
${BTN_CRIAR} =             xpath://a[@id='create_link']

${INPUT_NUM_COD_PLANO} =    xpath://input[@id='pla_cod_c'] 
${INPUT_NAME_PLANO} =       xpath://input[@id='name']
${INPUT_NAME_COMERCIALIZA} =     xpath://input[@id='pla_nome_comercializacao_c']
${INPUT_DT_INCIO} =         xpath://input[@id='pla_data_ini_c'] 
${INPUT_DT_FIM} =           xpath://input[@id='pla_data_fim_c'] 
${BTN_SALVAR_PLANO} =             xpath://input[@id='SAVE_HEADER'] 
${TABLE_PLANO_SALVO} =      xpath://div[@id='detailpanel_1']/table

##  VALIDAR ESSE TEXTO
${TXT_TABLE_INFO_ADICIONAL} =     xpath://div[@id='list_subpanel_saude_info_adicional_aos_product_categories_1']/table/tbody//td/em
${TXT_TABLE_INFO_TAXAS} =         xpath://div[@id='list_subpanel_saude_taxas_aos_product_categories_1']/table/tbody//td/em
${TXT_TABLE_INFO_PRODUTOS} =      xpath://div[@id='list_subpanel_aos_products']/table/tbody//td/em


***Keywords***

Cadastrar um segundo Plano
    [Arguments]       ${TYPE_2}     ${PLA_CDO_BD}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${plano}    Plano » Pesquisar
    Click Element       ${BTN_CRIAR}
    
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${criar}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${criar}    Plano » Criar
    Debug
    Input Text      ${INPUT_NUM_COD_PLANO}       ${PLA_CDO_BD}
    Input Text      ${INPUT_NAME_PLANO}          Plano ${TYPE_2} ${PLA_CDO_BD}
    ${GLOBAL_NAME_PLA_SEGUNDO} =    Catenate         Plano     ${TYPE_2}    ${PLA_CDO_BD}
    ${GLOBAL_NAME_PLA_2} =    Catenate        ${GLOBAL_NAME_PLA_SEGUNDO}
    Set Global Variable    ${GLOBAL_NAME_PLA_2}
    Input Text      ${INPUT_NAME_COMERCIALIZA}   Plano ${TYPE_2} ${PLA_CDO_BD}
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${date}  Add Time To Date   ${date}  1 days    exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Log To Console    ${data_formatada}
    Execute Javascript      document.getElementById('pla_data_ini_c').value = '${data_formatada}';
    Sleep       1
    Click Element    ${BTN_SALVAR_PLANO}


Cadastrar um novo Plano "${TYPE}"
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${plano}    Plano » Pesquisar
    Click Element       ${BTN_CRIAR}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${criar}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${criar}    Plano » Criar
    Input Text      ${INPUT_NUM_COD_PLANO}       ${str_pla_cod}
    Input Text      ${INPUT_NAME_PLANO}          ${str_pla_cod} Plano ${TYPE}
    ${GLOBAL_NAME_PLA} =    Catenate         ${str_pla_cod}     Plano     ${TYPE}     
    Set Global Variable    ${GLOBAL_NAME_PLA}
    Input Text      ${INPUT_NAME_COMERCIALIZA}   ${str_pla_cod} Plano ${TYPE} 
    

    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${date}  Add Time To Date   ${date}  1 days    exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Log To Console    ${data_formatada}
    Execute Javascript      document.getElementById('pla_data_ini_c').value = '${data_formatada}';
    Sleep       1
    Click Element    ${BTN_SALVAR_PLANO}
    

CRM deve apresentar a tela Plano » Nome do Plano
    [Arguments]     ${NAME_PLANO}
    Wait Until Page Contains Element        xpath=//div[@class='moduleTitle']/h2[contains(text(),' ${NAME_PLANO}')]

    Page Should Contain Element    ${TABLE_PLANO_SALVO}    timeout=10
    ${vazio1}    Get text   ${TXT_TABLE_INFO_ADICIONAL}
    Should Be Equal     ${vazio1}    Nenhum resultado encontrado.
    ${vazio2}    Get text    ${TXT_TABLE_INFO_TAXAS}
    Should Be Equal     ${vazio2}    Nenhum resultado encontrado.
    ${vazio3}    Get text    ${TXT_TABLE_INFO_PRODUTOS}
    Should Be Equal     ${vazio3}    Nenhum resultado encontrado.