*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary


*** Variables ***
${TIMEOUT} =  30
${ABA_INCLUSAO_ARQUIVO} =  xpath:(//a[contains(.,'Inclusão por Arquivo')])[2]
${ESCOLHER_ARQUIVO} =  id:arquivo
${SALVAR_FINALIZAR} =  xpath://*[@id="tab_5"]//div[2]/input[1][contains(@Value,'SALVAR E FINALIZAR')]
${MENU_ACOES} =  xpath://button[1][contains(.,'AÇÕES')]
${CONFIRMAR_IMPORTACAO} =  xpath:(//a[contains(.,'Confirmar Importação')])
${CONFIRMAR_SIM} =  id:modal_confirma_exclusao_btn
${ID_MOV_CADASTRAL} =  //*[@id="tab_1"]//div[6]/a

*** Keywords ***
Gerou arquivo com 10 vidas
    [Arguments]  @{arg1}
    Clear Files In Path  ${DOWNLOADS_FOLDER}  .csv  gerador
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    Execute Javascript    window.open('')
    Get Window Titles
    Switch Window    title=undefined
    Go To   ${GERADOR_URL}
    Input Text  xpath=//form[8]/input[1]  10
    Input Text  xpath=//form[8]/input[2]  ${PROD_ASSIST}
    Input Text  xpath=//form[8]/input[3]  ${PROD_ACESSORIO}
    Click Button  xpath=//form[8]/input[6]
    Click Button  xpath=//form[8]/input[7]
    Close Window
    Sleep  5s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}

Clicou na aba "Inclusão por Arquivo"
    Switch Window  MAIN
    Wait Until Page Contains  Movimentação Cadastral  timeout=${TIMEOUT}
    Set Focus To Element  ${ABA_INCLUSAO_ARQUIVO}
    Click Element  ${ABA_INCLUSAO_ARQUIVO}
    
Selecionou o arquivo e clicou no botão "SALVAR E FINALIZAR"
    Wait Until Page Contains    Nova Inclusão    timeout=${TIMEOUT}
    Wait Until Element Is Visible     ${ESCOLHER_ARQUIVO}
    Choose File  ${ESCOLHER_ARQUIVO}    ${DOWNLOADS_FOLDER}${/}gerador.csv
    Set Focus To Element  ${SALVAR_FINALIZAR}
    Click Element  ${SALVAR_FINALIZAR}

Clicou no menu Ações > Confirmar Importação e clicar no botão "SIM" na modal de Confirmação
    Wait Until Page Contains    Detalhes da Inclusão    timeout=${TIMEOUT}
    Set Focus To Element  ${MENU_ACOES}
    Click Element  ${MENU_ACOES}
    Click Element  ${CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains  Tem certeza que deseja confirmar a importação?  timeout=${TIMEOUT}
    Set Focus To Element  ${CONFIRMAR_SIM}
    Click Element  ${CONFIRMAR_SIM}

Clicar no link "ID MOV CADASTRAL"
    Wait Until Page Contains  Movimentação Cadastral:  timeout=${TIMEOUT}
    Set Focus To Element  ${ID_MOV_CADASTRAL}
    Click Element  ${ID_MOV_CADASTRAL}