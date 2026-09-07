*** Settings ***
Library     SeleniumLibrary
Library     String
Library     DebugLibrary
Resource    ../../../main.resource
*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${SHORT_TIMEOUT} =  10
${TITULO_DECLARACAO_SAUDE} =  xpath://*[@id="pagecontent"]/div[1]/h2
${SUBMENU_DISPENSAR_EM_MASSA} =  xpath://*[@id="detail_header_action_menu"]/li/ul/li[1]/a[contains(text(), 'Dispensar')]
${TITULO_MODAL_DISPENSAR_EM_MASSA} =  xpath://*[@id="modalDispensarEmMassa"]/div/div/div[1]/h4[contains(text(), 'Dispensar em Massa')]
${SETA_SELECIONAR_MASSA} =  id:dispensaMassaSelecionarTodos
${OPCAO_SELECIONAR_TODOS} =  xpath://*[@id="dispensaMassaSelecionarTodos"]/option[contains(text(), 'Marcar Todos')]
${MOTIVO_DISPENSA_DS} =  id:dispensar_massa_motivo
${MOTIVO_COMPLEMENTO} =  id:dispensar_massa_complemento
${BTN_SALVAR_DISPENSA} =  id:btn-salvar-dispensa-massa
${ABA_PESSOAS} =  xpath://*[@id="tab1"]/em[contains(text(), 'Pessoas')]
${CHECKBOX_DISPENSADO1} =  xpath://*[@id="DeclaracoesTermos"]/table/tbody/tr[1]/td[8]/input
${CHECKBOX_DISPENSADO2} =  xpath://*[@id="DeclaracoesTermos"]/table/tbody/tr[2]/td[8]/input
${SUBMENU_FINALIZAR} =  xpath://*[@id="detail_header_action_menu"]/li/..//a[contains(text(), 'Finalizar')]
${STATUS_DISPENSAR} =  id:status
${CHECKBOX_VALIDAR_DECLARACAO_SAUDE} =  id:processo_declaracao_necessita_validar
${BTN_EDITAR} =  id:edit_button
${CHECKBOX_DISPENSAR_CONTRATO} =  id:dispensar_contrato
${MOTIVO_DISPENSA_DS_CONTRATO} =  id:dispensar_motivo_contrato
${MOTIVO_COMPLEMENTO_CONTRATO} =  id:dispensar_complemento_contrato
${BOTAO_SALVAR_DECLARACAO} =  id:SAVE_HEADER
${INPUT_ATRIBUIDO_A} =  id:assigned_user_name
${LABEL_ATRIBUIDO_A} =  id:assigned_user_name_label
${BOTAO_CRIAR_DEC_DE_SAUDE} =  id:saude_DECLARACAO_SAUDE_criar_button
${LINK_COTACAO} =  id:cotacao
${INPUT_NOME_DEC_SAUDE} =  id:name
${USUARIO_QUE_DISPENSOU} =  id:user_id_c
${DATA_DA_DISPENSA} =  id:dispensar_data
${COMPLEMENTO_MOTIVO} =  id:dispensar_complemento
${MOTIVO_STATUS} =  id:saude_motivo_status_id_c
${CHECKBOX_CONCLUIDO_MANUALMENTE} =  id:concluido_manualmente
${ABA_PESSOAS_DEC_SAUDE} =  xpath://*[@id="tab2"]/em[contains(., 'Pessoas')]
${SELECT_PESSOAS_DISPENSAR_EM_MASSA} =  id:dispensaMassaSelecionarTodos


