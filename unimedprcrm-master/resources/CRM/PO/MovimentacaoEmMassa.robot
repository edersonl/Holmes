*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../../../main.resource

*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${CRIAR_MOV_EM_MASSA} =  id:create_link
${INPUT_NOME_MOVIMENTACAO_EM_MASSA} =  id:name
${SELECT_TIPO_DE_MOVIMENTACAO} =  id:tipo_movimentacao
${BOTAO_DEFINIR_BENEFICIARIOS} =  xpath://a[contains(@id,'Definir')]
${BOTAO_ADICIONAR_BENEFICIARIOS} =  id:search_form_submit
${BOTAO_ADICIONAR_BENEFICIARIOS_MOV_EXC} =  xpath://span[@class = 'MenuAdicionarBeneficiarios']
${SUBMENU_LISTA_DE_CPF} =  xpath://*[@id="pagecontent"]//a[contains(., 'Lista')]
${INPUT_CPF_MOV_MASSA} =  id:cpf_advanced
${INPUT_CPF_MOV_MASSA} =  xpath://*[@id="popup_query_form"]//td[contains(., 'Pesquisar')]
${BOTAO_PESQUISAR_BENEFICIARIOS} =  id:search_form_submit
${INPUT_CONTRATO_DESTINO} =  id:contrato_destino_228357
${LABEL_CONTRATO_DESTINO} =  xpath://*[@id="form_dados_padrao"]/table/tbody/tr[2]/td[2]
${OPTION_PRODUTO_ASSISTENCIAL} =  xpath://select[@class = 'produto_assistencial produto_assistencial_']
${OPTION_PRODUTO_ACESSORIO} =  xpath://select[contains(@class, 'produto_acessorio produto_acessorio_')]
${OPTION_TIPO_TRANSFERENCIA} =  id:tipo_transferencia
${OPTION_MOTIVO} =  id:motivo
${CHECKBOX_CONTRATO_DESTINO} =  id:check_contrato_destino
${CHECKBOX_PRODUTO_ASSISTENCIAL} =  id:check_produto_assistencial
${CHECKBOX_PRODUTO_ACESSORIO} =  id:check_produto_acessorio
${CHECKBOX_TIPO_TRANSFERENCIA} =  id:check_tipo_transferencia
${CHECKBOX_MOTIVO} =  id:check_motivo
${BOTAO_APLICAR_MOV_EM_MASSA} =  id:btn_aplicar_dados_padrao
${BOTAO_SALVAR_MOV_EM_MASSA} =  xpath://*[@id="pagecontent"]/div[2]/input[1]
${BOTAO_SALVAR_EXC_EM_MASSA} =  xpath://*[@id="pagecontent"]/div[7]/input[1]
${CHECKBOX_FAMILIA} =  xpath://input[@class = 'check_familia']
${SITUACAO_MOV_EM_MASSA} =  id:situacao
${SETA_EDITAR_MOV_EM_MASSA} =  xpath://*[@id="detail_header_action_menu"]/li/span
${EDITAR_GERAR_MOV_CADASTRAIS} =  xpath://*[@id="detail_header_action_menu"]//a[contains(., 'Movimentações Cadastrais')]
${BOTAO_ENCAMINHAR_MOV_PARA_APROVACAO} =  xpath://*[@id="detail_header_action_menu"]/li/a[contains(., 'Encaminhar Movimentações Para Aprovação')]
${TABLE_MOVIMENTACAO_CADASTRAL} =  xpath://*[@id="subpanel_title_saude_mov_massa_saude_movimentacao_cadastral_1"]/table/tbody//span[contains(., 'Movimentação Cadastral')]
${TABLE_MOVIMENTACAO_CADASTRAL_SITUACAO} =  xpath://*[@id="list_subpanel_saude_mov_massa_saude_movimentacao_cadastral_1"]//tbody/tr/td[3]/span/span
${INPUT_ID_SISTEMA_DE_GESTAO_CONTRATO} =  id:contrato_id_sistema_gestao_advanced
${CHECKBOX_TODOS_BENEFICIARIOS} =  id:massall_top
${CPF_TITULAR_LINHA1} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[1]/td[2]
${CPF_DEPENDENTE_LINHA2} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[2]/td[2]
${CPF_DEPENDENTE_LINHA3} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[3]/td[2]
${CPF_DEPENDENTE_LINHA4} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[4]/td[2]
${BOTAO_INSERIR_BENEFICIARIOS} =  xpath://*[@id="modalInserirBeneficiarios"]//button[contains(., 'Inserir')]
${BOTAO_SELECT_BENEFICIARIOS} =  id:MassUpdate_select_button

