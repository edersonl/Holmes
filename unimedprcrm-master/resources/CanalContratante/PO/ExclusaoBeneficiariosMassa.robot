*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary


*** Variables ***
${TIMEOUT} =  30
${MENU_MOVIMENTACAO} =  xpath://div[1]/div/section[2]/div[1]/div[2]/div[1]/div[2]/div/div[1][contains(.,'Movimentação Cadastral')]
${MOVIMENTAR_EM_MASSA} =  xpath://div[1]/div/section[2]/div[1]/div[2]/div[1]/div[2]/div/div[2]/a[2][contains(.,'Movimentar em Massa')]
${MENU_ACOES} =  xpath://button[1][contains(.,'AÇÕES')]
${SOLICITAR_MOVIMENTACAO} =  xpath:/html/body/div[1]/div/section[2]/div[1]/div[1]/div/div[2]/div/ul/li/a[contains(.,'Solicitar Movimentação em Massa')]
${NOME_REGISTRO} =  id:nome
${TIPO_MOVIMENTACAO} =  id:tipo_movimentacao
${OPTION_VALUE_EXCLUSAO} =  xpath://*[@id="tipo_movimentacao"]/option[2][contains(.,'Exclusão de Beneficiário')]
${BTN_SALVAR_MOVIMENTACAO} =  xpath://*[@id="form_criar_movimentacao"]/div/div[3]/input
${BTN_DEFINIR_BENEFICIARIO} =  xpath:/html/body/div[1]/div/section[2]/div[2]/div[1]/div/a[contains(.,'Definir Beneficiários')]
${BTN_+_ADD_BENEFICIARIOS} =  xpath:/html/body/div[1]/div/section[2]/div[2]/button[1][contains(.,'+ Adicionar Beneficiários')]
${OPTION_VALUE_LISTA_CPF} =  xpath://div[1]/div/section[2]/div[2]/ul/li[2]/a[contains(.,'Lista de CPF')]
${INPUT_CPF_1} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[1]/td[2]
${INPUT_CPF_2} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[2]/td[2]
${INPUT_CPF_3} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[3]/td[2]
${INPUT_CPF_4} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[4]/td[2]
${BTN_INSERIR} =  xpath://*[@id="modalInserirBeneficiarios"]/div/div/div[3]/button[1][contains(.,'Inserir')]
${OPTION_VALUE_MOTIVO} =  id:motivo
${OPTION_SUBMOTIVO} =  id:submotivo
${CONTATO_EMAIL} =  xpath://div[1]/div/section[2]/form[2]/div/table/tbody/tr[3]/td[6]/span[1]/input
${CONTATO_TELEFONE} =  xpath://div[1]/div/section[2]/form[2]/div/table/tbody/tr[3]/td[6]/span[2]/input
${BTN_SALVAR_EXC} =  xpath://div[1]/div/section[2]/div[5]/input[contains(@value,'Salvar')]
${BENEFICIARIOS_SELECT} =  xpath://*[@id="table_list_exclusao_benef"]/tbody/tr[1]
${MOVIMENTACAO_INFO} =  id:table_list_movimentacoes_info
${GERAR_MOV_CADASTRAIS} =  xpath://div[1]/div/section[2]/div[1]/div[2]/div/div[2]/div/ul/li[3]/a[contains(.,'Gerar Movimentações Cadastrais')]
${BTN_SIN_EXC} =  id:modal_confirm_btn
${MOV_EM_ANDAMENTO} =  xpath://td[3]/span[contains(.,'Em Andamento')]
${CHECK_MOTIVO} =  id:check_motivo
${CHECK_SUBMOTIVO} =  id:check_submotivo
${CHECK_BENEFICIARIO} =  xpath://div/table/tbody/tr[2]/td[1]/input[contains(@type,'checkbox')]
${BTN_APLICAR} =  id:btn_aplicar_dados_padrao
${INPUT_EMAIL_1} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[1]/td[3]
${INPUT_TEL_1} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[1]/td[4]
${INPUT_EMAIL_2} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[2]/td[3]
${INPUT_TEL_2} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[2]/td[4]
${INPUT_EMAIL_3} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[3]/td[3]
${INPUT_TEL_3} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[3]/td[4]
${INPUT_EMAIL_4} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[4]/td[3]
${INPUT_TEL_4} =  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table/tbody/tr[4]/td[4]