*** Keywords ***
Clicar no link "Processo de Declaração de Saúde"
    [Arguments]  ${arg1}
    Sleep  3s
    Repeat Keyword  3 times  Press Keys  None  HOME
    ${d}  Run Keyword And Ignore Error   Set Focus To Element    xpath://*[@id="processo_declaracao"]/a[contains(.,'${arg1}')]
    Run Keyword If  "${d[0]}" == "PASS"  Wait Until Element Is Visible     xpath://*[@id="processo_declaracao"]/../span[contains(.,'${arg1}')]    timeout=${SHORT_TIMEOUT}
    Run Keyword If  "${d[0]}" == "PASS"  Click Link   xpath://*[@id="processo_declaracao"]/a[contains(.,'${arg1}')]
    
    ${e}  Run Keyword And Ignore Error   Wait Until Page Contains   Declaração de Saúde »   timeout=${TIMEOUT}
    # ${titulo}  Get Text  xpath://*[@id="pagecontent"]/div[1]/h2
    # ${titulo}    Split String From Right    ${titulo}  »
    Run Keyword If  "${e[0]}" == "PASS"  Sleep  10s
    Run Keyword If  "${e[0]}" == "PASS"  Set Focus To Element    xpath://*[@id="DEFAULT"]/tbody//a
    Run Keyword If  "${e[0]}" == "PASS"  Click Element   xpath://*[@id="DEFAULT"]/tbody//a

    ${c}  Run Keyword And Ignore Error   Wait Until Page Contains   Cotações »    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Set Focus To Element    xpath://*[@id="LBL_PANEL_OVERVIEW"]/tbody/tr[3]/td[2]/a
    Run Keyword If  "${c[0]}" == "PASS"  Click Element   xpath://*[@id="LBL_PANEL_OVERVIEW"]/tbody/tr[3]/td[2]/a


Validar Página Processo de Declaração de Saúde
    Wait Until Page Contains  Processo de Declaração de Saúde »   timeout=${TIMEOUT}


Verificar Página Processo de Declaração de Saúde com
    [Arguments]  ${arg1}
    ${nome_contrato}  Set Variables  ${EMPTY}
    ${nome_contrato}  Set Variables  ${arg1}
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains  Processo de Declaração de Saúde » ${arg1}   timeout=${TIMEOUT}
    ${nome_contrato}  Split String    ${nome_contrato}
    Run Keyword If  "${f[0]}" == "FAIL"     Wait Until Page Contains  ${nome_contrato[1]}   timeout=${TIMEOUT}
    Sleep  5s


Clicar no Botão Editar Processo de Declaração de Saude
    Repeat Keyword  4 times  Press Keys  None  HOME
    Set Focus To Element    ${BTN_EDITAR}
    Execute Javascript   document.getElementById("edit_button").click()
    #Click Element      ${BTN_EDITAR}

Acessando o menu DISPENSAR EM MASSA
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${SUBMENU_DISPENSAR_EM_MASSA}

Verificar Página Dispensar em Massa
    Wait Until Element Contains   ${TITULO_MODAL_DISPENSAR_EM_MASSA}    Dispensar em Massa   timeout=${TIMEOUT}
    Sleep  5s

Selecionar Checkbox Dispensar Validação de Declaração de Saúde
    Click Element    ${CHECKBOX_DISPENSAR_CONTRATO}
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains   Deseja dispensar o Contrato? As pessoas informadas serão removidas, deseja continuar?    timeout=${TIMEOUT}
    Run Keyword If  "${f[0]}" == "PASS"    Run Keyword And Ignore Error   Click Element    ${BOTAO_SIM_CONFIRMACAO}

Selecionar todos Beneficiarios
    Set Focus To Element  ${SETA_SELECIONAR_MASSA}
    Click Element  ${SETA_SELECIONAR_MASSA}
    Click Element  ${OPCAO_SELECIONAR_TODOS}

Selecionar o Motivo Dispensa DS
    Select From List By Label  ${MOTIVO_DISPENSA_DS_CONTRATO}  Dispensa de DS

Preencher o Complemento do Motivo
    Input Text  ${MOTIVO_COMPLEMENTO_CONTRATO}  Teste Automação - Prime.
    Click Element   xpath://*[@id="Pessoas_span"]/div[3]
    Sleep  5s

Clicar em SALVAR declaração de saude
    Set Focus To Element  ${BOTAO_SALVAR_DECLARACAO}
    Sleep  3s
    Click Element  ${BOTAO_SALVAR_DECLARACAO}
    Sleep  5s
    ${r}  Run Keyword And Ignore Error     Wait Until Page Contains    Campo obrigatório não preenchido: Id Usuário Atribuído    timeout=10
    Run Keyword If  "${r[0]}" == "PASS"    Set Focus To Element   ${INPUT_ATRIBUIDO_A}
    Run Keyword If  "${r[0]}" == "PASS"    Input Text   ${INPUT_ATRIBUIDO_A}   Prime Automação
    Run Keyword If  "${r[0]}" == "PASS"    Sleep  3s
    Run Keyword If  "${r[0]}" == "PASS"    Click Element  ${LABEL_ATRIBUIDO_A}
    Run Keyword If  "${r[0]}" == "PASS"    Set Focus To Element  ${BOTAO_SALVAR_DECLARACAO}
    Run Keyword If  "${r[0]}" == "PASS"    Sleep  3s
    Run Keyword If  "${r[0]}" == "PASS"    Click Element  ${BOTAO_SALVAR_DECLARACAO}
    Run Keyword If  "${r[0]}" == "PASS"    Sleep  5s


