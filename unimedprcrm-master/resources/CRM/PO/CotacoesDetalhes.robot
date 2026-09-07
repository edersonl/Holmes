*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../../../main.resource
*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${TITULO_COTACAO_DET} =  xpath://*[@id="pagecontent"]/div[1]/h2
${CRIAR_CONTRATO} =  xpath://*[@id="detail_header_action_menu"]/li/ul/..//a[contains(.,'Criar')]
${PROCESSO_DE_DECLARACAO_SAUDE} =  id:saude_proc1c4flaracao_ida
${SUBMENU_INICIAR_PROCESSO_DECLARACAO_SAUDE} =  xpath://*[@id="detail_header_action_menu"]//a[contains(.,'Processo de Declaração de Saúde')]

*** Keywords ***
Verificar Página Detalhes de Cotacao com
    [Arguments]  ${arg1}
    ${arg1}  Convert To Uppercase   ${arg1}
    ${titulo}  Catenate  Cotações » ${arg1}
    Wait Until Element Contains  ${TITULO_COTACAO_DET}   ${titulo}   timeout=${TIMEOUT}
    Sleep  5s

# Verificar Página Detalhes de Cotacao Portabilidade(PJ) com
#     [Arguments]  ${arg1}
#     ${titulo}  Catenate  Cotações » ${arg1}
#     Wait Until Element Contains  ${TITULO_COTACAO_DET}   ${titulo}   timeout=${TIMEOUT}
#     Sleep  5s

Apresentar a tela Cotações »
    Wait Until Page Contains  Cotações »   timeout=${TIMEOUT}

Clicar no link "Nome Oportunidade"
    [Arguments]  ${arg1}
    ${arg1}  Convert To Uppercase   ${arg1}
    Click Element  xpath://*[@id="opportunity_id"]/../span[contains(.,'${arg1}')]

# Clicar no link "Nome Oportunidade" Portabilidade(PJ)
#     [Arguments]  ${arg1}
#     Click Element  xpath://*[@id="opportunity_id"]/../span[contains(.,'${arg1}')]

Clicar no submenu "Criar Contrato"
    Set Focus To Element  ${SETA_EDITAR} 
    Click Element  ${SETA_EDITAR}
    Click Element  ${CRIAR_CONTRATO}

Clicar no link "Nome Oportunidade" na tela Cotações
    [Arguments]  ${arg1}
    ${e}  Run Keyword And Ignore Error  Click Element  xpath://*[@id="opportunity_id_c"]/../span[contains(.,'${arg1}')]
    Run Keyword If  "${e[0]}" == "FAIL"  Click Element  xpath://*[@id="opportunity_id"]/../span[contains(.,'${arg1}')]

Verificar "Titulo Contrato" na tela Cotações
    [Arguments]  ${arg1}
    ${e}  Run Keyword And Ignore Error  Click Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1}')]
    Run Keyword If  "${e[0]}" == "FAIL"  Clicar no submenu "Criar Contrato"
    Run Keyword If  "${e[0]}" == "PASS"  Clicando no link "Titulo Contrato" na tela Cotações  ${arg1}

Clicando no link "Titulo Contrato" na tela Cotações
    [Arguments]  ${arg1}
    Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1}')]
    Click Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1}')]


Preencher automaticamente o campo "Processo de Declaração de Saúde"
    [Arguments]  ${arg1}
    ${PROCESSO_DE_DECLARACAO_SAUDE}  Get Text  ${PROCESSO_DE_DECLARACAO_SAUDE}
    Should Be Equal  ${PROCESSO_DE_DECLARACAO_SAUDE}  ${arg1}


Clicar no menu "INICIAR PROCESSO DE DECLARAÇÃO DE SAÚDE"
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Wait Until Page Contains    Cotações »    timeout=${TIMEOUT}
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Sleep  5s
    Set Focus To Element  ${SUBMENU_INICIAR_PROCESSO_DECLARACAO_SAUDE}
    Click Element  ${SUBMENU_INICIAR_PROCESSO_DECLARACAO_SAUDE}
