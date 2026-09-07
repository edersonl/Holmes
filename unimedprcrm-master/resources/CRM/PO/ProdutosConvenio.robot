*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary

Resource   ../CRMUnimedPR.robot
Resource   ../../../utils/Comum.robot

*** Variables ***
${INPUT_COD_CONVENIO} =     xpath://input[@id='codigo']
${INPUT_CONVENIO_NAME_COMERCIAL} =     xpath://input[@id='nome_comercializacao']
${INPUT_CONVENIO_NAME} =     xpath://input[@id='name']
${INPUT_DESCRICAO_CONVENIO} =   xpath://textarea[@id='description']
${TXT_TABLE_INFO_ALCADA} =    xpath://div[@id='list_subpanel_saude_alcada_saude_convenio_1']/table/tbody//em
${CONVENIO_BTN_EDITAR} =            xpath://a[@id='edit_button']
${TXT_TABLE_NOME_COMERC_CONVENIO} =    xpath://table[@id='DEFAULT']//tr[2]/td[4]/span
${TXT_TABLE_NOME_CONVENIO} =    xpath://table[@id='DEFAULT']//tr[2]/td[2]/span
${TXT_TABLE_CODIGO_CONVENIO} =    xpath://table[@id='DEFAULT']//tr[1]/td[2]/span
${TXT_TABLE_DTINICIO_CONVENIO} =    xpath://table[@id='DEFAULT']//tr[3]/td[2]/span
*** Variables ***
${NOME_CONVENIO} =        Convenio Prime Test
# ${NUM_COD_CONVENIO} =     131

*** Keywords ***
Cadastrar um novo Convenio
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${plano}    Convênio » Pesquisar
    Execute Javascript       window.scrollTo(0,200)    
    ${VALIDATION}    Run Keyword And Return Status       Page Should Contain Element    xpath=//tr[@class='oddListRowS1']     timeout=10
    IF    $VALIDATION == True
        Log To Console    "Convênios já cadastrados!"
        Click Element   xpath=//tr[@class='oddListRowS1']/td[3]/a
    ELSE

        Click Element       ${BTN_CRIAR}
        Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
        ${criar}    Get text    ${PLANOS_TITLE_PAGE}
        Should Be Equal     ${criar}    Convênio » Criar
        ${NUM_COD_CONVENIO}  Evaluate  random.randint(1, 300)
        Input Text      ${INPUT_COD_CONVENIO}                 ${NUM_COD_CONVENIO} 
        Set Global Variable     ${NUM_COD_CONVENIO}
        Input Text      ${INPUT_CONVENIO_NAME}                ${NOME_CONVENIO}
        Input Text      ${INPUT_CONVENIO_NAME_COMERCIAL}      ${NOME_CONVENIO}
        Set Global Variable     ${NOME_CONVENIO}

        ${date}  Get Current Date
        ${date}  Convert Date  ${date}  exclude_millis=yes
        ${date}  Add Time To Date   ${date}  1 days    exclude_millis=yes
        ${data_format_convenio}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
        Log To Console    Data do convenio, ${data_format_convenio}
        Execute Javascript      document.getElementById('data_ini').value = '${data_format_convenio}';
        #Execute Javascript      document.getElementById('data_fim').value = '${data_format_convenio}';
        Click Element    ${BTN_SALVAR_PLANO}

        Validou no CRM a tela Convenio com o Nome
    END


CRM deve apresentar a tela Convênio » NOME DO CONVÊNIO
    Wait Until Page Contains Element        xpath=//div[@class='moduleTitle']/h2[contains(text(),'${NOME_CONVENIO}')]
    Page Should Contain Element    ${TABLE_PLANO_SALVO}    timeout=10

    ${COMERC}    Get text   ${TXT_TABLE_NOME_COMERC_CONVENIO}
    Should Be Equal     ${COMERC}    ${NOME_CONVENIO}

    ${NOME}    Get text  ${TXT_TABLE_NOME_CONVENIO}
    Should Be Equal     ${NOME}    ${NOME_CONVENIO}
    
    ## CAPTURANDO DATA ATUAL
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${date}  Add Time To Date   ${date}  1 days    exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y

    ${DATA}    Get text  ${TXT_TABLE_DTINICIO_CONVENIO}
    Should Be Equal     ${DATA}   ${data_formatada}
    
    Execute Javascript       window.scrollTo(0,350)    

    ${vazio1}    Get text   ${TXT_TABLE_INFO_ALCADA}
    Should Be Equal     ${vazio1}    Nenhum resultado encontrado.


Vincular uma Alçada em um Convenio
    Wait Until Page Contains Element    ${CONVENIO_BTN_EDITAR}      timeout=10      
    Execute Javascript       window.scrollTo(0,450)
    Wait Until Element Is Visible      xpath=//a[@id='saude_alcada_saude_convenio_1_select_button']
    ${STT_ALCADA_CONVENIO}    Run Keyword And Return Status     Wait Until Page Contains Element   xpath=//li[@class='sugar_action_button']//div/a[text()='editar']
    IF      $STT_ALCADA_CONVENIO == True
        Log To Console      Alçada já vinculada no Convênio
        Log     Alçada já vinculada no Convênio
    ELSE
        Click Element                        xpath=//a[@id='saude_alcada_saude_convenio_1_select_button']
        Switch Window    NEW
        Wait Until Page Contains Element    xpath=//span[text()='Pesquisar Alçada']

        Execute Javascript       window.scrollTo(0,450)
        Wait Until Element Is Visible        xpath=//table//tbody//td/a[text()='Convênio']
        Click Element                        xpath=//table//tbody//td/a[text()='Convênio']
        Sleep    2
        Switch Window    MAIN
        Wait Until Page Contains Element    xpath=//li[@class='sugar_action_button']/a[@id='edit_button']
        Page Should Contain Element        xpath=//div[@id='list_subpanel_saude_alcada_saude_convenio_1']//table//tbody/tr[@class='oddListRowS1']    limit=1

    END