Clicar em Salvar Dispensar em Massa
    Set Focus To Element  ${BTN_SALVAR_DISPENSA}
    Click Element  ${BTN_SALVAR_DISPENSA}
    Sleep  5s

Clicar aba Pessoas
    Set Focus To Element  ${ABA_PESSOAS}
    Click Element  ${ABA_PESSOAS}

Validar checkbox dispensado esta marcado
    Checkbox Should Be Selected    ${CHECKBOX_DISPENSADO1}
    Checkbox Should Be Selected    ${CHECKBOX_DISPENSADO2}

Acessando o menu FINALIZAR DECLARACAO DE SAUDE
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${SUBMENU_FINALIZAR}

    Wait Until Page Contains    Deseja finalizar este processo manualmente?
    Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    Click Element  ${BOTAO_SIM_CONFIRMACAO}
    ${n}  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword If  "${n[0]}" == "PASS"  Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60

Validar Status Concluido
    Wait Until Page Contains    Status:      timeout=${TIMEOUT}
    Wait Until Page Contains    Concluído    timeout=${TIMEOUT}
    Sleep  3s


Clicar no link "Nome Cotação"
    [Arguments]  ${arg1}
    ${c1}  Run Keyword And Ignore Error   Set Focus To Element   xpath://*[@id="DEFAULT"]/tbody//a[contains(.,'${arg1}')]
    Run Keyword If  "${c1[0]}" == "PASS"  Sleep  3s
    Run Keyword If  "${c1[0]}" == "PASS"  Run Keyword And Ignore Error   Click Element   xpath://*[@id="DEFAULT"]/tbody//a[contains(.,'${arg1}')]
    Run Keyword If  "${c1[0]}" == "PASS"  Run Keyword And Ignore Error   Execute Javascript   document.getElementById("saude_processo_declaracao_aos_quotes_1aos_quotes_idb").click()
    Run Keyword If  "${c1[0]}" == "FAIL"  Click Element   xpath://*[@id="DEFAULT"]/tbody//a
    

Validar checkbox necessita validar declaracao de saude esta desmarcado
    ${c}  Run Keyword And Ignore Error   Checkbox Should Not Be Selected    ${CHECKBOX_VALIDAR_DECLARACAO_SAUDE}
    Run Keyword If  "${c[0]}" == "FAIL"  Sleep  3s
    


Clicar no link "Movimentação Cadastral" do processo de declaração de saude
    Set Focus To Element   xpath://*[@id="DEFAULT"]/tbody/tr[2]/td[2]/a
    Sleep  3s
    Click Element   xpath://*[@id="DEFAULT"]/tbody/tr[2]/td[2]/a
    Wait Until Page Contains    Movimentação Cadastral »     timeout=${TIMEOUT}


Clicar no botão "CRIAR", painel Declaração de Saúde
    Wait Until Page Contains    Processo de Declaração de Saúde »     timeout=${TIMEOUT}
    Set Focus To Element   ${BOTAO_CRIAR_DEC_DE_SAUDE}
    Click Element   ${BOTAO_CRIAR_DEC_DE_SAUDE}
    Wait Until Page Contains    Declaração de Saúde » Criar     timeout=${TIMEOUT}


Preencher campo "Nome" e clicou no botão "SALVAR"
    [Arguments]    ${arg1}
    Wait Until Page Contains    Processo de Declaração de Saúde » Criar     timeout=${TIMEOUT}
    Input Text  ${INPUT_NOME_DEC_SAUDE}  ${arg1}
    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    ${n}  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword If  "${n[0]}" == "PASS"  Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60


