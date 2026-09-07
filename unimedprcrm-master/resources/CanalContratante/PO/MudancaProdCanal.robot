*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary


*** Variables ***
${TIMEOUT} =  30
${EDIT_BUTTON}  id:edit_button
${SAVE_FOOTER_BUTTON}  id:SAVE_FOOTER
${PESQUISAR_CONTRATO} =  xpath://span[contains(@data-toggle,'modal')]
${BUTTON_PESQUISAR} =  xpath://input[@value='PESQUISAR']
${CONTRATO_BENEFICIARIO} =  xpath://*[@id="table_list_modal_contratos"]/tbody/tr[1]
${SALVAR_CONTRATO} =  xpath://input[contains(@value,'SALVAR')]
${SITUACAO_STATUS} =  xpath://button[contains(.,'Em Andamento')]
${TEXT_TABELA_EXCLUSAO} =  id:table_list_inclusao_benef_info
${ALTERACAO} =  id:inicio_vigencia
${MOTIVO_MUDANCA} =  id:submotivo
${PRODUTO_ATUAL} =  id:produto_atual_nome
${OBSERVACAO} =  id:motivo
${BENEFICIARIO_MUD} =  id:beneficiario_name
${NOVO_PRODUTO_MUD} =  id:novo_produto
${PESQUISAR_TITULAR} =  xpath://*[@id="form_mudanca"]/div/div[2]/div[1]/div[3]/div/span
${CAMPO_PESQUISA} =  xpath://*[@id="table_list_pesquisa_benef_filter"]/label/input
${SELECIONAR_BENEF_TITULAR} =  xpath://*[@id="table_list_pesquisa_benef"]/tbody/tr[1]
${NOVO_PRODUTO_DEP} =  xpath://*[@id="produtos_dependentes"]//div/select[1]
${CHECKBOX_DEPENDENTES} =  xpath://*[@id="produtos_dependentes"]//div/input[8]
${BUTTON_MUD_PROD_SALVAR} =  xpath://*[@id="form_mudanca"]/div/div[3]/input
${PRIORIDADES_MUD_PROD} =  xpath://*[@id="DataTables_Table_0"]/tbody/tr/td[3]
${MENU_MOVIMENTACAO_CADASTRAL} =  xpath://*[@id="tab4"]/em[contains(., 'Movimentação Cadastral')]

**Keywords***
Selecionou no campo "Funções Permitidas" a opção "Mudança de Produto"
    Wait Until Page Contains  Usuários Canal do Contratante » prime1  timeout=${TIMEOUT}
    Mouse Up    ${EDIT_BUTTON}
    Set Focus To Element  ${EDIT_BUTTON}
    Click Element    ${EDIT_BUTTON}
    Page Should Contain  Funções Permitidas:
    ${c}  Run Keyword And Ignore Error   Checkbox Should Be Selected  id:_funcoes_permitidas4
    Run Keyword If  "${c[0]}" == "PASS"   Set Focus To Element  ${SAVE_FOOTER_BUTTON}
    Run Keyword If  "${c[0]}" == "PASS"   Click Element  ${SAVE_FOOTER_BUTTON}
    Run Keyword If  "${c[0]}" == "FAIL"   Click Element  id:_funcoes_permitidas4
    Run Keyword If  "${c[0]}" == "FAIL"   Click Element  ${SAVE_FOOTER_BUTTON}

Selecionar o Contrato PF, no campo "Tipo de Movimentação" a opção MUDANÇA DE PRODUTO e clicar no botão "SALVAR"
    [Arguments]   ${arg1}
    Wait Until Page Contains  Nova Solicitação de Movimentação Cadastral  timeout=${TIMEOUT}
    Set Focus To Element  ${PESQUISAR_CONTRATO}
    Click Element  ${PESQUISAR_CONTRATO}
    Sleep  5s
    Input Text  id:conta_cnpj  ${arg1}
    Set Focus To Element  ${BUTTON_PESQUISAR}
    Click Element  ${BUTTON_PESQUISAR}
    Sleep   3s
    Click Element  ${CONTRATO_BENEFICIARIO}
    Select From List By Value  id:tipo_movimentacao  3
    Set Focus To Element  ${SALVAR_CONTRATO}
    Click Element  ${SALVAR_CONTRATO}

O Canal do Contratante deve apresentar a mensagem de erro "A mudança de produto via movimentação cadastral é permitido apenas para Contratos Pessoa Jurídica."
    Wait Until Page Contains  A mudança de produto via movimentação cadastral é permitido apenas para Contratos Pessoa Jurídica.  timeout=${TIMEOUT}

Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Mudança de Produto"
    Wait Until Page Contains  Beneficiários - Mudança de Produto  timeout=${TIMEOUT}
    Element Text Should Be  ${SITUACAO_STATUS}  Em Andamento
    Element Text Should Be  ${TEXT_TABELA_EXCLUSAO}  Nenhum registro encontrado