*** Keywords ***
Verificar Tela de Movimentação em Massa
    Wait Until Page Contains  Movimentação em Massa » Pesquisar  timeout=${TIMEOUT}

Clicar botão Criar Movimentação em Massa
    Set Focus To Element  ${CRIAR_MOV_EM_MASSA}
    Click Element  ${CRIAR_MOV_EM_MASSA}

Verificar Tela de Movimentação em Massa » Criar
    Wait Until Page Contains  Movimentação em Massa » Criar  timeout=${TIMEOUT}

Preencher campo Nome Movimentação em Massa
    [Arguments]    ${arg1}
    ${nome_mov}  Catenate  MOV  ${arg1}
    Input Text  ${INPUT_NOME_MOVIMENTACAO_EM_MASSA}  ${nome_mov}

Preencher campo Tipo de Movimentação
    [Arguments]    ${arg1}
    Select From List By Label   ${SELECT_TIPO_DE_MOVIMENTACAO}  ${arg1}

Clicar em salvar Movimentação em Massa
    Execute Javascript   document.getElementById("SAVE_FOOTER").click()
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}

Clicar no botão "DEFINIR BENEFICIÁRIOS"
    Wait Until Page Contains  Movimentação em Massa »  timeout=${TIMEOUT}
    Set Focus To Element  ${BOTAO_DEFINIR_BENEFICIARIOS}
    Click Element  ${BOTAO_DEFINIR_BENEFICIARIOS}

Clicar no botão "+ ADICIONAR BENEFICIÁRIOS"
    Wait Until Page Contains  » Definir Beneficiários  timeout=${TIMEOUT}
    Set Focus To Element  ${BOTAO_ADICIONAR_BENEFICIARIOS}
    Click Element  ${BOTAO_ADICIONAR_BENEFICIARIOS}

Clicar no botão "+ ADICIONAR BENEFICIÁRIOS" MOV EXCLUSAO
    Wait Until Page Contains  » Definir Beneficiários  timeout=${TIMEOUT}
    Set Focus To Element  ${BOTAO_ADICIONAR_BENEFICIARIOS_MOV_EXC}
    Click Element  ${BOTAO_ADICIONAR_BENEFICIARIOS_MOV_EXC}

Preencheu o campo "CPF" com a informação de um Beneficiário existente no CRM e clicou no botão "PESQUISAR"
    [Arguments]  ${arg1}
    Sleep  5s
    Switch Window  NEW
    Sleep  5s
    Maximize Browser Window
    Wait Until Page Contains  Pesquisar Beneficiários  timeout=${TIMEOUT}
    Input Text  ${INPUT_CPF_MOV_MASSA}  ${arg1}
    Set Focus To Element  ${BOTAO_PESQUISAR_BENEFICIARIOS}
    Click Element  ${BOTAO_PESQUISAR_BENEFICIARIOS}
    Sleep  5s

Clicar no Beneficiário
    [Arguments]  ${arg1}
    Set Focus To Element  xpath://*[@id="MassUpdate"]//a[contains(., '${arg1}')]
    Click Element  xpath://*[@id="MassUpdate"]//a[contains(., '${arg1}')]
    Sleep  5s
    Switch Window  MAIN
    Wait Until Page Contains  » Definir Beneficiários  timeout=${TIMEOUT}

