*** Settings ***
Library    SeleniumLibrary
Resource    ../../../main.resource

*** Variables ***
${PARAM_COMERC_COMERCIALIZACAO} =  xpath://em[contains(text(), 'Comercialização')]
${TIMEOUT} =  30 
${CHECKBOX_AUTOMATICAMENTE_PROCESSO_DEC_SAUDE} =  id:validar_obrigatoriedade_ds_c

*** Keywords ***
Verificar Página Parametros Comerciais
    Wait Until Page Contains  Parâmetros Comerciais » Razão Social  timeout=${TIMEOUT}


Clicar no menu Comercializacao
    Set Focus To Element  ${PARAM_COMERC_COMERCIALIZACAO}
    Click Element  ${PARAM_COMERC_COMERCIALIZACAO}


Validar Checkbox "Criar automaticamente Processo de Declaração de Saúde"
    ${p}  Run Keyword And Ignore Error  Checkbox Should Be Selected  ${CHECKBOX_AUTOMATICAMENTE_PROCESSO_DEC_SAUDE}
    Run Keyword If  "${p[0]}" == "FAIL"  Run Keyword  Habilitar Checkbox "Criar automaticamente Processo de Declaração de Saúde"


Habilitar Checkbox "Criar automaticamente Processo de Declaração de Saúde"
    Set Focus To Element  ${BTN_EDITAR}
    Click Element  ${BTN_EDITAR}
    Wait Until Page Contains  Parâmetros Comerciais » Razão Social  timeout=${TIMEOUT}
    Set Focus To Element  ${PARAM_COMERC_COMERCIALIZACAO}
    Click Element  ${PARAM_COMERC_COMERCIALIZACAO}
    Select Checkbox  ${CHECKBOX_AUTOMATICAMENTE_PROCESSO_DEC_SAUDE}
    Sleep  3s
    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Parâmetros Comerciais » Razão Social  timeout=${TIMEOUT}


Desmarcar o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    ${p}  Run Keyword And Ignore Error  Checkbox Should Not Be Selected  ${CHECKBOX_AUTOMATICAMENTE_PROCESSO_DEC_SAUDE}
    Run Keyword If  "${p[0]}" == "FAIL"  Run Keyword  Desabilitar Checkbox "Criar automaticamente Processo de Declaração de Saúde"


Desabilitar Checkbox "Criar automaticamente Processo de Declaração de Saúde"
    Set Focus To Element  ${BTN_EDITAR}
    Click Element  ${BTN_EDITAR}
    Wait Until Page Contains  Parâmetros Comerciais » Razão Social  timeout=${TIMEOUT}
    Sleep  5s
    Set Focus To Element  ${PARAM_COMERC_COMERCIALIZACAO}
    Click Element  ${PARAM_COMERC_COMERCIALIZACAO}
    Unselect Checkbox  ${CHECKBOX_AUTOMATICAMENTE_PROCESSO_DEC_SAUDE}
    Sleep  3s
    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Parâmetros Comerciais » Razão Social  timeout=${TIMEOUT}