*** Keywords ***
Clicou no menu Movimentação Cadastral > Movimentar em Massa
    Wait Until Page Contains  Bem-vindo, Prime Automação  timeout=${TIMEOUT}
    Wait Until Element Is Enabled  ${MENU_MOVIMENTACAO}
    Mouse Over  ${MENU_MOVIMENTACAO}
    Sleep  10s
    Set Focus To Element   ${MOVIMENTAR_EM_MASSA}
    Click Element  ${MOVIMENTAR_EM_MASSA}

Clicou no menu Ações > Solicitar Movimentação em Massa
    Wait Until Page Contains  Movimentação Cadastral em Massa  timeout=${TIMEOUT}
    Set Focus To Element  ${MENU_ACOES}
    Click Element  ${MENU_ACOES}
    Set Focus To Element  ${SOLICITAR_MOVIMENTACAO}
    Click Element  ${SOLICITAR_MOVIMENTACAO}

Gerou registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS
    [Arguments]    ${arg1}
    Wait Until Page Contains  Nova Solicitação de Movimentação Cadastral em Massa  timeout=${TIMEOUT}
    ${nome_mov}  Catenate  MOV  ${arg1}
    Input Text  ${NOME_REGISTRO}  ${nome_mov}
    Set Focus To Element  ${TIPO_MOVIMENTACAO}
    Click Element  ${TIPO_MOVIMENTACAO}
    Set Focus To Element  ${OPTION_VALUE_EXCLUSAO}
    Click Element  ${OPTION_VALUE_EXCLUSAO}
    Click Element  ${BTN_SALVAR_MOVIMENTACAO}

Clicou o botão "DEFINIR BENEFICIÁRIOS"
    Set Focus To Element  ${BTN_DEFINIR_BENEFICIARIO}
    Click Element  ${BTN_DEFINIR_BENEFICIARIO}

Clicou o botão "+ ADICIONAR BENEFICIÁRIOS"
    Set Focus To Element   ${BTN_+_ADD_BENEFICIARIOS}
    Click Element  ${BTN_+_ADD_BENEFICIARIOS}

Clicou a opção "LISTA DE CPF"
    Set Focus To Element  ${OPTION_VALUE_LISTA_CPF}
    Click Element  ${OPTION_VALUE_LISTA_CPF}

Preencheu um CPF de um DEPENDENTE existente e um CPF de um TITULAR, com dependentes existente no Contrato PJ Empresarial, preencheu as colunas "E-mail", "Telefone" e clicou no botão "INSERIR"
    [Arguments]    @{arg1}
    Wait Until Page Contains  Inserir Beneficiários  timeout=${TIMEOUT}
    Sleep  5s
    Set Focus To Element  ${INPUT_CPF_1}
    Press Keys  ${INPUT_CPF_1}  CTRL+v  ${arg1[38]}

    Set Focus To Element  ${INPUT_EMAIL_1}
    Press Keys  ${INPUT_EMAIL_1}  CTRL+v  ${arg1[43]}

    Set Focus To Element  ${INPUT_TEL_1}
    Press Keys  ${INPUT_TEL_1}  CTRL+v  ${arg1[25]}

    Set Focus To Element  ${INPUT_CPF_2}
    Press Keys  ${INPUT_CPF_2}  CTRL+v  ${arg1[46]}

    Set Focus To Element  ${INPUT_EMAIL_2}
    Press Keys  ${INPUT_EMAIL_2}  CTRL+v  ${arg1[51]}

    Set Focus To Element  ${INPUT_TEL_2}
    Press Keys  ${INPUT_TEL_2}  CTRL+v  ${arg1[25]}

    Set Focus To Element  ${INPUT_CPF_3}
    Press Keys  ${INPUT_CPF_3}  CTRL+v  ${arg1[54]}

    Set Focus To Element  ${INPUT_EMAIL_3}
    Press Keys  ${INPUT_EMAIL_3}  CTRL+v  ${arg1[59]}

    Set Focus To Element  ${INPUT_TEL_3}
    Press Keys  ${INPUT_TEL_3}  CTRL+v  ${arg1[25]}

    Set Focus To Element  ${INPUT_CPF_4}
    Press Keys  ${INPUT_CPF_4}  CTRL+v  ${arg1[62]}

    Set Focus To Element  ${INPUT_EMAIL_4}
    Press Keys  ${INPUT_EMAIL_4}  CTRL+v  ${arg1[67]}

    Set Focus To Element  ${INPUT_TEL_4}
    Press Keys  ${INPUT_TEL_4}  CTRL+v  ${arg1[25]}

    Set Focus To Element  ${BTN_INSERIR}
    Click Element  ${BTN_INSERIR}
    