Validou a apresentação da tela "Mudança de Produto", com os campos "Alteração", "Beneficiário", "Motivo", "Produto Atual" vazio e bloqueado, "Novo Produto", "Observação"
    Wait Until Page Contains  Mudança de Produto  timeout=${TIMEOUT}
    Page Should Contain Element  ${ALTERACAO}
    Page Should Contain Element  ${BENEFICIARIO_MUD}
    Page Should Contain Element  ${MOTIVO_MUDANCA}
    Page Should Contain Element  ${PRODUTO_ATUAL}
    Page Should Contain Element  ${NOVO_PRODUTO_MUD}
    Page Should Contain Element  ${OBSERVACAO}

Selecionou 1 (UM) Beneficiário TITULAR, com dependentes
    [Arguments]  @{arg1}
    Set Focus To Element  ${PESQUISAR_TITULAR}
    Click Element  ${PESQUISAR_TITULAR}
    Sleep  10s
    Input Text  ${CAMPO_PESQUISA}  ${arg1[38]}
    Sleep  10s
    Set Focus To Element  ${SELECIONAR_BENEF_TITULAR}
    Click Element  ${SELECIONAR_BENEF_TITULAR}

Validou a atualização da tela com campo "Produto Atual" preenchido, "Novo Produto" com os Produtos do Contrato, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM, "Beneficiário Dependente", "Grau de Dependência", "Produto Atual" preenchido/bloqueado
    [Arguments]  @{arg1}
    Wait Until Page Contains  Mudança de Produto  timeout=${TIMEOUT}
    Page Should Contain  ${arg1[6]}
    Page Should Contain Element   ${NOVO_PRODUTO_MUD}

    ${t}  Run Keyword And Ignore Error   Page Should Contain  ${arg1[47]}
    Run Keyword If  "${t[0]}" == "FAIL"   Page Should Contain  ${arg1[55]}
    
    ${d}  Run Keyword And Ignore Error   Page Should Contain  ${arg1[49]}
    Run Keyword If  "${d[0]}" == "FAIL"   Page Should Contain  ${arg1[57]}

Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    Click Element  id:mesmo_produto_titular_nao

Validou a apresentação dos campos de seleção nos dependentes e campo "Novo Produto"
    Checkbox Should Be Selected  ${CHECKBOX_DEPENDENTES}
    Page Should Contain Element   ${NOVO_PRODUTO_DEP}

Preencheu os campos "Alteração" igual a EM 24 HORAS, "Observação", "Novo Produto" para o Titular, "Novo Produto" para um dependente, desmarcou o campo de seleção dos outros dependentes
    [Arguments]  @{arg1}
    Select From List By Label   ${ALTERACAO}   Em 24 horas

    ${c}  Run Keyword And Ignore Error   Select From List By Label   ${NOVO_PRODUTO_MUD}  ${arg1[27]}
    Run Keyword If  "${c[0]}" == "FAIL"   Select From List By Label   ${NOVO_PRODUTO_MUD}  ${arg1[6]}
    
    Input Text  ${OBSERVACAO}  Prime Control - Automação

    ${c}  Run Keyword And Ignore Error   Select From List By Label   ${NOVO_PRODUTO_DEP}  ${arg1[27]}
    Run Keyword If  "${c[0]}" == "FAIL"   Select From List By Label   ${NOVO_PRODUTO_DEP}  ${arg1[6]}

Clicou o botão SALVAR
    Click Element  ${BUTTON_MUD_PROD_SALVAR}

Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o TITULAR e UM DEPENDNETE no painel "Beneficiários - Mudança de Produto"
    Wait Until Page Contains  Beneficiários - Mudança de Produto  timeout=${TIMEOUT}
    Page Should Contain  Em Andamento
    Element Text Should Be  ${TEXT_TABELA_EXCLUSAO}  Mostrando 1 a 2 de 2 registros

Validou a apresentação do registro, com a coluna "Prioridades" vazia
    Page Should Contain Element  id:DataTables_Table_0_wrapper
    ${text}  Get Text  ${PRIORIDADES_MUD_PROD}
    Element Text Should Be  ${PRIORIDADES_MUD_PROD}   ${text}

    
No Contrato os Beneficiários cadastrados na movimentação, com os produtos alterados    
    Set Focus To Element  ${MENU_MOVIMENTACAO_CADASTRAL}
    Click Element    ${MENU_MOVIMENTACAO_CADASTRAL}
    
    ${nome_beneficiario1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  3  4
    ${alteracao1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  3  6
    ${produto_antigo1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  3  8
    ${produto_novo_alterado1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  3  9

    Should Not Be Equal  ${produto_antigo1}  ${produto_novo_alterado1}
    Log  O Beneficiario ${nome_beneficiario1} possuia o ${produto_antigo1} e foi trocado para ${produto_novo_alterado1} com alteração para ${alteracao1}.

    ${nome_beneficiario2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  4  4
    ${alteracao2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  4  6
    ${produto_antigo2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  4  8
    ${produto_novo_alterado2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  4  9

    Should Not Be Equal  ${produto_antigo2}  ${produto_novo_alterado2}
    Log  O Beneficiario ${nome_beneficiario2} possuia o ${produto_antigo2} e foi trocado para ${produto_novo_alterado2} com alteração para ${alteracao2}.
    