Preencher o campo "Contrato Destino" com um Contrato PJ existente no CRM
    [Arguments]  ${arg1}
    Press Keys  None  END

    ${id_table}  Get Element Attribute  xpath://*[@id="tabelas_contratos"]/table  id
    ${data_familia}  Get Element Attribute  xpath://*[@id="${id_table}"]/tbody/tr[3]  data-familia

    ${id_table}  Set Test Variables  ${id_table}
    ${data_familia}  Set Test Variables  ${data_familia}
    
    Set Focus To Element   xpath://*[@id="tabelas_contratos"]/table/tbody/tr[3]/td[2]/input[1]     #xpath://*[@id="contrato_destino_${data_familia}"]
    Input Text    xpath://*[@id="tabelas_contratos"]/table/tbody/tr[3]/td[2]/input[1]   ${arg1}       #xpath://*[@id="contrato_destino_${data_familia}"]  ${arg1}
    Sleep  5s
    Press Keys  None  ARROW_DOWN
    Press Keys  None  ENTER
    Sleep  5s


Preencher os campo "Transferência", "Produto Assistencial" e clicou no botão "SALVAR"
    [Arguments]  ${arg1}
    ${OPTION_TIPO_TRANSFERENCIA}  Set Variables  xpath://*[@id="tipo_transferencia_${data_familia}"]
    ${OPTION_PRODUTO_ASSISTENCIAL}  Set Variables  xpath://*[@class="produto_assistencial produto_assistencial_${data_familia}"]
    ${OPTION_PRODUTO_ACESSORIO}  Set Variables  xpath://*[@class="produto_acessorio produto_acessorio_${data_familia} produto_acessorio_${data_familia}_${id_table}"]
    
    Select From List By Label  ${OPTION_TIPO_TRANSFERENCIA}    Em 24 horas
    ${a}  Run Keyword And Ignore Error  Select From List By Label  ${OPTION_PRODUTO_ASSISTENCIAL}  ${arg1}
    Run Keyword If  "${a[0]}" == "FAIL"  Select From List By Label  ${OPTION_PRODUTO_ASSISTENCIAL}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    # Select From List By Label  ${OPTION_PRODUTO_ACESSORIO}  1020 - RESGATE AIR
    
    Sleep  3s
    Set Focus To Element  ${BOTAO_SALVAR_MOV_EM_MASSA}
    Click Element  ${BOTAO_SALVAR_MOV_EM_MASSA}

    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Processo está incompleto, falta definir contrato de destino nos beneficiários ou campos obrigatórios não foram preenchidos.    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "PASS"  Click Element  id:yui-gen0-button
    
    Sleep  3s

    ${b}  Run Keyword And Ignore Error  Select From List By Label  xpath://*[@id="tabelas_contratos"]/table/tbody/tr[5]/td[3]/select  ${arg1}
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Label  xpath://*[@id="tabelas_contratos"]/table/tbody/tr[5]/td[3]/select  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Run Keyword If  "${b[0]}" == "FAIL"  Set Focus To Element  ${BOTAO_SALVAR_MOV_EM_MASSA}
    Run Keyword If  "${b[0]}" == "FAIL"  Click Element  ${BOTAO_SALVAR_MOV_EM_MASSA}
    Run Keyword If  "${b[0]}" == "PASS"  Set Focus To Element  ${BOTAO_SALVAR_MOV_EM_MASSA}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${BOTAO_SALVAR_MOV_EM_MASSA}


    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Apresentar a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (UMA FAMILIA)
    [Arguments]  ${arg1}  ${arg2}
    Wait Until Page Contains  Movimentação em Massa »     timeout=${TIMEOUT}
    ${situacao}  Get Value  ${SITUACAO_MOV_EM_MASSA}
    Should Be Equal  ${situacao}  pendente
    Page Should Contain  ${arg1}
    Page Should Contain  ${arg2}
    Set Focus To Element  ${TABLE_MOVIMENTACAO_CADASTRAL}
    ${mov_cadastral}  Get Text  xpath://*[@id="subPanel"]/tbody/tr/td/em
    Should Be Equal  ${mov_cadastral}  Nenhum resultado encontrado.


Apresentar a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (DUAS FAMILIAS)
    [Arguments]  @{arg1}
    Wait Until Page Contains  Movimentação em Massa »     timeout=${TIMEOUT}
    ${situacao}  Get Value  ${SITUACAO_MOV_EM_MASSA}
    Should Be Equal  ${situacao}  pendente
    Page Should Contain  ${arg1[39]}
    Page Should Contain  ${arg1[47]}
    Page Should Contain  ${arg1[55]}
    Page Should Contain  ${arg1[63]}
    Set Focus To Element  ${TABLE_MOVIMENTACAO_CADASTRAL}
    ${mov_cadastral}  Get Text  xpath://*[@id="subPanel"]/tbody/tr/td/em
    Should Be Equal  ${mov_cadastral}  Nenhum resultado encontrado.