Validou apresentação dos Beneficiários selecionados e seus dependentes
    [Arguments]    ${arg1}  ${arg2}  ${arg3}
    Sleep  30s
    Wait Until Page Contains    Movimentação em Massa  timeout=${TIMEOUT}
    Page Should Contain   ${arg1}
    Page Should Contain   ${arg2}
    Page Should Contain   ${arg3}

Preencheu os campos "Motivo", "Submotivo", telefone e email de "Contato" e clicou no botão "SALVAR"
    [Arguments]    ${arg1}
    Wait Until Page Contains    Movimentação em Massa  timeout=${TIMEOUT}
    Page Should Contain    ${arg1}
    Page Should Contain    Dados padrão para Exclusão
    Set Focus To Element   ${CHECK_MOTIVO}
    Click Element          ${CHECK_MOTIVO}
    Select From List By Label  ${OPTION_VALUE_MOTIVO}  41 - Rompimento do contrato por iniciativa do beneficiário
    Set Focus To Element   ${CHECK_SUBMOTIVO}
    Click Element          ${CHECK_SUBMOTIVO}
    Select From List By Label  ${OPTION_SUBMOTIVO}  submotivo 41
    Set Focus To Element   ${CHECK_BENEFICIARIO}
    Click Element          ${CHECK_BENEFICIARIO}
    Click Element    ${BTN_APLICAR}

    Set Focus To Element  ${BTN_SALVAR_EXC}
    Click Element  ${BTN_SALVAR_EXC}

Apresentou a tela Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais
    [Arguments]    ${arg1}
    ${title_mov}  Catenate  Movimentação em Massa - MOV  ${arg1}
    Wait Until Page Contains  ${title_mov}  timeout=${TIMEOUT}
    Page Should Contain  Pendente
    Page Should Contain Element  ${BENEFICIARIOS_SELECT}
    ${MOVIMENTACAO_INFO}  Get Text  ${MOVIMENTACAO_INFO}
    Should Be Equal  ${MOVIMENTACAO_INFO}  Nenhum registro encontrado

Clicar o menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    Set Focus To Element  ${MENU_ACOES}
    Click Element  ${MENU_ACOES}
    Set Focus To Element  ${GERAR_MOV_CADASTRAIS}
    Click Element  ${GERAR_MOV_CADASTRAIS}

Clicar o botão "SIM" na modal de Confirmação "Confirma geração das movimentações cadastrais?"
    Wait Until Page Contains  Confirma geração das movimentações cadastrais?  timeout=${TIMEOUT}
    Set Focus To Element  ${BTN_SIN_EXC}
    Click Element  ${BTN_SIN_EXC}

A Mensagem: "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    Wait Until Page Contains  Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.  timeout=${TIMEOUT}

Com botão "ENCAMINHAR MOVIMENTAÇÕES PARA A APROVAÇÃO"
    Set Focus To Element  ${MENU_ACOES}
    Click Element  ${MENU_ACOES}
    Page Should Contain  Encaminhar Movimentações para Aprovação

A "situação" igual a CONCLUIDA
    Page Should Contain  Concluída

O Painel de "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO
    Mouse Down  ${MOV_EM_ANDAMENTO}
    ${MOV_EM_ANDAMENTO}  Get Text  ${MOV_EM_ANDAMENTO}
    Should Be Equal  ${MOV_EM_ANDAMENTO}  Em Andamento


Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    Wait Until Page Contains  Usuários Canal do Contratante » prime1  timeout=${TIMEOUT}
    Mouse Up    ${EDIT_BUTTON}
    Set Focus To Element  ${EDIT_BUTTON}
    Click Element    ${EDIT_BUTTON}
    Page Should Contain  Funções Permitidas:

    ${c}  Run Keyword And Ignore Error   Checkbox Should Be Selected  id:_funcoes_permitidas2
    Run Keyword If  "${c[0]}" == "PASS"   Set Focus To Element  ${SAVE_FOOTER_BUTTON}
    Run Keyword If  "${c[0]}" == "PASS"   Click Element  ${SAVE_FOOTER_BUTTON}
    Run Keyword If  "${c[0]}" == "FAIL"   Click Element  ${CHECKBOX_TRANSFERENCIA}
    Run Keyword If  "${c[0]}" == "FAIL"   Click Element  ${SAVE_FOOTER_BUTTON}

Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Exclusão"
    [Arguments]  ${arg1}
    Wait Until Page Contains  Movimentação em Massa - MOV ${arg1}  timeout=${TIMEOUT}
    Page Should Contain  Pendente
    ${SEM_BENEFICIARIO}  Get Text  id:table_list_exclusao_benef_info
    Should Be Equal   ${SEM_BENEFICIARIO}  Nenhum registro encontrado

Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", com as opções "SELECIONAR" e "LISTA DE CPF"
    Wait Until Page Contains  Movimentação em Massa  timeout=${TIMEOUT}
    Element Should Be Visible  xpath://button[contains(.,'+ Adicionar Beneficiários')]
    Page Should Contain  Selecionar
    Page Should Contain  Lista de CPF