Clicar menu EDITAR > DISPENSAR EM MASSA, selecionar a Pessoa DEPENDENTE Filho, preencher o "Motivo" e clicar em SALVAR
    [Arguments]    ${arg1}
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Sleep  3s
    Click Element  ${SUBMENU_DISPENSAR_EM_MASSA}
    Page Should Contain Element  ${TITULO_BOX_DISPENSAR_EM_MASSA}
    Sleep  5s
    Set Focus To Element  xpath://*[@id="tabela_dispensa_massa_scroll"]/table//td[contains(., '${arg1}')]
    Sleep  3s
    Click Element  xpath://*[@id="tabela_dispensa_massa_scroll"]/table//td[contains(., '${arg1}')]
    Select From List By Label  ${MOTIVO_DISPENSA_DS}  Dispensa de DS
    Execute Javascript   document.getElementById("btn-salvar-dispensa-massa").click()
    Sleep  5s


Clicar botão "EDITAR"
    Set Focus To Element  ${BTN_EDITAR}
    Click Element  ${BTN_EDITAR}
    ${n}  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword If  "${n[0]}" == "PASS"  Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60


Selecionar campo "Dispensar Validação de Declaração de Saúde", clicar no botão "SIM", selecionar "Motivo" e clicar no botão "SALVAR"
    Select Checkbox  ${CHECKBOX_DISPENSAR_CONTRATO}
    Wait Until Page Contains  Deseja dispensar o Contrato? As pessoas informadas serão removidas, deseja continuar?  timeout=${TIMEOUT}
    Execute Javascript   document.getElementById("yui-gen0-button").click()
    Select From List By Label  ${MOTIVO_DISPENSA_DS_CONTRATO}  Dispensa de DS
    Execute Javascript  document.getElementById('dispensar_complemento_contrato').value="Teste Automação - Prime"
    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    ${n}  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword If  "${n[0]}" == "PASS"  Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60


CRM deve atualizar tela de Processo de Declaração de Saúde, aba Básica com os campos "Status" igual a CONCLUIDO, "Dispensar Validação de Declaração de Saúde" selecionado, "Usuário que dispensou" preenchido, "Data da Dispensa" preenchido, "Motivo" preenchido, "Complemento" visivel, "Concluído Manualmente" selecionado, os campos "Quantidade de vidas Aprovadas na cotação", "Quantidade de Pessoas: 1 Quantidade de Pessoas dispensadas de DS", Quantidade de Pessoas com DS Aprovada", "Quantidade de Pessoas com DS Recusada" não devem ser apresentados
    Wait Until Page Contains    Processo de Declaração de Saúde »   timeout=${TIMEOUT}
    Sleep  5s
    Page Should Contain  Concluído
    Checkbox Should Be Selected  ${CHECKBOX_DISPENSAR_CONTRATO}
    ${USUARIO_QUE_DISPENSOU}  Get Text  ${USUARIO_QUE_DISPENSOU}
    Should Be Equal  ${USUARIO_QUE_DISPENSOU}  Prime Automação

    ${DATA_DA_DISPENSA}  Get Text  ${DATA_DA_DISPENSA}
    ${COMPLEMENTO_MOTIVO}  Get Text  ${COMPLEMENTO_MOTIVO}
    Should Be Equal  ${COMPLEMENTO_MOTIVO}  Teste Automação - Prime

    ${MOTIVO_STATUS}  Get Text  ${MOTIVO_STATUS}
    Should Be Equal  ${MOTIVO_STATUS}  Dispensa de DS

    Checkbox Should Be Selected  ${CHECKBOX_CONCLUIDO_MANUALMENTE}

    Page Should Not Contain Element  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}
    Page Should Not Contain Element  ${QUANTIDADE_DE_PESSOAS}
    Page Should Not Contain Element  ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}
    Page Should Not Contain Element  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}


Aba Pessoa, com mensagem "Não há Declarações de Saúde para a seleção."
    Set Focus To Element  ${ABA_PESSOAS_DEC_SAUDE}
    Click Element  ${ABA_PESSOAS_DEC_SAUDE}
    Wait Until Page Contains  Não há Declarações de Saúde para a seleção.  timeout=${TIMEOUT}


Sem o painel Declaração de Saúde
    Page Should Not Contain Element  ${BOTAO_CRIAR_DEC_DE_SAUDE}