Clicou no menu "GERAR MOVIMENTAÇÕES CADASTRAIS" e clicar no botão "SIM"
    Press Keys  None  HOME
    Set Focus To Element  ${SETA_EDITAR_MOV_EM_MASSA}
    Click Element  ${SETA_EDITAR_MOV_EM_MASSA}
    Set Focus To Element  ${EDITAR_GERAR_MOV_CADASTRAIS}
    Click Element  ${EDITAR_GERAR_MOV_CADASTRAIS}

    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    
    Wait Until Page Contains    Confirma geração das movimentações cadastrais?    timeout=${TIMEOUT}
    Execute Javascript   document.getElementById("yui-gen0-button").click()
    
    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


CRM deve atualizar tela de Movimentações Cadastrais com:
    Wait Until Page Contains    Movimentação em Massa » MOV      timeout=${TIMEOUT}

Mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    Wait Until Page Contains    Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.      timeout=${TIMEOUT}

Com botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    Set Focus To Element  ${BOTAO_ENCAMINHAR_MOV_PARA_APROVACAO}

A "situação" igual CONCLUIDO
    ${situacao}  Get Value  ${SITUACAO_MOV_EM_MASSA}
    Should Be Equal  ${situacao}  concluida

Sem botão "DEFINIR BENEFICIÁRIOS"
    Page Should Not Contain Element  ${BOTAO_DEFINIR_BENEFICIARIOS}

O Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO
    Press Keys  None  END
    Set Focus To Element  ${TABLE_MOVIMENTACAO_CADASTRAL}
    ${situacao_mov}  Get Text  ${TABLE_MOVIMENTACAO_CADASTRAL_SITUACAO}
    Should Be Equal  ${situacao_mov}  Em Andamento

Preencher o campo "ID no Sistema de Gestão (Contrato)" com a informação de um Contrato existente no CRM e clicou no botão "PESQUISAR"
    [Arguments]    @{arg1}
    Sleep  5s
    Switch Window  NEW
    Sleep  5s
    Maximize Browser Window
    Wait Until Page Contains  Pesquisar Beneficiários  timeout=${TIMEOUT}
    Input Text  ${INPUT_ID_SISTEMA_DE_GESTAO_CONTRATO}  ${CONTRATO_ID_SISTEMA_DE_GESTAO}
    Set Focus To Element  ${BOTAO_PESQUISAR_BENEFICIARIOS}
    Click Element  ${BOTAO_PESQUISAR_BENEFICIARIOS}
    Sleep  5s

Selecionar dois Beneficiários e clicou no botão "SELECIONAR"
    Select Checkbox  ${CHECKBOX_TODOS_BENEFICIARIOS}
    Set Focus To Element  ${BOTAO_SELECT_BENEFICIARIOS}
    Click Element  ${BOTAO_SELECT_BENEFICIARIOS}


Preencheu para primeiro Beneficiário o campo "Contrato Destino" com um Contrato PJ existente no CRM
    [Arguments]  @{arg1}
    Switch Window  MAIN
    Press Keys  None  END

    ${id_table}  Get Element Attribute  xpath://*[@id="tabelas_contratos"]/table  id
    ${data_familia}  Get Element Attribute  xpath://*[@id="${id_table}"]/tbody/tr[3]  data-familia

    Set Test Variables  ${id_table}
    Set Test Variables  ${data_familia}

    Set Focus To Element  xpath://*[@id="contrato_destino_${data_familia}"]
    Input Text  xpath://*[@id="contrato_destino_${data_familia}"]  ${arg1[1]}
    Sleep  5s
    Press Keys  None  ARROW_DOWN
    Press Keys  None  ENTER
    Sleep  5s

    ${OPTION_TIPO_TRANSFERENCIA}  Set Variables  xpath://*[@id="tipo_transferencia_${data_familia}"]
    ${OPTION_PRODUTO_ASSISTENCIAL}  Set Variables  xpath://*[@class="produto_assistencial produto_assistencial_${data_familia}"]
    
    Select From List By Label  ${OPTION_TIPO_TRANSFERENCIA}    Em 24 horas
    IF    $arg1[6] == ''
        Select From List By Label  ${OPTION_PRODUTO_ASSISTENCIAL}  ${arg1[7]}

    ELSE
        Select From List By Label  ${OPTION_PRODUTO_ASSISTENCIAL}  ${arg1[6]}
        
    END
    Select From List By Label  xpath://*[@id="tabelas_contratos"]/table/tbody/tr[5]/td[3]/select  ${arg1[6]}