Clicou no menu "SELECIONAR"
    Click Element  xpath://button[contains(.,'+ Adicionar Beneficiários')]
    Set Focus To Element  xpath://a[contains(.,'Selecionar')]
    Click Element  xpath://a[contains(.,'Selecionar')]

Validou a apresentação da mensagem "Não foram localizados Beneficiários para os parâmetros informados na pesquisa."
    Sleep  10s
    Page Should Contain  Não foram localizados Beneficiários para os parâmetros informados na pesquisa.

Clicou no botão "CANCELAR"
    Set Focus To Element  xpath://button[contains(.,'Cancelar')]
    Click Element  xpath://button[contains(.,'Cancelar')]

Clicou no menu "LISTA DE CPF"
    Wait Until Page Contains  Movimentação em Massa  timeout=${TIMEOUT}
    Click Element  xpath://button[contains(.,'+ Adicionar Beneficiários')]
    Set Focus To Element  xpath://a[contains(.,'Lista de CPF')]
    Click Element  xpath://a[contains(.,'Lista de CPF')]

Validou a apresentação da modal "Inserir Beneficiários", com uma tabela com as colunas CPF, "E-mail", "Telefone", os botões "INSERIR", "LIMPAR" e "CANCELAR"
    Wait Until Page Contains  Inserir Beneficiários  timeout=${TIMEOUT}
    Sleep  15s
    Element Should Be Visible  xpath://*[@id="tabela_importar_beneficiarios"]/div[2]/table
    Page Should Contain  CPF
    Page Should Contain  E-mail
    Page Should Contain  Telefone
    Element Should Be Visible  xpath://button[contains(.,'Inserir')]
    Element Should Be Visible  xpath://button[contains(.,'Limpar')]
    Element Should Be Visible  xpath://button[3][contains(.,'Cancelar')]

Preencher o CPF de um DEPENDENTE existente no Contrato PF e clicar no botão "INSERIR"
    [Arguments]    ${arg1}
    Sleep  5s
    Set Focus To Element  ${INPUT_CPF_1}
    Press Keys  ${INPUT_CPF_1}  CTRL+v  ${arg1}
    Click Element  xpath://button[contains(.,'Inserir')]

O Canal do Contratante deve apresentar a mensagem de erro "Beneficiário não encontrado!
    Wait Until Page Contains  Beneficiário não encontrado!  timeout=${TIMEOUT}

Clicou em um beneficiário DEPENDENTE e um TITULAR, com dependentes retornado na pesquisa e clicou no botão "SELECIONAR"
    Sleep  10s
    Set Focus To Element  xpath://*[@id="table_list_beneficiarios"]/tbody/tr[1]
    Click Element  xpath://*[@id="table_list_beneficiarios"]/tbody/tr[1]
    Click Element   xpath://button[contains(.,'Selecionar')]

Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Exclusão", "Motivo", "Submotivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Adesão) onde o beneficiário que será excluido está vinculado, com as colunas "Beneficiário", "Motivo" com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Submotivo", "Contato", com os campos "E-mail" e "Telefone"
    Wait Until Page Contains  Movimentação em Massa  timeout=${TIMEOUT}
    #Tabela Dados Padrão
    Element Should Be Visible  xpath://button[contains(.,'+ Adicionar Beneficiários')]
    Sleep  20s
    Element Should Be Visible  id:form_dados_padrao
    Element Should Be Visible  id:motivo
    Element Should Be Visible  id:submotivo
    Element Should Be Visible  id:btn_aplicar_dados_padrao
    Element Should Be Visible  id:btn_limpar_dados_padrao

    #Tabbela Contrato
    Element Should Be Visible  id:tabelas_contratos

    #Motivo
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[3]/select[1]
    #opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[3]/select[1]/option[2]
    #42 - DESLIGAMENTO DA EMPRESA
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[3]/select[1]/option[3]
    #44 - ÓBITO
    Run Keyword And Ignore Error  Element Should Be Visible  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[3]/select[1]/option[4]

    #Submotivo
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[4]/select[1]

    #Contato
    #Email
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[6]/span[1]/input

    #Telefone
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[6]/span[2]/input


