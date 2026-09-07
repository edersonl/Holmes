*** Settings ***
Library     SeleniumLibrary
Resource    ../../../main.resource

*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${TITULO_CONFERENCIA} =  xpath://*[@id="pagecontent"]/div[1]/h2
${BTN_CONFERIR_PROCESSOS} =  id:create_link
${DATA_ENCAMINHADO_INICIAL} =  id:encaminhado_data_inicio
${CHECK_MEUS_ITENS} =  id:meus_itens
${BTN_PESQUISAR_PROCESSOS} =  id:search_form_submit
${ORDENAR_ENCAMINHADO_APROVACAO} =  xpath://*[@id="DataTables_Table_0"]/thead/tr/th[10]
${BTN_CONFERIR_CONTRATO} =  xpath://*[@id="DataTables_Table_0"]/tbody/tr[1]/td[1]/a
${MENU_VALIDAR_DADOS} =  xpath://*[@id="detail_header_action_menu"]/li/a[contains(text(),'Validar Dados')]
${QUANTIDADE_DE_VIDAS_INCONSISTENCIA} =  id:contrato_qtd_vida_erro
${QUANTIDADE_DE_VIDAS_ADVERTENCIA} =  id:contrato_qtd_vida_advertencia
${QUANTIDADE_DE_VIDAS} =  id:contrato_qtd_vida
${QUANTIDADE_DE_VIDAS_CORRETO} =  id:contrato_qtd_vida_sucesso

*** Keywords ***
Verificar Página Conferencia Pesquisar
    Wait Until Element Contains  ${TITULO_CONFERENCIA}   Conferência » Pesquisar   timeout=${TIMEOUT}


Clicar botão Conferir Processos
    Set Focus To Element  ${BTN_CONFERIR_PROCESSOS}
    Click Element  ${BTN_CONFERIR_PROCESSOS}


Verificar Página Conferir Processos
    Wait Until Element Contains  ${TITULO_CONFERENCIA}   Conferência » Conferir Processos    timeout=${TIMEOUT}


Preencher filtro Encaminhado para aprovação em (Data Atual)
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Input Text  ${DATA_ENCAMINHADO_INICIAL}  ${date}
    Sleep  ${SLEEP}


Selecionar o checkbox Meus Itens
    ${c}  Run Keyword And Ignore Error   Checkbox Should Be Selected    ${CHECK_MEUS_ITENS}
    Run Keyword If  "${c[0]}" == "FAIL"  Set Focus To Element  ${CHECK_MEUS_ITENS}
    Run Keyword If  "${c[0]}" == "FAIL"  Click Element  ${CHECK_MEUS_ITENS}


Clicar botão Pesquisar Processos
    Set Focus To Element  ${BTN_PESQUISAR_PROCESSOS}
    Click Element  ${BTN_PESQUISAR_PROCESSOS}


Clicar Encaminhado para aprovação - Decrescente
    Set Focus To Element  ${ORDENAR_ENCAMINHADO_APROVACAO}
    Repeat Keyword  2 times  Click Element  ${ORDENAR_ENCAMINHADO_APROVACAO}


Clicar em Conferir
    [Arguments]  ${arg1}
    Set Focus To Element  xpath://td[contains(text(),'${arg1}')]/../td/a
    Click Element  xpath://td[contains(text(),'${arg1}')]/../td/a


Clicar em Conferir exclusão de beneficiario
    [Arguments]  ${arg1}
    Set Focus To Element  xpath://td[contains(text(),'${arg1}')]/../td/a
    Click Element  xpath://td[contains(text(),'${arg1}')]/../td/a
    Wait Until Page Contains    Iniciar Conferência para    timeout=${TIMEOUT}


Clicar em Sim em Conferencia
    Wait Until Page Contains    Iniciar Conferência para     timeout=${TIMEOUT}
    Click Element   ${BOTAO_SIM_CONFIRMACAO}
    ${z}  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${z[0]}" == "PASS"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}