Preencheu para segundo Beneficiário o campo "Contrato Destino" com um Contrato PJ existente no CRM (diferente do primeiro Contrato)
    [Arguments]    @{arg1}
    Press Keys  None  END

    ${id_table}  Get Element Attribute  xpath://*[@id="tabelas_contratos"]/table  id
    ${data_familia}  Get Element Attribute  xpath://*[@id="${id_table}"]/tbody/tr[6]  data-familia

    Set Test Variables  ${id_table}
    Set Test Variables  ${data_familia}

    Set Focus To Element  xpath://*[@id="contrato_destino_${data_familia}"]
    Input Text  xpath://*[@id="contrato_destino_${data_familia}"]  ${arg1[31]}
    Sleep  5s
    Press Keys  None  ARROW_DOWN
    Press Keys  None  ENTER
    Sleep  5s

    ${OPTION_TIPO_TRANSFERENCIA}  Set Variables  xpath://*[@id="tipo_transferencia_${data_familia}"]
    ${OPTION_PRODUTO_ASSISTENCIAL}  Set Variables  xpath://*[@class="produto_assistencial produto_assistencial_${data_familia}"]
    
    
    Select From List By Label  ${OPTION_TIPO_TRANSFERENCIA}    Em 24 horas
    IF    $arg1[6] == ''
        Select From List By Label  ${OPTION_PRODUTO_ASSISTENCIAL}  ${arg1[7]}

    ELSE
        Select From List By Label  ${OPTION_PRODUTO_ASSISTENCIAL}  ${arg1[6]}
        
    END
    Select From List By Label  xpath://*[@id="tabelas_contratos"]/table/tbody/tr[8]/td[3]/select  ${arg1[6]}
    
    Sleep  3s
    Set Focus To Element  ${BOTAO_SALVAR_MOV_EM_MASSA}
    Click Element  ${BOTAO_SALVAR_MOV_EM_MASSA}
    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Clicar na opção "LISTA DE CPF"
    Wait Until Element Is Visible  ${SUBMENU_LISTA_DE_CPF}  timeout=${TIMEOUT}
    Set Focus To Element  ${SUBMENU_LISTA_DE_CPF}
    Click Element  ${SUBMENU_LISTA_DE_CPF}


Preencher DOIS CPFs um Titular com Dependente, um Dependente do Contrato e clicou no botão "INSERIR"
    [Arguments]    ${arg1}  ${arg2}  ${arg3}
    Wait Until Page Contains  Inserir Beneficiários  timeout=${TIMEOUT}
    Sleep  5s
    Set Focus To Element  ${CPF_TITULAR_LINHA1}
    Press Keys  ${CPF_TITULAR_LINHA1}  CTRL+v  ${arg1}

    Set Focus To Element  ${CPF_DEPENDENTE_LINHA2}
    Press Keys  ${CPF_DEPENDENTE_LINHA2}  CTRL+v  ${arg2}

    Set Focus To Element  ${CPF_DEPENDENTE_LINHA3}
    Press Keys  ${CPF_DEPENDENTE_LINHA3}  CTRL+v  ${arg3}

    Set Focus To Element  ${BOTAO_INSERIR_BENEFICIARIOS}
    Click Element  ${BOTAO_INSERIR_BENEFICIARIOS}
    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Validar a apresentação dos Beneficiários selecionados e seus dependentes
    [Arguments]    ${arg1}  ${arg2}  ${arg3}
    Wait Until Page Contains    Movimentação em Massa » MOV    timeout=${TIMEOUT}
    Page Should Contain   ${arg1}
    Page Should Contain   ${arg2}
    Page Should Contain   ${arg3}