CRM deve atualizar tela Processo de Declaração de Saúde, com os campos "Status" igual a CONCLUIDO e "Concluído Manualmente" desmarcado
    Wait Until Page Contains    Processo de Declaração de Saúde »   timeout=${TIMEOUT}
    Sleep  5s
    Page Should Contain  Concluído

    Checkbox Should Not Be Selected  ${CHECKBOX_CONCLUIDO_MANUALMENTE}


Selecionou a Pessoa TITULAR com DS, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM
    [Arguments]    ${arg1}
    Set Focus To Element  xpath://*[@id="DeclaracoesTermos"]//tr[contains(., '00 - Titular')]//input[@class='selecionar_pessoa']
    Select Checkbox  xpath://*[@id="DeclaracoesTermos"]//tr[contains(., '00 - Titular')]//input[@class='selecionar_pessoa']

    Set Focus To Element  ${SETA_ACOES_DEC_SAUDE}
    Click Element  ${SETA_ACOES_DEC_SAUDE}
    Set Focus To Element  ${SETA_ACOES_APROVAR_SELECIONADOS}
    Click Element  ${SETA_ACOES_APROVAR_SELECIONADOS}

    Wait Until Page Contains    Deseja realizar a aprovação dos registros selecionados?   timeout=${TIMEOUT}
    Execute Javascript   document.getElementById("yui-gen0-button").click()
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Selecionou a Pessoa DEPENDENTE com DS, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR
    [Arguments]    ${arg1}
    Set Focus To Element  xpath://*[@id="DeclaracoesTermos"]//tr[contains(., '01 - Cônjuge')]//input[@class='selecionar_pessoa']
    Select Checkbox  xpath://*[@id="DeclaracoesTermos"]//tr[contains(., '01 - Cônjuge')]//input[@class='selecionar_pessoa']

    Set Focus To Element  ${SETA_ACOES_DEC_SAUDE}
    Click Element  ${SETA_ACOES_DEC_SAUDE}
    Set Focus To Element  ${SETA_ACOES_RECUSAR_SELECIONADOS}
    Click Element  ${SETA_ACOES_RECUSAR_SELECIONADOS}

    Wait Until Page Contains    Recusa Beneficiário   timeout=${TIMEOUT}
    Execute Javascript  document.getElementById('motivo_parecer').value="Teste Automação - Prime"
    Execute Javascript   document.getElementById("btn-recusa").click()
    Sleep  5s
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Clicou no menu EDITAR > DISPENSAR EM MASSA, selecionar as demais Pessoas, preencher o "Motivo" e clicar em SALVAR
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${SUBMENU_DISPENSAR_EM_MASSA}
    Page Should Contain Element  ${TITULO_BOX_DISPENSAR_EM_MASSA}
    Sleep  5s
    Select From List By Label  ${SELECT_PESSOAS_DISPENSAR_EM_MASSA}  Marcar Todos
    Sleep  3s
    Select From List By Label  ${MOTIVO_DISPENSA_DS}  Dispensa de DS
    Execute Javascript   document.getElementById("btn-salvar-dispensa-massa").click()
    Sleep  5s


CRM deve atualizar tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 15, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    Wait Until Page Contains    Processo de Declaração de Saúde »   timeout=${TIMEOUT}
    Sleep  5s
    ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}    Get Text  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}
    ${QUANTIDADE_DE_PESSOAS}    Get Text  ${QUANTIDADE_DE_PESSOAS}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}

    Page Should Contain  Concluído
    Should Be Equal  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}  15
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS}  3
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}  1
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}  1
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  1


CRM deve atualizar tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 30, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    Wait Until Page Contains    Processo de Declaração de Saúde »   timeout=${TIMEOUT}
    Sleep  5s
    ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}    Get Text  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}
    ${QUANTIDADE_DE_PESSOAS}    Get Text  ${QUANTIDADE_DE_PESSOAS}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}

    Page Should Contain  Concluído
    Should Be Equal  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}  30
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS}  3
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}  1
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}  1
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  1


A Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para um Beneficiário, RECUSADO PELO BENEFICIÁRIO para um Beneficiário, VAZIO para outros Beneficiários, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Beneficiário Aprovado e Dispensado, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para Beneficiário Recusado, coluna "Dispensado" desmarcada para Beneficiário Aprovado e Dispensado e selecionada para o Beneficiário Recusado
    Set Focus To Element  ${ABA_PESSOAS}
    Click Element  ${ABA_PESSOAS}
    ${situação1}  Get Table Cell  xpath://*[@id="DeclaracoesTermos"]/table  2  8
    ${situação2}  Get Table Cell  xpath://*[@id="DeclaracoesTermos"]/table  3  8
    ${situação3}  Get Table Cell  xpath://*[@id="DeclaracoesTermos"]/table  4  8

    Should Be Equal  ${situação1}  Aprovado
    Page Should Contain Element  ${STATUS_DS_GLYPHICON_OK}
    Checkbox Should Not Be Selected  ${CHECKBOX_DISPENSADO}

    Run Keyword If  '${situação2}' == 'Recusado pelo Beneficiário'  Should Be Equal  ${situação2}  Recusado pelo Beneficiário
    Run Keyword If  '${situação2}' == 'Recusado pelo Beneficiário'  Page Should Contain Element  ${STATUS_DS_GLYPHICON_X}
    Run Keyword If  '${situação2}' == 'Recusado pelo Beneficiário'  Checkbox Should Not Be Selected  ${CHECKBOX_DISPENSADO_DEPENDENTE1}
    
    Run Keyword If  '${situação3}' == 'Recusado pelo Beneficiário'  Should Be Equal  ${situação3}  Recusado pelo Beneficiário
    Run Keyword If  '${situação3}' == 'Recusado pelo Beneficiário'  Page Should Contain Element  ${STATUS_DS_GLYPHICON_X}
    Run Keyword If  '${situação3}' == 'Recusado pelo Beneficiário'  Checkbox Should Not Be Selected  ${CHECKBOX_DISPENSADO_DEPENDENTE2}
    
    Run Keyword If  '${situação3}' == '${EMPTY}'  Should Be Equal  ${situação3}  ${EMPTY}
    Run Keyword If  '${situação3}' == '${EMPTY}'  Page Should Contain Element  ${STATUS_DS_GLYPHICON_OK}
    Run Keyword If  '${situação3}' == '${EMPTY}'  Checkbox Should Be Selected  ${CHECKBOX_DISPENSADO_DEPENDENTE2}

    Run Keyword If  '${situação2}' == '${EMPTY}'  Should Be Equal  ${situação2}  ${EMPTY}
    Run Keyword If  '${situação2}' == '${EMPTY}'  Page Should Contain Element  ${STATUS_DS_GLYPHICON_OK}
    Run Keyword If  '${situação2}' == '${EMPTY}'  Checkbox Should Be Selected  ${CHECKBOX_DISPENSADO_DEPENDENTE1}


Com uma Declaração de Saúde, com "status" APROVADO e uma Declaração de Saúde, com a "status" RECUSADO PELO BENEFICIÁRIO
    ${situação1}  Get Table Cell  xpath://*[@id="list_subpanel_saude_processo_declaracao_saude_declaracao_saude_1"]/table  3  3
    ${situação2}  Get Table Cell  xpath://*[@id="list_subpanel_saude_processo_declaracao_saude_declaracao_saude_1"]/table  4  3
    
    Run Keyword If  '${situação1}' == 'Aprovado'  Should Be Equal  ${situação1}  Aprovado
    Run Keyword If  '${situação1}' == 'Recusado pelo Beneficiário'  Should Be Equal  ${situação1}  Recusado pelo Beneficiário
    
    Run Keyword If  '${situação2}' == 'Aprovado'  Should Be Equal  ${situação2}  Aprovado
    Run Keyword If  '${situação2}' == 'Recusado pelo Beneficiário'  Should Be Equal  ${situação2}  Recusado pelo Beneficiário
    

CRM deve atualizar tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 10, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    Wait Until Page Contains    Processo de Declaração de Saúde »   timeout=${TIMEOUT}
    Sleep  5s
    ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}    Get Text  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}
    ${QUANTIDADE_DE_PESSOAS}    Get Text  ${QUANTIDADE_DE_PESSOAS}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}

    Page Should Contain  Concluído
    Should Be Equal  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}  10
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS}  3
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}  1
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}  1
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  1


Validar Alerta "Selecione pelo menos uma pessoa"
    Sleep  5s
    Run Keyword And Ignore Error  Alert Should Be Present  Selecione pelo menos uma pessoa!  ACCEPT


# Step Teste
#     Click Element  ${elemento}