Validou a atualização da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Exclusão", "Motivo", "Submotivo", botões "APLICAR", "LIMPAR", uma tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Adesão) e uma tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Empresarial) onde os beneficiários que serão excluidos estão vinculados, com as colunas "Beneficiário", "Motivo" com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRES, 44 - ÓBITO, "Submotivo", "Contato", com os campos "E-mail" e "Telefone"
    Wait Until Page Contains  Movimentação em Massa  timeout=${TIMEOUT}
    Sleep  20s
    #Tabela Dados Padrão
    Element Should Be Visible  xpath://button[contains(.,'+ Adicionar Beneficiários')]
    Element Should Be Visible  id:form_dados_padrao
    Element Should Be Visible  id:motivo
    Element Should Be Visible  id:submotivo
    Element Should Be Visible  id:btn_aplicar_dados_padrao
    Element Should Be Visible  id:btn_limpar_dados_padrao
    #Tabbela Contrato
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]/table[2]

    #Motivo
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[3]/select
    #opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[3]/select[1]/option[2]
    #42 - DESLIGAMENTO DA EMPRESA
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[3]/select[1]/option[3]
    #44 - ÓBITO
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[3]/select[1]/option[4]

    #Submotivo
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[4]/select

    #Contato
    #Email
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[6]/span/input[1]

    #Telefone
    Element Should Be Visible  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[6]/span[2]/input[1]

Preencheu um Beneficiário o "Motivo" igual a 41 - ROMPIMENTO DO CONTRATO e preencheu demais campos
    [Arguments]  @{arg1}
    Select From List By Label  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[3]/select[1]  41 - Rompimento do contrato por iniciativa do beneficiário
    Select From List By Label  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[4]/select[1]  submotivo 41
    Input Text  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[6]/span[1]/input  ${arg1[43]}
    Input Text  xpath://*[@id="tabelas_contratos"]//tbody/tr[3]/td[6]/span[2]/input  ${arg1[25]}

Preencheu um Beneficiário o "Motivo" igual a 42 - DESLIGAMENTO DA EMPRES, preencheu o questionário de inativo com as respostas NÃO, "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO e preencheu demais campos
    Select From List By Label  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[3]/select[1]  42 - Desligamento da empresa
    Select From List By Label  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[4]/select  submotivo 42 (acordo)
    Set Focus To Element  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[2]/span[2]
    Click Element  xpath://*[@id="tabelas_contratos"]/table[2]/tbody/tr[3]/td[2]/span[2]
    Sleep  10s
    Wait Until Page Contains  O titular contribuiu no pagamento da mensalidade de seu plano?  timeout=${TIMEOUT}
    Select From List By Label  id:titular_contribuiu  Não
    Page Should Contain  Não possui direito da continuidade do plano
    Click Element  xpath://button[contains(.,'Salvar')]

Selecionar Beneficiários Titular e Dependente
    Clicou no menu "SELECIONAR"
    Select From List By Label  id:beneficiario_tipo  Titular
    Click Element  xpath://input[contains(@value,'PESQUISAR')]
    Sleep  30s
    Set Focus To Element  xpath://*[@id="table_list_beneficiarios"]/tbody/tr[2]
    Click Element  xpath://*[@id="table_list_beneficiarios"]/tbody/tr[2]
    Click Element  xpath://button[contains(.,'Selecionar')]
    Sleep  30s
    Clicou no menu "SELECIONAR"
    Select From List By Label  id:beneficiario_tipo  Dependente
    Click Element  xpath://input[contains(@value,'PESQUISAR')]
    Sleep  30s
    Set Focus To Element  xpath://*[@id="table_list_beneficiarios"]/tbody/tr[1]
    Click Element  xpath://*[@id="table_list_beneficiarios"]/tbody/tr[1]
    Click Element  xpath://button[contains(.,'Selecionar')]