Preencher os campos "Motivo", "Data de Exclusão", telefone e email de "Contato" e clicou no botão "SALVAR"
    [Arguments]    ${arg1}  ${arg2}  ${arg3}
    Press Keys  None  END
    ${id_table}  Get Element Attribute  xpath://*[@id="tabelas_contratos"]/table  id
    ${data_beneficiario}  Get Element Attribute  xpath://*[@id="${id_table}"]/tbody/tr[3]  data-beneficiario
    ${data_beneficiario2}  Get Element Attribute  xpath://*[@id="${id_table}"]/tbody/tr[6]  data-beneficiario
    ${data_familia}  Get Element Attribute  xpath://*[@id="${id_table}"]/tbody/tr[3]  data-familia

    ${OPTION_MOTIVO}  Set Variables  xpath://*[@id="motivo_${data_beneficiario}"]
    ${INPUT_DATA_EXCLUSAO}  Set Variables  xpath://*[@id="data_exclusao_${data_beneficiario}"]
    ${INPUT_CONTATO_EMAIL}  Set Variables  xpath://*[@id="contato_email_${data_beneficiario}"]
    ${INPUT_CONTATO_TELEFONE}  Set Variables  xpath://*[@id="contato_telefone_${data_beneficiario}"]

    ${OPTION_MOTIVO2}  Set Variables  xpath://*[@id="motivo_${data_beneficiario2}"]
    ${INPUT_DATA_EXCLUSAO2}  Set Variables  xpath://*[@id="data_exclusao_${data_beneficiario2}"]
    ${INPUT_CONTATO_EMAIL2}  Set Variables  xpath://*[@id="contato_email_${data_beneficiario2}"]
    ${INPUT_CONTATO_TELEFONE2}  Set Variables  xpath://*[@id="contato_telefone_${data_beneficiario2}"]

    ${id_table}  Set Test Variables  ${id_table}
    ${data_familia}  Set Test Variables  ${data_familia}
    ${data_beneficiario}  Set Test Variables  ${data_beneficiario}
    ${data_beneficiario2}  Set Test Variables  ${data_beneficiario2}

    Select From List By Label  ${OPTION_MOTIVO}  46 - Inclusão indevida de beneficiários
    ${arg1}  Convert To String  ${arg1}
    Input Text  ${INPUT_DATA_EXCLUSAO}  ${arg1}
    Input Text  ${INPUT_CONTATO_EMAIL}  ${arg2}
    Input Text  ${INPUT_CONTATO_TELEFONE}  ${arg3}

    Select From List By Label  ${OPTION_MOTIVO2}  46 - Inclusão indevida de beneficiários
    Input Text  ${INPUT_DATA_EXCLUSAO2}  ${arg1}
    Input Text  ${INPUT_CONTATO_EMAIL2}  ${arg2}
    Input Text  ${INPUT_CONTATO_TELEFONE2}  ${arg3}

    Set Focus To Element  ${BOTAO_SALVAR_EXC_EM_MASSA}
    Click Element  ${BOTAO_SALVAR_EXC_EM_MASSA}
    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Preencher os campos "Motivo", "Data de Exclusão", telefone e email de "Contato" e clicou no botão "SALVAR" (DOIS CONTRATOS)
    [Arguments]    ${arg1}  ${arg2}  ${arg3}
    Press Keys  None  END
    ${id_table}  Get Element Attribute  xpath://*[@id="tabelas_contratos"]/table[1]  id
    ${data_beneficiario}  Get Element Attribute  xpath://*[@id="${id_table}"]/tbody/tr[3]  data-beneficiario
    ${data_familia}  Get Element Attribute  xpath://*[@id="${id_table}"]/tbody/tr[3]  data-familia

    ${data_beneficiario2}  Get Element Attribute  xpath://*[@id="${id_table}"]/tbody/tr[6]  data-beneficiario
    ${data_familia2}  Get Element Attribute  xpath://*[@id="${id_table}"]/tbody/tr[6]  data-familia

    ${id_table2}  Get Element Attribute  xpath://*[@id="tabelas_contratos"]/table[2]  id
    ${data_beneficiario3}  Get Element Attribute  xpath://*[@id="${id_table2}"]/tbody/tr[3]  data-beneficiario
    ${data_familia3}  Get Element Attribute  xpath://*[@id="${id_table2}"]/tbody/tr[3]  data-familia

    ${data_beneficiario4}  Get Element Attribute  xpath://*[@id="${id_table2}"]/tbody/tr[6]  data-beneficiario
    ${data_familia4}  Get Element Attribute  xpath://*[@id="${id_table2}"]/tbody/tr[6]  data-familia

    ${OPTION_MOTIVO}  Set Variables  xpath://*[@id="motivo_${data_beneficiario}"]
    ${INPUT_DATA_EXCLUSAO}  Set Variables  xpath://*[@id="data_exclusao_${data_beneficiario}"]
    ${INPUT_CONTATO_EMAIL}  Set Variables  xpath://*[@id="contato_email_${data_beneficiario}"]
    ${INPUT_CONTATO_TELEFONE}  Set Variables  xpath://*[@id="contato_telefone_${data_beneficiario}"]

    ${OPTION_MOTIVO2}  Set Variables  xpath://*[@id="motivo_${data_beneficiario2}"]
    ${INPUT_DATA_EXCLUSAO2}  Set Variables  xpath://*[@id="data_exclusao_${data_beneficiario2}"]
    ${INPUT_CONTATO_EMAIL2}  Set Variables  xpath://*[@id="contato_email_${data_beneficiario2}"]
    ${INPUT_CONTATO_TELEFONE2}  Set Variables  xpath://*[@id="contato_telefone_${data_beneficiario2}"]

    ${OPTION_MOTIVO3}  Set Variables  xpath://*[@id="motivo_${data_beneficiario3}"]
    ${INPUT_DATA_EXCLUSAO3}  Set Variables  xpath://*[@id="data_exclusao_${data_beneficiario3}"]
    ${INPUT_CONTATO_EMAIL3}  Set Variables  xpath://*[@id="contato_email_${data_beneficiario3}"]
    ${INPUT_CONTATO_TELEFONE3}  Set Variables  xpath://*[@id="contato_telefone_${data_beneficiario3}"]

    ${OPTION_MOTIVO4}  Set Variables  xpath://*[@id="motivo_${data_beneficiario4}"]
    ${INPUT_DATA_EXCLUSAO4}  Set Variables  xpath://*[@id="data_exclusao_${data_beneficiario4}"]
    ${INPUT_CONTATO_EMAIL4}  Set Variables  xpath://*[@id="contato_email_${data_beneficiario4}"]
    ${INPUT_CONTATO_TELEFONE4}  Set Variables  xpath://*[@id="contato_telefone_${data_beneficiario4}"]

    Select From List By Label  ${OPTION_MOTIVO}  46 - Inclusão indevida de beneficiários
    ${arg1}  Convert To String  ${arg1}
    Input Text  ${INPUT_DATA_EXCLUSAO}  ${arg1}
    Input Text  ${INPUT_CONTATO_EMAIL}  ${arg2}
    Input Text  ${INPUT_CONTATO_TELEFONE}  ${arg3}

    Select From List By Label  ${OPTION_MOTIVO2}  46 - Inclusão indevida de beneficiários
    Input Text  ${INPUT_DATA_EXCLUSAO2}  ${arg1}
    Input Text  ${INPUT_CONTATO_EMAIL2}  ${arg2}
    Input Text  ${INPUT_CONTATO_TELEFONE2}  ${arg3}

    Select From List By Label  ${OPTION_MOTIVO3}  46 - Inclusão indevida de beneficiários
    Input Text  ${INPUT_DATA_EXCLUSAO3}  ${arg1}
    Input Text  ${INPUT_CONTATO_EMAIL3}  ${arg2}
    Input Text  ${INPUT_CONTATO_TELEFONE3}  ${arg3}

    Select From List By Label  ${OPTION_MOTIVO4}  46 - Inclusão indevida de beneficiários
    Input Text  ${INPUT_DATA_EXCLUSAO4}  ${arg1}
    Input Text  ${INPUT_CONTATO_EMAIL4}  ${arg2}
    Input Text  ${INPUT_CONTATO_TELEFONE4}  ${arg3}

    Set Focus To Element  ${BOTAO_SALVAR_EXC_EM_MASSA}
    Click Element  ${BOTAO_SALVAR_EXC_EM_MASSA}
    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Apresentar a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (MOV EXCLUSAO)
    [Arguments]  ${arg1}  ${arg2}  ${arg3}
    Wait Until Page Contains  Movimentação em Massa »     timeout=${TIMEOUT}
    ${situacao}  Get Value  ${SITUACAO_MOV_EM_MASSA}
    Should Be Equal  ${situacao}  pendente
    Page Should Contain  ${arg1}
    Page Should Contain  ${arg2}
    Page Should Contain  ${arg3}
    Set Focus To Element  ${TABLE_MOVIMENTACAO_CADASTRAL}
    ${mov_cadastral}  Get Text  xpath://*[@id="subPanel"]/tbody/tr/td/em
    Should Be Equal  ${mov_cadastral}  Nenhum resultado encontrado.


