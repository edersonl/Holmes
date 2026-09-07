*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary

Resource   ../CRMUnimedPR.robot
Resource   ../../../utils/Comum.robot

*** Variables ***
${SELECT_MODULO} =             xpath://select[@id='modulo']
${SELECT_OPTION_CONVENIO} =    xpath://option[@label='Convênio']
${SELECT_OPTION_PRODUTO} =     xpath://option[@label='Produto']
${INPUT_DT_INICIO_ALCADA} =    xpath://input[@id='data_ini']
${BTN_SALVAR_ALCADA} =        xpath://input[@id='SAVE_HEADER'] 

${INPUT_PERCENT_DESCONTO_ATE} =    xpath://input[@id='percentual_desconto_ate']
${INPUT_PERCENT_ACRESCIMO_ATE} =   xpath://input[@id='percentual_acrescimo_ate']
${SELECT_FUNCAO_OPTION} =     xpath://select[@id='funcao']/option[@label='Testes Automatizados - Prime Control']     

${BTN_lIMPAR_ALCADA} =        xpath://input[@id='search_form_clear']
${BTN_SEARCH_BASIC} =         xpath://input[@id='search_form_submit']
${ITENS_TABLE_PESQUISA} =       xpath://table/tbody/tr[@class='oddListRowS1']
${SELECT_OPTION_ALCADA} =      xpath://select[@id='modulo_basic']

*** Keywords ***
Cadastrar uma Alçada de "${type}"
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${plano}    Alçada » Pesquisar
    Click Element       ${BTN_lIMPAR_ALCADA}
    Sleep    1
    IF      $type == "Convenio"
        Select From List By Label        ${SELECT_OPTION_ALCADA}        Convênio
    ELSE
        Select From List By Label        ${SELECT_OPTION_ALCADA}        Produto

    END
    Click Element        ${BTN_SEARCH_BASIC}
    Scroll Element Into View    xpath://div[@id='links']/a[1]
    Set Browser Implicit Wait    10 seconds
    ${VALIDATION}    Run Keyword And Return Status       Page Should Contain Element    ${ITENS_TABLE_PESQUISA}     timeout=10
    IF    $VALIDATION == True
        Log To Console    "${VALIDATION} , Alçadas já cadastradas"
        Log To Console    "${type} , Tipo de alçada pesquisada.
    ELSE
        Click Element       ${BTN_CRIAR}
        Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
        ${criar}    Get text    ${PLANOS_TITLE_PAGE}
        Should Be Equal     ${criar}    Alçada » Criar
        
        Click Element    ${SELECT_MODULO}
        IF   $type == 'Produto'
            Click Element    ${SELECT_OPTION_PRODUTO}
            Sleep    2
        ELSE
            Click Element    ${SELECT_OPTION_CONVENIO}
            Sleep    2
        END

        ${date}  Get Current Date
        ${date}  Convert Date  ${date}  exclude_millis=yes
        ${data_format_init}  Convert Date   ${date}   date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
        Set Global Variable     ${data_format_init} 
        Execute Javascript      document.getElementById('data_ini').value = '${data_format_init}';
        
        Input Text    ${INPUT_PERCENT_DESCONTO_ATE}    10,00
        Input Text    ${INPUT_PERCENT_ACRESCIMO_ATE}    5,45

        Click Element    ${SELECT_FUNCAO_OPTION}
        Sleep    2   
        Click Element    ${BTN_SALVAR_ALCADA}

        Então o CRM deve apresentar a tela Alçada Cadastrada   
    END



Então o CRM deve apresentar a tela Alçada Cadastrada
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Contain     ${plano}    ${data_format_init} 
    
    ${modulo}     Get text            xpath://table[@id='DEFAULT']/tbody/tr[1]/td[2]
    IF    $modulo == 'Produto'
        Should Be Equal    ${modulo}        Produto
    ELSE
        Should Be Equal    ${modulo}        Convênio
    END
    ${function}    Get text            xpath://table[@id='DEFAULT']/tbody/tr[1]/td[4]
    Should Contain    ${function}        Testes Automatizados - Prime Control
    Page Should Contain Element             xpath://a[@id='edit_button']