Preencheu um Beneficiário o "Motivo" igual a 42 - DESLIGAMENTO DA EMPRES, preencheu o questionário de inativo com as respostas SIM, NÃO, "DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA", "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, NÃO e preencheu demais campos
    [Arguments]  @{arg1}
    Sleep  10s
    Selecionar Beneficiários Titular e Dependente
    Select From List By Label  xpath://*[@id="tabelas_contratos"]/table[3]/tbody/tr[3]/td[3]/select  42 - Desligamento da empresa
    Select From List By Label  xpath://*[@id="tabelas_contratos"]/table[3]/tbody/tr[3]/td[4]/select  submotivo 42 (demissão)
    Sleep  10s
    Input Text  xpath://*[@id="tabelas_contratos"]/table[3]/tbody/tr[3]/td[6]/span[1]/input  ${arg1[43]}
    Input Text  xpath://*[@id="tabelas_contratos"]/table[3]/tbody/tr[3]/td[6]/span[2]/input  ${arg1[25]}

    ${c}  Run Keyword And Ignore Error   Click Element  xpath://*[@id="tabelas_contratos"]/table[3]/tbody/tr[3]/td[2]/span[2]
    Run Keyword If  "${c[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${c[0]}" == "PASS"   Wait Until Page Contains  O titular contribuiu no pagamento da mensalidade de seu plano?  timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"   Select From List By Label  id:titular_contribuiu  Sim
    Run Keyword If  "${c[0]}" == "PASS"   Select From List By Label  id:titular_permaneceu  Não
    Run Keyword If  "${c[0]}" == "PASS"   Select From List By Label  id:motivo_extincao  Demissão/exoneração sem justa causa
    Run Keyword If  "${c[0]}" == "PASS"   Page Should Contain  Possui direito da continuidade do plano
    Run Keyword If  "${c[0]}" == "PASS"   Select From List By Label  id:vinculo_inativo  Não
    Run Keyword If  "${c[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Salvar')]

    
Preencheu um Beneficiário o "Motivo" igual a 44 - ÓBITO, "Data de Óbito", anexou arquivo e preencheu demais campos
    [Arguments]    @{arg1}
    Select From List By Label  xpath://*[@id="tabelas_contratos"]/table[4]/tbody/tr[3]/td[3]/select  44 - Óbito
    Select From List By Label  xpath://*[@id="tabelas_contratos"]/table[4]/tbody/tr[3]/td[4]/select  submotivo 44
    Sleep  5s
    Input Text  xpath://*[@id="tabelas_contratos"]/table[4]/tbody/tr[3]/td[6]/span[1]/input  ${arg1[43]}
    Input Text  xpath://*[@id="tabelas_contratos"]/table[4]/tbody/tr[3]/td[6]/span[2]/input  ${arg1[25]}
    
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y

    Input Text  xpath://*[@id="tabelas_contratos"]/table[4]/tbody/tr[3]/td[3]/div/input  ${data_formatada}
    Press Keys  None  ESC
    Choose File  xpath://*[@id="tabelas_contratos"]/table[4]/tbody/tr[3]/td[3]/div[2]/input    ${DOCUMENTS_FOLDER}${/}doc_fake.pdf

Clicou botão "SALVAR"
    Set Focus To Element  xpath://input[contains(@Value,'Salvar')]
    Click Element  xpath://input[contains(@Value,'Salvar')]

Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, com beneficiários no painel "Beneficiários - Exclusão"
    [Arguments]  ${arg1}
    Wait Until Page Contains  Movimentação em Massa - MOV ${arg1}  timeout=${TIMEOUT}
    Page Should Contain  Pendente
    Page Should Contain Element  xpath://*[@id="table_list_exclusao_benef"]/tbody/tr

O Canal do Contratante deve atualizar a tela "Movimentação em Massa" + Nome, com a mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.", "Situação" igual a CONCLUIDA, com beneficiários no painel tabela "Beneficiários - Exclusão" e no painel "Movimentações Cadastrais" DOIS registros com "Situação" igual a EM ANDAMENTO
    [Arguments]  ${arg1}
    Wait Until Page Contains  Movimentação em Massa - MOV ${arg1}  timeout=${TIMEOUT}
    ${MENSAGEM_APROVACAO}  Get Text  xpath://section[2]/div[1]
    Should Be Equal  ${MENSAGEM_APROVACAO}  Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.
    Page Should Contain  Concluída
    Page Should Contain Element  xpath://*[@id="table_list_exclusao_benef"]/tbody/tr
    ${SITUACAO_MOV}  Get Text  xpath://*[@id="table_list_movimentacoes"]/tbody/tr[1]/td[3]/span
    Should Be Equal  ${SITUACAO_MOV}  Em Andamento
    