Apresentar a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (DOIS CONTRATOS)
    [Arguments]  ${arg1}  ${arg2}  ${arg3}  ${arg4}  ${arg5}  ${arg6}
    Wait Until Page Contains  Movimentação em Massa »     timeout=${TIMEOUT}
    ${situacao}  Get Value  ${SITUACAO_MOV_EM_MASSA}
    Should Be Equal  ${situacao}  pendente
    Page Should Contain  ${arg1}
    Page Should Contain  ${arg2}
    Page Should Contain  ${arg3}
    Page Should Contain  ${arg4}
    Page Should Contain  ${arg5}
    Page Should Contain  ${arg6}
    Set Focus To Element  ${TABLE_MOVIMENTACAO_CADASTRAL}
    ${mov_cadastral}  Get Text  xpath://*[@id="subPanel"]/tbody/tr/td/em
    Should Be Equal  ${mov_cadastral}  Nenhum resultado encontrado.


Clicou no menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    Press Keys  None  HOME
    Set Focus To Element  ${SETA_EDITAR_MOV_EM_MASSA}
    Click Element  ${SETA_EDITAR_MOV_EM_MASSA}
    Set Focus To Element  ${EDITAR_GERAR_MOV_CADASTRAIS}
    Click Element  ${EDITAR_GERAR_MOV_CADASTRAIS}

    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    

Clicou no botão "SIM" na modal de Confirmação "Confirma geração das movimentações cadastrais?"
    Wait Until Page Contains    Confirma geração das movimentações cadastrais?    timeout=${TIMEOUT}
    Execute Javascript   document.getElementById("yui-gen4-button").click()
    
    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Preencher um Titular com Dependente, um Dependente do Contrato 1  
    [Arguments]  ${arg1}  ${arg2}
    Wait Until Page Contains  Inserir Beneficiários  timeout=${TIMEOUT}
    Sleep  5s
    Set Focus To Element  ${CPF_TITULAR_LINHA1}
    Press Keys  ${CPF_TITULAR_LINHA1}  CTRL+v  ${arg1}

    Set Focus To Element  ${CPF_DEPENDENTE_LINHA2}
    Press Keys  ${CPF_DEPENDENTE_LINHA2}  CTRL+v  ${arg2}


Preencher um Titular com Dependente, um Dependente do Contrato 2 e clicou no botão "INSERIR"  
    [Arguments]  ${arg1}  ${arg2}
    Wait Until Page Contains  Inserir Beneficiários  timeout=${TIMEOUT}
    Sleep  5s

    Set Focus To Element  ${CPF_DEPENDENTE_LINHA3}
    Press Keys  ${CPF_DEPENDENTE_LINHA3}  CTRL+v  ${arg1}

    Set Focus To Element  ${CPF_DEPENDENTE_LINHA4}
    Press Keys  ${CPF_DEPENDENTE_LINHA4}  CTRL+v  ${arg2}

    Set Focus To Element  ${BOTAO_INSERIR_BENEFICIARIOS}
    Click Element  ${BOTAO_INSERIR_BENEFICIARIOS}
    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
