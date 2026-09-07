*** Settings ***
Library     SeleniumLibrary
Library     String
Library     Collections
Library     ../../../libs/writecsv.py
Library     ../../../libs/CSVLibrary.py
Library     DebugLibrary
Resource    ../../../main.resource

*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${SHORT_TIMEOUT} =  10
${BOTAO_SALVAR_CONTRATO} =  id:SAVE_HEADER
${CRIAR_BENEFICIARIOS} =  id:saude_BENEFICIARIOS_criar_button 
${SUBMENU_IMPORTAR_BENEFICIARIOS} =  xpath://ul[@id="detail_header_action_menu"]//li/ul/li[contains(.,"Importar")]/a
${BOTAO_CONFIRMAR_IMPORTACAO} =  xpath://*[@id="detail_header_action_menu"]/li/a[contains(text(), 'Confirmar Importação')]
${BOTAO_ESCOLHER_ARQUIVO} =  xpath://*[@id="uploadfile_file"]
${SUBMENU_ENCAMINHAR_APROVACAO} =  id:encaminhar_aprovacao
${BTN_SALVAR_APROVACAO_CONTRATO} =  id:btn-salvar
${INFORMACOES_ADICIONAIS} =  id:motivo
${TIPO_END} =  id:end_tipo
${INPUT_END_CEP} =  id:end_cep
${LABEL_END_CEP} =  id:end_cep_label
${INPUT_END_NUMERO} =  id:end_numero
${PESQUISA_NUMERO_CONTRATO} =  id:cod_contrato_c_basic
${SUBMENU_GERAR_MOV_CADASTRAL} =  xpath://*[@id="detail_header_action_menu"]//a[contains(text(), 'Mov. Cadastral')]
${TIPO_MOVIMENTACAO_CADASTRAL} =  id:tipo_movimentacao
${TIPO_MOV_INC_BENEF} =  xpath://*[@id="tipo_movimentacao"]/option[contains(., 'Inclusão de Beneficiário')
${TIPO_MOV_EXC_BENEF} =  xpath://*[@id="tipo_movimentacao"]/option[contains(., 'Exclusão de Beneficiário')]
${TIPO_MOV_EXC_BENEF_RN412} =  xpath://*[@id="tipo_movimentacao"]/option[contains(., 'Exclusão de Beneficiário RN412')]
${TIPO_MOV_MUDANCA_PROD} =  xpath://*[@id="tipo_movimentacao"]/option[contains(., 'Mudança de Produto')]
${TIPO_MOV_TRANSFERENCIA_GRUPO_FAMILIAR} =  xpath://*[@id="tipo_movimentacao"]/option[contains(., 'Transferência de Grupo Familiar')]
${BOTAO_CRIAR_MOV_CADASTRAL} =  xpath://*[@id="GerarMovCadastral"]/div[3]/button[contains(., 'Criar')]
${BOTAO_CRIAR_BENEF_EXCLUSAO} =  id:saude_MOVIMENTACAO_BENEF_criar_button
${BOTAO_CRIAR_MUDANCA_PROD} =  id:saude_MOVIMENTACAO_TROCA_criar_button
${BOTAO_CRIAR_TRANSF} =  id:saude_MOVIMENTACAO_TRANSF_criar_button
${MOTIVO_BENEF_EXCLUSAO} =  id:motivo
${BENEF_DATA_EXCLUSAO} =  id:data_exclusao_date
${BENEF_DATA_OBITO} =  id:data_obito
${DATA_EXCLUSAO_BENEFICIARIO} =  id:data_exclusao_c
${INPUT_BENEFICIARIO_EXCLUSAO} =  id:beneficiario
${LABEL_EXC_BENEFICIARIO} =  id:beneficiario_label
${TELEFONE_CEL_EXCLUSAO} =  id:tel_celular_c
${EMAIL_EXCLUSAO} =  id:email_c
${PAINEL_BENEFICIARIOS} =  xpath://*[@id="subpanel_title_saude_beneficiarios_aos_contracts"]/table/tbody/tr/td[1]/h3/span
${SITUACAO_BENEFICIARIO} =  id:ben_situacao_c
${NAO_CONTRIBUIU} =  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[5]/td[2]/label[contains(., 'Não')]
${SIM_CONTRIBUIU} =  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[5]/td[2]/label[contains(., 'Sim')]
${INPUT_TEMPO_CONTRIBUICAO} =  id:tempo_contribuicao
${LABEL_TEMPO_CONTRIBUICAO} =  id:tempo_contribuicao_label
${ALTERACAO_PROD_VIGENCIA} =  id:inicio_vigencia_c
${NOVO_PRODUTO} =  id:aos_products_id1_c
${DATA_ALTERACAO_MUD_PROD} =  id:data_alteracao
${LABEL_DATA_ALTERACAO_MUD_PROD} =  id:data_alteracao_label
${INPUT_CONTRATO_DESTINO} =  id:contrato_destino
${LABEL_CONTRATO_DESTINO} =  id:contrato_destino_label
${INPUT_PRODUTO_ASSISTENCIAL} =  id:produto_assistencial_c
${CHECKBOX_ACESSORIO1} =  id:_produto_acessorio_c1
${CHECKBOX_ACESSORIO2} =  id:_produto_acessorio_c2
${INPUT_PRODUTO_ASSISTENCIAL_DEPENDENTE} =  xpath://*[@id="produtos_dependentes"]/table/tbody/tr[3]/td[2]
${PRODUTO_ASSISTENCIAL_5045_DEPENDENTE} =  xpath://*[@id="produtos_dependentes"]/table/tbody/tr[3]/td[2]//option[contains(., '5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF')]
${CHECKBOX_ACESSORIO1_DEPENDENTE} =  xpath://*[@id="produtos_dependentes"]/table/tbody/tr[3]/td[4]/ul/li[1]/label
${CHECKBOX_ACESSORIO2_DEPENDENTE} =  xpath://*[@id="produtos_dependentes"]/table/tbody/tr[3]/td[4]/ul/li[2]/label
${DATA_TRANSF_GRUPO_FAMILIAR} =  id:data_transf
${LABEL_DATA_TRANSF_GRUPO_FAMILIAR} =  id:data_transf_label
${CHECK_SIM_MESMO_PRODUTO_TITULAR} =  id:mesmo_produto_titular_c
${TIPO_MOV_CANC_CONTRATO} =  xpath://*[@id="tipo_movimentacao"]/option[contains(., 'Cancelamento de Contrato')]
${DATA_EXCLUSAO_CONTRATO} =  id:data_exclusao_c
${INPUT_VENDEDOR_INC_BENEF} =  id:vendedor_usuario_nome
${LABEL_VENDEDOR_INC_BENEF} =  xpath://*[@id="modalGerarMovimentacao_body"]/div[2]/label
${IMPORTAR_ARQUIVO_MOV_CADASTRAL} =  xpath://*[@id="detail_header_action_menu"]//a[contains(., 'Importar')]
${ENCAMINHAR_MOV_APROVACAO} =  xpath://*[@id="detail_header_action_menu"]/li/a[contains(., 'Encaminhar Movimentações para Aprovação')]
${BOTAO_SALVAR_ENCAMINHAR_MOV_APROV} =  id:modal_custom_btn_salvar
${COLUNA_PARAM_APLIC_CARENCIA_DIAS} =  xpath://*[@id="detalhes_grau_dependencia"]/tbody/tr[1]/td[5]/div[contains(., 'Parâmetros para Aplicação de Carência (dias)')]
${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS} =  id:habilitar_calculo_carencia
${LABEL_BENEFICIARIOS_INCLUSAO_SEM_CARENCIA} =  id:inclusoes_sem_carencia_c_label
${SELECT_BENEFICIARIOS_INCLUSAO_SEM_CARENCIA} =  id:inclusoes_sem_carencia_c
${INPUT_DIAS_CARENCIA_TITULAR} =  id:dias_carencia_titular
${INPUT_DIAS_CARENCIA_CONJUGE} =  id:dias_carencia_conjuge
${INPUT_DIAS_CARENCIA_FILHO} =  id:dias_carencia_filho
${INPUT_DIAS_CARENCIA_FILHO_ADOTIVO} =  id:dias_carencia_filho_adotivo
${INPUT_PESQUISA_TITULO} =  id:name_basic
${BOTAO_PESQUISAR_BENEF_TABLE} =  id:saude_beneficiarios_aos_contracts_select_button
${BOTAO_SIM_VINCULO_EMPREGATICIO} =  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[6]//label[contains(., 'Sim')]
${BOTAO_SIM_MENSALIDADE} =  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[5]//label[contains(., 'Sim')]
${BENEFICIARIOS_PAINEL} =  xpath://*[@id="subpanel_title_saude_beneficiarios_aos_contracts"]/table/tbody/tr/td[1]/h3/span[contains(.,'Beneficiários')]

*** Keywords ***
Apresentar a tela Contratos » com  
    [Arguments]  ${arg1}
    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains  Contratos » ${arg1}    timeout=${TIMEOUT}

Integrarção automática igual a TRANSFERÊNCIA DE GRUPO FAMILIAR
    [Arguments]  ${arg1}
    Click Element  id:edit_button
    Wait Until Page Contains    Contratos »  timeout=${TIMEOUT}
    Page Should Contain Element  xpath://h2/a[contains(.,'${arg1}')]
    Page Should Contain  Integração automática:
    Click Element  xpath://*[@id="integracao_automatica_c"]/option[3]
    Press Keys  None  ALT+A
    Sleep  15s

Usuário clicou no botão "Criar" do painel Beneficiários
    Set Focus To Element  ${CRIAR_BENEFICIARIOS}
    Click Element  ${CRIAR_BENEFICIARIOS}

CRM deve apresentar tela Beneficiário » Criar
    Wait Until Page Contains    Beneficiários » Criar    timeout=${TIMEOUT}

CRM deve apresentar tela Contrato » TITULO, com Beneficiário incluido
    [Arguments]  ${arg1}
    Sleep  10s
    Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Log  ${arg1}

CRM deve apresentar tela Contrato » TITULO
    [Arguments]  ${arg1}
    Sleep  15s
    Wait Until Page Contains  Contratos » ${arg1}
    Log  ${arg1}

CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular
    [Arguments]  @{arg1}
    Sleep  8s
    Log  ${arg1}
    Run Keyword And Ignore Error  Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1[1]}')]
    Run Keyword And Ignore Error  Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1[31]}')]
    Run Keyword And Ignore Error  Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1[27]}')]
    Run Keyword And Ignore Error  Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1[39]}')]
    Run Keyword And Ignore Error  Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1[47]}')]
    Run Keyword And Ignore Error  Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1[55]}')]
    Run Keyword And Ignore Error  Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1[63]}')]
    

CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente
    [Arguments]  ${arg1}
    Sleep  3s
    Log  ${arg1}
    Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1}')]    

Acessando o menu IMPORTAR BENEFICIÁRIOS
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Sleep  3s
    ${p}  Run Keyword And Ignore Error  Click Element  ${SUBMENU_IMPORTAR_BENEFICIARIOS}
    Run Keyword If  "${p[0]}" == "FAIL"  Set Focus To Element  xpath://*[@id="detail_header_action_menu"]//a[contains(., 'Importar')]
    Run Keyword If  "${p[0]}" == "FAIL"  Click Element  xpath://*[@id="detail_header_action_menu"]//a[contains(., 'Importar')]
    
Selecionando, validando e confirmando o arquivo
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    #Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de 
    #Adicionando: Arg11: Data de Nascimento, Arg12: Tipo, Arg13: Grau de Dependencia
    #Adicionando: Arg14: CNS, Arg15: Sexo, Arg16: Nome da Mãe, Arg17: Estado Civil, Arg18: Naturalidade, Arg19: Raça
    #Adicionando: Arg20: Tipo do Endereço, Arg21: CEP, Arg22: Número, Arg23: Tipo Telefone, 
    #Adicionando para importação: Arg25: Endereco, Arg26: Bairro, Arg27: Cidade, Arg28: UF, Arg29: Pais, 
    #            Arg30: Produto Assitencial,  Arg31: sexo, Arg32: raça, Arg33: Grau de Dependencia, Arg34: tipoEndereco, 
    #            Arg35: estado Civil, Arg36: Telefone,  Arg37: naturalidadeCidade, Arg38:  naturalidadeEstado
    @{lista}    Create List    
    ...    ${arg1[1]}    ${arg1[2]}    ${arg1[12]}    ${EMPTY}    ${arg1[33]}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${arg1[11]}    
    ...    ${arg1[31]}    ${arg1[32]}    ${arg1[35]}    ${arg1[16]}    ${EMPTY}    ${arg1[14]}    ${EMPTY}
    ...    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${arg1[37]}    ${arg1[38]}    ${EMPTY}    ${EMPTY}
    ...    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${arg1[30]}    ${arg1[34]}    ${EMPTY}    ${EMPTY}    ${arg1[21]}    ${arg1[25]}
    ...    ${arg1[22]}    ${EMPTY}    ${arg1[26]}    ${arg1[27]}    ${arg1[28]}    ${arg1[29]}    ${EMPTY}    ${EMPTY}    ${arg1[36]}    ${EMPTY}    ${EMPTY}    ${arg1[8]}
    Write CSV File    ${DOCUMENTS_FOLDER}${/}beneficiario_import    ${lista}

    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import    timeout=${TIMEOUT}

Selecionando, validando e confirmando o arquivo (Beneficiário PJ)
    [Arguments]  @{arg1}
    #Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    #Adicionando: Arg7: Produto Assitencial, Arg8: Fase Cotação
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança 
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil, Arg20: Naturalidade, Arg21: Raça
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    #Adicionando para importação: Arg35: Endereco, Arg36: Bairro, Arg37: Cidade, Arg38: UF, Arg39: Pais, 
    #            Arg40: Produto Assitencial,  Arg41: sexo, Arg42: raça, Arg43: Grau de Dependencia, Arg44: tipoEndereco,
    #            Arg45: estado Civil, Arg46: Telefone,  Arg47: naturalidadeCidade, Arg48:  naturalidadeEstado
    
    @{lista}    Create List    
    ...    ${arg1[1]}    ${arg1[13]}    ${arg1[15]}    ${EMPTY}    ${arg1[34]}    ${EMPTY}    ${EMPTY}    ${arg1[29]}    ${arg1[14]}    
    ...    ${arg1[42]}    ${arg1[43]}    ${arg1[46]}    ${arg1[19]}    ${EMPTY}    ${arg1[17]}    ${EMPTY}
    ...    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${arg1[48]}    ${arg1[49]}    ${EMPTY}    ${EMPTY}
    ...    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${arg1[40]}    ${arg1[22]}    ${EMPTY}    ${EMPTY}    ${arg1[23]}    ${arg1[35]}
    ...    ${arg1[25]}    ${EMPTY}    ${arg1[37]}    ${arg1[38]}    ${arg1[39]}    ${arg1[40]}    ${EMPTY}    ${EMPTY}    ${arg1[47]}    ${EMPTY}    ${EMPTY}    ${arg1[10]}
    Write CSV File    ${DOCUMENTS_FOLDER}${/}beneficiario_import    ${lista}

    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import    timeout=${TIMEOUT}


Selecionando, validando e confirmando o arquivo (Beneficiário CAEPF)
    [Arguments]  @{arg1}
    #Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    #Adicionando: Arg7: Produto Assitencial, Arg8: Fase Cotação
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança 
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil, Arg20: Naturalidade, Arg21: Raça
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    #Adicionando para importação: Arg35: Endereco, Arg36: Bairro, Arg37: Cidade, Arg38: UF, Arg39: Pais, 
    #            Arg40: Produto Assitencial,  Arg41: sexo, Arg42: raça, Arg43: Grau de Dependencia, Arg44: tipoEndereco,
    #            Arg45: estado Civil, Arg46: Telefone,  Arg47: naturalidadeCidade, Arg48:  naturalidadeEstado
    
    @{lista}    Create List    
    ...    ${arg1[1]}    ${arg1[13]}    ${arg1[14]}    ${EMPTY}    ${arg1[34]}    ${EMPTY}    ${EMPTY}    ${arg1[29]}    ${arg1[14]}    
    ...    ${arg1[42]}    ${arg1[43]}    ${arg1[46]}    ${arg1[19]}    ${EMPTY}    ${arg1[17]}    ${EMPTY}
    ...    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${arg1[48]}    ${arg1[49]}    ${EMPTY}    ${EMPTY}
    ...    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${arg1[41]}    ${arg1[23]}    ${EMPTY}    ${EMPTY}    ${arg1[24]}    ${arg1[36]}
    ...    ${arg1[25]}    ${EMPTY}    ${arg1[37]}    ${arg1[38]}    ${arg1[39]}    ${arg1[40]}    ${EMPTY}    ${EMPTY}    ${arg1[47]}    ${EMPTY}    ${EMPTY}    ${arg1[10]}
    Write CSV File    ${DOCUMENTS_FOLDER}${/}beneficiario_import    ${lista}

    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import    timeout=${TIMEOUT}


Clicando no link "Nome Contrato"
    [Arguments]  ${arg1}
    Sleep  3s
    ${c}  Run Keyword And Ignore Error  Set Focus To Element    xpath://*[@id="relacionamentos_span"]/table/tbody/tr/td[2]/a/span[contains(text(), '${arg1}')]
    Run Keyword If  "${c[0]}" == "PASS"  Click Element    xpath://*[@id="relacionamentos_span"]/table/tbody/tr/td[2]/a/span[contains(text(), '${arg1}')]
    Run Keyword If  "${c[0]}" == "FAIL"  Set Focus To Element    xpath://*[@id="relacionamentos_span"]/table/tbody/tr/td[2]/a/span
    Run Keyword If  "${c[0]}" == "FAIL"  Click Element    xpath://*[@id="relacionamentos_span"]/table/tbody/tr/td[2]/a/span


CRM deve apresentando a tela Contrato » TITULO, com Beneficiários importados
    [Arguments]  ${arg1}
    Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1}')]
    Wait Until Element Is Visible   xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${arg1}')]


Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Sleep  3s

    ${b}  Run Keyword And Ignore Error  Click Element  ${SUBMENU_ENCAMINHAR_APROVACAO}
    Run Keyword If  "${b[0]}" == "FAIL"    Click Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Run Keyword If  "${b[0]}" == "FAIL"    Sleep  15s
    Run Keyword If  "${b[0]}" == "FAIL"    Click Element  ${SETA_EDITAR}
    Run Keyword If  "${b[0]}" == "FAIL"    Click Element  ${SUBMENU_ENCAMINHAR_APROVACAO}

    ${c}  Run Keyword And Ignore Error  Click Element  xpath://*[@id="btn_encaminhar_aprovacao"]
    
    ${a}  Run Keyword And Ignore Error     Wait Until Page Contains    A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde    timeout=${TIMEOUT}
    Run Keyword If  "${a[0]}" == "PASS"    Click Element  ${BOTAO_SIM_FINALIZAR_PROTOCOLO}


Clicando no menu "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s
    Set Focus To Element  ${ENCAMINHAR_MOV_APROVACAO}
    Click Element  ${ENCAMINHAR_MOV_APROVACAO}
    Sleep  3s
    Wait Until Page Contains    Encaminhar Movimentações para Aprovação    timeout=${TIMEOUT}
    Checkbox Should Be Selected    xpath://*[@id="form_encaminhar"]/h4/label/input
    Execute Javascript  document.getElementById('motivo_encaminhar').value="Teste Automação - Prime Control"
    Sleep  5s
    ${b}  Run Keyword And Ignore Error  Click Element  ${BOTAO_SALVAR_ENCAMINHAR_MOV_APROV}
    Run Keyword If  "${b[0]}" == "FAIL"  Click Element  ${BOTAO_SALVAR_ENCAMINHAR_MOV_APROV}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Validar mensagem "Contratante não possui endereço cadastrado"
    [Arguments]  @{arg1}
    ${e}  Run Keyword And Ignore Error     Wait Until Page Contains    O Contrante não possui um endereço cadastrado, clique    timeout=${TIMEOUT}

    Run Keyword If  "${e[0]}" == "PASS"    Click Element  xpath://*[@id="pagecontent"]/div[2]/a
    Run Keyword If  "${e[0]}" == "PASS"    Preencher dados endereço    @{arg1}
    # Automação não acha o botão salvar, foi feito assim para que funcione nessa tela
    Run Keyword If  "${e[0]}" == "PASS"  Execute Javascript   document.getElementById("SAVE_HEADER").click()
    # Alerta para atualizar dados
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Foi identificada a mudança da Pessoa vinculada a Conta. Confirma essa alteração?    timeout=${TIMEOUT}
    Run Keyword If  "${f[0]}" == "PASS"    Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${f[0]}" == "PASS"    Click Element     ${BOTAO_SIM_CONFIRMACAO}
    # Aguardar voltar para outra tela
    Run Keyword If  "${e[0]}" == "PASS"   Wait Until Page Contains   Contratos »    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "PASS"    Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"


Validar mensagem "Contratante não possui CNPJ/CPF/CAEPF não foram preenchidos"
    [Arguments]  @{arg1}
    ${r}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Razão Social, CNPJ/CPF/CAEPF não foram preenchidos no contratante deste contrato.    timeout=${TIMEOUT}
    
    Run Keyword If  "${r[0]}" == "PASS"    Click Element  xpath://*[@id="pagecontent"]/div[2]/a
    Run Keyword If  "${r[0]}" == "PASS"    Preencher dados Contratante    @{arg1}
    # Automação não acha o botão salvar, foi feito assim para que funcione nessa tela
    Run Keyword If  "${r[0]}" == "PASS"  Execute Javascript   document.getElementById("SAVE_HEADER").click()
    # Alerta para atualizar dados
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Foi identificada a mudança da Pessoa vinculada a Conta. Confirma essa alteração?    timeout=${TIMEOUT}
    Run Keyword If  "${f[0]}" == "PASS"    Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${f[0]}" == "PASS"    Click Element     ${BOTAO_SIM_CONFIRMACAO}
    # Aguardar voltar para outra tela
    Run Keyword If  "${r[0]}" == "PASS"    Wait Until Page Contains   Contratos »    timeout=${TIMEOUT}
    Run Keyword If  "${r[0]}" == "PASS"    Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"


Validar mensagem "Razão Social, CPF Responsável (CAEPF) não foram preenchidos"
    [Arguments]  @{arg1}
    ${r}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Razão Social, CPF Responsável (CAEPF) não foram preenchidos no contratante deste contrato.    timeout=${TIMEOUT}
    
    Run Keyword If  "${r[0]}" == "PASS"    Click Element  xpath://*[@id="pagecontent"]/div[2]/a
    Run Keyword If  "${r[0]}" == "PASS"    Preencher dados Contratante    @{arg1}
    # Automação não acha o botão salvar, foi feito assim para que funcione nessa tela
    Run Keyword If  "${r[0]}" == "PASS"    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    # Alerta para atualizar dados
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Foi identificada a mudança da Pessoa vinculada a Conta. Confirma essa alteração?    timeout=${TIMEOUT}
    Run Keyword If  "${f[0]}" == "PASS"    Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${f[0]}" == "PASS"    Click Element     ${BOTAO_SIM_CONFIRMACAO}
    # Aguardar voltar para outra tela
    Run Keyword If  "${r[0]}" == "PASS"    Wait Until Page Contains   Contratos »    timeout=${TIMEOUT}
    Run Keyword If  "${r[0]}" == "PASS"    Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"


Validar mensagem "Razão Social, CNPJ/CPF/CAEPF, CPF Responsável (CAEPF) não foram preenchidos"
    [Arguments]  @{arg1}
    ${r}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Razão Social, CNPJ/CPF/CAEPF, CPF Responsável (CAEPF) não foram preenchidos no contratante deste contrato.    timeout=${TIMEOUT}
    
    Run Keyword If  "${r[0]}" == "PASS"    Click Element  xpath://*[@id="pagecontent"]/div[2]/a
    Run Keyword If  "${r[0]}" == "PASS"    Preencher dados Contratante    @{arg1}
    # Automação não acha o botão salvar, foi feito assim para que funcione nessa tela
    Run Keyword If  "${r[0]}" == "PASS"    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    # Alerta para atualizar dados
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Foi identificada a mudança da Pessoa vinculada a Conta. Confirma essa alteração?    timeout=${TIMEOUT}
    Run Keyword If  "${f[0]}" == "PASS"    Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${f[0]}" == "PASS"    Click Element     ${BOTAO_SIM_CONFIRMACAO}
    # Aguardar voltar para outra tela
    Run Keyword If  "${r[0]}" == "PASS"    Wait Until Page Contains   Contratos »    timeout=${TIMEOUT}
    Run Keyword If  "${r[0]}" == "PASS"    Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"


Validar mensagem "Data de Nascimento, Sexo, Nome da Mãe, Estado Civil, Naturalidade não foram preenchidosnão foram preenchidos no contratante"
    [Arguments]  @{arg1}
    ${r}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Data de Nascimento, Sexo, Nome da Mãe, Estado Civil, Naturalidade não foram preenchidos    timeout=15
    
    Run Keyword If  "${r[0]}" == "PASS"    Click Element  xpath://*[@id="pagecontent"]/div[2]/a
    Run Keyword If  "${r[0]}" == "PASS"    Preencher dados Contratante    @{arg1}
    # Automação não acha o botão salvar, foi feito assim para que funcione nessa tela
    Run Keyword If  "${r[0]}" == "PASS"    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    # Alerta para atualizar dados
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Foi identificada a mudança da Pessoa vinculada a Conta. Confirma essa alteração?    timeout=15
    Run Keyword If  "${f[0]}" == "PASS"    Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${f[0]}" == "PASS"    Click Element     ${BOTAO_SIM_CONFIRMACAO}
    # Aguardar voltar para outra tela
    Run Keyword If  "${r[0]}" == "PASS"    Wait Until Page Contains   Contratos »    timeout=${TIMEOUT}
    Run Keyword If  "${r[0]}" == "PASS"    Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"


Validar mensagem Razão Social, CPF Responsável (CAEPF) não foram preenchidosnão foram preenchidos no contratante" - Importação
    [Arguments]  @{arg1}
    ${r}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Razão Social, CPF Responsável (CAEPF) não foram preenchidos no contratante deste contrato    timeout=${TIMEOUT}
    
    Run Keyword If  "${r[0]}" == "PASS"    Click Element  xpath://*[@id="pagecontent"]/div[2]/a
    Run Keyword If  "${r[0]}" == "PASS"    Dados contratante - Pessoa Jurídica (CAEPF) - Importação    @{arg1}
    # Automação não acha o botão salvar, foi feito assim para que funcione nessa tela
    Run Keyword If  "${r[0]}" == "PASS"    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    # Alerta para atualizar dados
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Foi identificada a mudança da Pessoa vinculada a Conta. Confirma essa alteração?    timeout=${TIMEOUT}
    Run Keyword If  "${f[0]}" == "PASS"    Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${f[0]}" == "PASS"    Click Element     ${BOTAO_SIM_CONFIRMACAO}
    # Aguardar voltar para outra tela
    Run Keyword If  "${r[0]}" == "PASS"    Wait Until Page Contains   Contratos »    timeout=${TIMEOUT}
    Run Keyword If  "${r[0]}" == "PASS"    Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"


Validar mensagem Razão Social não foram preenchidos no contratante deste contrato
    [Arguments]  @{arg1}
    ${r}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Razão Social não foram preenchidos no contratante deste contrato.    timeout=${TIMEOUT}
    
    Run Keyword If  "${r[0]}" == "PASS"    Click Element  xpath://*[@id="pagecontent"]/div[2]/a
    Run Keyword If  "${r[0]}" == "PASS"    Preencher Razao Social    @{arg1}
    # Automação não acha o botão salvar, foi feito assim para que funcione nessa tela
    Run Keyword If  "${r[0]}" == "PASS"    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    # Alerta para atualizar dados
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Foi identificada a mudança da Pessoa vinculada a Conta. Confirma essa alteração?    timeout=${TIMEOUT}
    Run Keyword If  "${f[0]}" == "PASS"    Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${f[0]}" == "PASS"    Click Element     ${BOTAO_SIM_CONFIRMACAO}
    # Aguardar voltar para outra tela
    Run Keyword If  "${r[0]}" == "PASS"    Wait Until Page Contains   Contratos »    timeout=${TIMEOUT}
    Run Keyword If  "${r[0]}" == "PASS"    Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"


Validar mensagem O processo de Declaração de Saúde está incompleto, gentileza verifique
    [Arguments]  @{arg1}
    ${r}  Run Keyword And Ignore Error     Wait Until Page Contains    Atenção    timeout=15
    Run Keyword If  "${r[0]}" == "PASS"    Run Keyword And Ignore Error  Set Focus To Element    ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${r[0]}" == "PASS"    Run Keyword And Ignore Error  Execute Javascript   document.getElementById("yui-gen0-button").click()
    Run Keyword If  "${r[0]}" == "PASS"    Run Keyword And Ignore Error  Set Focus To Element    xpath://*[@id="LBL_DETAILVIEW_PANEL1"]/tbody/tr[6]/td[2]/a
    Run Keyword If  "${r[0]}" == "PASS"    Run Keyword And Ignore Error  Click Link   xpath://*[@id="LBL_DETAILVIEW_PANEL1"]/tbody/tr[6]/td[2]/a
 
    ${z}  Run Keyword And Ignore Error     Wait Until Page Contains    O processo de Declaração de Saúde está incompleto, gentileza verifique.    timeout=15
    Run Keyword If  "${z[0]}" == "PASS"    Set Focus To Element    xpath://*[@id="processo_declaracao"]/a
    Run Keyword If  "${z[0]}" == "PASS"    Click Element    xpath://*[@id="processo_declaracao"]/a

    DeclaracaoSaudeDetalhes.Validar Página Processo de Declaração de Saúde
    ${header}  Get Text  xpath://*[@id="pagecontent"]/div[1]/h2
    ${header1} =  Set Variables   Processo de Declaração de Saúde » ${arg1[1]}
    ${header2} =  Set Variables   Processo de Declaração de Saúde » ${arg1[31]}

    ${h3} =  Run Keyword And Ignore Error  Set Variables  Processo de Declaração de Saúde » ${arg1[71]}
    ${header3}  Catenate  ${h3[1][0]} » ${h3[1][1]}

    Run Keyword If  "${header}" == "${header1}"    Desmarcar Processo de Declaração de Saude  @{arg1}
    Run Keyword If  "${header}" == "${header2}"    Desmarcar Processo de Declaração de Saude (Segundo Contrato)   @{arg1}
    Run Keyword If  "${header}" == "${header3}"    Desmarcar Processo de Declaração de Saude (Terceiro Contrato)   @{arg1}
    # Aguardar voltar para outra tela
    Run Keyword If  "${r[0]}" == "PASS"    Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"
    Run Keyword If  "${z[0]}" == "PASS"    Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"


Preencher dados Contratante
    [Arguments]  @{arg1}
    Run Keyword If  "${arg1[0]}" == "Pessoa Jurídica (CNPJ)"    Dados contratante - Pessoa Jurídica (CNPJ)    @{arg1}
    Run Keyword If  "${arg1[0]}" == "Potencial Cliente (PJ)"    Dados contratante - Potencial Cliente (PJ)    @{arg1}
    Run Keyword If  "${arg1[0]}" == "Pessoa Jurídica (CAEPF)"   Dados contratante - Pessoa Jurídica (CAEPF)    @{arg1}
    Run Keyword If  "${arg1[0]}" == "Potencial Cliente (CAEPF)"   Dados contratante - Pessoa Jurídica (CAEPF)    @{arg1}
    Run Keyword If  "${arg1[0]}" == "Pessoa Física" or "${arg1[0]}" == "Potencial Cliente (PF)"  Dados contratante - Pessoa Física (PF)    @{arg1}
    #Run Keyword If  "${arg1[0]}" == "Potencial Cliente (PF)"   Dados contratante - Potencial Cliente (PF)    @{arg1}
    

Dados contratante - Pessoa Física (PF)
    [Arguments]    @{arg1}     
    Wait Until Page Contains    Contas »    timeout=${TIMEOUT}
    ContasCadastro.Preencher Data de Nascimento com     ${arg1[11]} 
    ContasCadastro.Colocar o Sexo com                ${arg1[15]}
    ContasCadastro.Preencher Nome da Mãe com         ${arg1[16]}
    ContasCadastro.Colocar o Estado Civil com        ${arg1[17]}
    ContasCadastro.Preencher Naturalidade com        ${arg1[18]}


Dados contratante - Potencial Cliente (PF)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Contas »    timeout=${TIMEOUT}
    ContasCadastro.Preencher Data de Nascimento com    ${arg1[11]}
    ContasCadastro.Colocar o Sexo com    ${arg1[15]}
    ContasCadastro.Preencher Nome da Mãe com    ${arg1[16]}
    ContasCadastro.Colocar o Estado Civil com    ${arg1[17]}
    ContasCadastro.Preencher Naturalidade com    ${arg1[18]}


Dados contratante - Pessoa Jurídica (CNPJ)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Contas »    timeout=${TIMEOUT}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com    ${arg1[2]}
    ContasCadastro.Preencher Data de Nascimento com    ${arg1[11]}
    ContasCadastro.Colocar o Sexo com    ${arg1[15]}
    ContasCadastro.Preencher Nome da Mãe com    ${arg1[16]}
    ContasCadastro.Colocar o Estado Civil com    ${arg1[17]}
    ContasCadastro.Preencher Naturalidade com    ${arg1[18]}


Dados contratante - Potencial Cliente (PJ)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Contas »    timeout=${TIMEOUT}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com    ${arg1[3]}
    ContasCadastro.Preencher Razão Social com    ${arg1[2]}


Dados contratante - Pessoa Jurídica (CAEPF)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Contas »    timeout=${TIMEOUT}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com    ${arg1[3]}
    ContasCadastro.Preencher Razão Social com    ${arg1[2]}
    ContasCadastro.Preencher CPF do Responsável com   ${arg1[12]}


Dados contratante - Pessoa Jurídica (CAEPF) - Importação
    [Arguments]  @{arg1}
    Wait Until Page Contains    Contas »    timeout=${TIMEOUT}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com    ${arg1[2]}
    ContasCadastro.Preencher Razão Social com    ${arg1[1]}
    ContasCadastro.Preencher CPF do Responsável com   ${arg1[11]}


Preencher Razao Social
    [Arguments]  @{arg1}
    Wait Until Page Contains    Contas »    timeout=${TIMEOUT}
    ContasCadastro.Preencher Razão Social com    ${arg1[1]}


Preencher dados endereço
    [Arguments]  @{arg1}
    Wait Until Page Contains    Endereço »    timeout=${TIMEOUT}
    # TIPO ENDEREÇO
    ${r}  Run Keyword And Ignore Error  Should Be Equal  ${arg1[20]}  Residencial

    Run Keyword If  "${r[0]}" == "PASS"  Select From List By Label  ${TIPO_END}  ${arg1[20]}
    Run Keyword If  "${r[0]}" == "PASS"  Capture Page Screenshot    filename=selenium-screenshot-{index}.png 
    Run Keyword If  "${r[0]}" == "PASS"  Sleep  5s

    #${e}  Run Keyword And Ignore Error  Set Focus To Element    ${TIPO_END}
    Run Keyword If  "${r[0]}" == "FAIL"  Select From List By Label  ${TIPO_END}  ${arg1[22]}
    Run Keyword If  "${r[0]}" == "FAIL"  Capture Page Screenshot    filename=selenium-screenshot-{index}.png 
    Run Keyword If  "${r[0]}" == "FAIL"  Sleep  5s

    #Execute Javascript  document.getElementById('end_numero').value="${arg1[24]}"
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    # CEP
    Set Focus To Element    ${INPUT_END_CEP}
    Sleep  3s
    Execute Javascript  document.getElementById('end_cep').value="80540-000"
    Click Element  ${LABEL_END_CEP}
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${LOADING_CEP}  timeout=${TIMEOUT}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${LOADING_CEP}  timeout=${TIMEOUT}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    # NUMERO
    Run Keyword If  "${r[0]}" == "PASS"  Set Focus To Element   ${INPUT_END_NUMERO}
    Run Keyword If  "${r[0]}" == "PASS"  Input Text  ${INPUT_END_NUMERO}    ${arg1[22]}
    Run Keyword If  "${r[0]}" == "FAIL"  Set Focus To Element   ${INPUT_END_NUMERO}
    Run Keyword If  "${r[0]}" == "FAIL"  Input Text  ${INPUT_END_NUMERO}    ${arg1[24]}


Aprovar Encaminhar para Aprovação
    Wait Until Page Contains    Encaminhar para Aprovação    timeout=${TIMEOUT}
    Set Focus To Element   ${INFORMACOES_ADICIONAIS}
    Execute Javascript  document.getElementById('motivo').value="Teste Automação - Prime"
    #Input Text  ${INFORMACOES_ADICIONAIS}  Teste Automação - Prime.
    Set Focus To Element   ${BTN_SALVAR_APROVACAO_CONTRATO}
    Sleep  3s
    Click Element  ${BTN_SALVAR_APROVACAO_CONTRATO}
    ${a}  Run Keyword And Ignore Error     Wait Until Page Contains    A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde    timeout=${TIMEOUT}
    Run Keyword If  "${a[0]}" == "PASS"    Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${a[0]}" == "PASS"    Click Element  ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword And Ignore Error     Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword And Ignore Error     Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


CRM deverá atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO
    Wait Until Page Contains    Aguardando Aprovação    timeout=${TIMEOUT}


Validar mensagem "Contratante não possui endereço cadastrado" (Integração)
    [Arguments]  @{arg1}
    ${e}  Run Keyword And Ignore Error     Wait Until Page Contains    O Contrante não possui um endereço cadastrado, clique    timeout=15
    Run Keyword If  "${e[0]}" == "PASS"    Click Element  xpath://*[@id="pagecontent"]/div[2]/a
    Run Keyword If  "${e[0]}" == "PASS"    Preencher dados endereço Comercial (Integração)   @{arg1}
    # Automação não acha o botão salvar, foi feito assim para que funcione nessa tela
    Run Keyword If  "${e[0]}" == "PASS"   Execute Javascript   document.getElementById("SAVE_HEADER").click()
    	
    ${o}  Run Keyword And Ignore Error     Wait Until Page Contains    obrigatório não preenchido: Endereço    timeout=15
    Run Keyword If  "${o[0]}" == "PASS"    Preencher dados endereço Comercial (Integração)   @{arg1}
    Run Keyword If  "${o[0]}" == "PASS"    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    
    # Alerta para atualizar dados
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Foi identificada a mudança da Pessoa vinculada a Conta. Confirma essa alteração?    timeout=15
    Run Keyword If  "${f[0]}" == "PASS"    Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${f[0]}" == "PASS"    Click Element     ${BOTAO_SIM_CONFIRMACAO}
    
    # Aguardar voltar para outra tela
    Run Keyword If  "${e[0]}" == "PASS"    Wait Until Page Contains   Contratos »    timeout=15
    Run Keyword If  "${e[0]}" == "PASS"    Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"


Preencher dados endereço Comercial (Integração)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Endereço »    timeout=${TIMEOUT}
    # TIPO ENDEREÇO
    ${e}  Run Keyword And Ignore Error  Set Focus To Element    ${TIPO_END}
    Run Keyword If  "${e[0]}" == "PASS"  Select From List By Label  ${TIPO_END}  Comercial
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png 
    Sleep  5s
    # CEP
    Set Focus To Element    ${INPUT_END_CEP}
    Sleep  3s
    Clear Element Text   ${INPUT_END_CEP}
    Execute Javascript  document.getElementById('end_cep').value="80540-000"
    Set Focus To Element    ${INPUT_END_CEP}
    Sleep  3s
    Repeat Keyword  2 times  Click Element  ${LABEL_END_CEP}
    Sleep  10s
    Repeat Keyword  2 times  Click Element  ${LABEL_END_CEP}
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${LOADING_CEP}  timeout=${TIMEOUT}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${LOADING_CEP}  timeout=${TIMEOUT}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    # NUMERO
    Clear Element Text   ${INPUT_END_NUMERO}
    Set Focus To Element   ${INPUT_END_NUMERO}
    Sleep  5s
    Execute Javascript  document.getElementById('end_numero').value="165"
    #Input Text  ${INPUT_END_NUMERO}    ${arg1[23]}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png


Importar o arquivo gerado
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOWNLOADS_FOLDER}${/}gerador.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » gerador    timeout=${TIMEOUT} 


Importar o arquivo PF gerado
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}gerador-3-vidas-PF.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » gerador    timeout=${TIMEOUT}


Pesquisar Contrato Origem cadastrado
    [Arguments]  ${arg1}
    Wait Until Page Contains  Contratos » Pesquisar
    Execute Javascript   document.getElementById("search_form_clear").click()
    Sleep  3s
    Set Focus To Element   ${INPUT_PESQUISA_TITULO}
    Input Text  ${INPUT_PESQUISA_TITULO}    ${arg1}
    Sleep  3s
    Set Focus To Element   ${BOTAO_PESQUISAR}
    Click Element    ${BOTAO_PESQUISAR}

Pesquisar Contrato Destino cadastrado
    [Arguments]  ${arg1}
    Wait Until Page Contains  Contratos » Pesquisar
    Execute Javascript   document.getElementById("search_form_clear").click()
    Sleep  3s
    Set Focus To Element   ${INPUT_PESQUISA_TITULO}
    Input Text  ${INPUT_PESQUISA_TITULO}    ${arg1}
    Sleep  3s
    Set Focus To Element   ${BOTAO_PESQUISAR}
    Click Element    ${BOTAO_PESQUISAR}

Pesquisar Contrato cadastrado
    [Arguments]  ${arg1}
    Wait Until Page Contains  Contratos » Pesquisar
    Clear Element Text  ${INPUT_PESQUISA_TITULO}
    Set Focus To Element   ${PESQUISA_NUMERO_CONTRATO}
    Input Text  ${PESQUISA_NUMERO_CONTRATO}    ${DADOS_CONTRATO[2]}  clear=True
    Set Focus To Element   ${BOTAO_PESQUISAR}
    Click Element    ${BOTAO_PESQUISAR}

Pesquisar Contrato cadastrado pelo Titulo
    [Arguments]  ${arg1}
    Wait Until Page Contains  Contratos » Pesquisar
    Clear Element Text  ${PESQUISA_NUMERO_CONTRATO}
    Set Focus To Element   ${INPUT_PESQUISA_TITULO}
    Input Text  ${INPUT_PESQUISA_TITULO}    ${arg1}  clear=True
    Set Focus To Element   ${BOTAO_PESQUISAR}
    Click Element    ${BOTAO_PESQUISAR}

Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos
    [Arguments]  ${arg1}
    Wait Until Page Contains    ${arg1}    timeout=${TIMEOUT}
    Click Element    xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]/b/a
    Wait Until Page Contains  Contratos »   timeout=${TIMEOUT}

Salvar valor ID SISTEMA DE GESTÃO
    Wait Until Page Contains    Contratos »     timeout=${TIMEOUT}
    ${CONTRATO_ID_SISTEMA_DE_GESTAO}  Set Variables  ${EMPTY}
    ${CONTRATO_ID_SISTEMA_DE_GESTAO}  Get Text  id:contrato_id_sistema_gestao_c
    Set Global Variable  ${CONTRATO_ID_SISTEMA_DE_GESTAO}

Clicar em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos
    [Arguments]  ${arg1}
    Wait Until Page Contains    ${arg1}    timeout=${TIMEOUT}
    Click Element    xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]/b/a
    Wait Until Page Contains  Contratos »   timeout=${TIMEOUT}


Clicar em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a SIM, que tenha Beneficiários Ativos
    [Arguments]  ${arg1}
    Wait Until Page Contains    ${arg1}    timeout=${TIMEOUT}
    Click Element    xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]/b/a
    Wait Until Page Contains  Contratos »   timeout=${TIMEOUT}


Gerar uma Movimentação Cadastral de Exclusão de Beneficiário
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${SUBMENU_GERAR_MOV_CADASTRAL}
    Wait Until Page Contains   Gerar Movimentação Cadastral    timeout=${TIMEOUT}
    Wait Until Element Is Visible    ${TIPO_MOVIMENTACAO_CADASTRAL}    timeout=${TIMEOUT}
    Click Element  ${TIPO_MOVIMENTACAO_CADASTRAL}
    Click Element  ${TIPO_MOV_EXC_BENEF}
    #Select From List By Label  ${TIPO_MOVIMENTACAO_CADASTRAL}   Exclusão de Beneficiário
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    Click Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    Wait Until Page Contains  Movimentação criada com sucesso.  timeout=${TIMEOUT}
    ${cod_mov_cadastral}  Get Text  xpath://*[@id="pagecontent"]/div[1]/h2
    Set Global Variable    ${cod_mov_cadastral}
    Wait Until Page Contains  ${cod_mov_cadastral}   timeout=${TIMEOUT}
    ${protocolo_mov_cadastral}  Get Text  xpath://*[@id="proto"]/a
    Set Test Variables   ${protocolo_mov_cadastral}


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA DE HOJE, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    41 - Rompimento do contrato por iniciativa do beneficiário
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[32]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[27]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '41')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Validar BENEFICIARIO excluido (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO
    [Arguments]  ${arg1}
    Run Keyword  Validar dados CRM x Sistema de Gestão - Movimentação Cadastral

Validar BENEFICIARIO excluido (com Data de Exclusão igual a DATA ATUAL) e situação igual a ATIVO
    [Arguments]  ${arg1}
    Run Keyword  Validar dados CRM com 1 ou mais beneficiarios - Movimentação Cadastral

Validar dados CRM com 1 ou mais beneficiarios - Movimentação Cadastral
    # ----- Aba Beneficiarios -----
    Repeat Keyword  2 times  Press Keys  None  END
    Sleep  6s
    Set Focus To Element  xpath://*[@id="subPanel"]//span/a[contains(., 'Nome do Beneficiário')]
    ${elementos}  Get WebElements  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[11]/span/span
    ${linhas}  Get Element Count  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[11]/span/span
    
    @{list_info_titular}  Create List
    FOR  ${t}  IN  @{elementos}
        ${informacoes}  Salvar dados Beneficiario Titular - Movimentação Cadastral
        Append To List  ${list_info_titular}  ${informacoes}
        ${result_beneficiario}  Query - Validação Mov Cadastral  ${cod_fam_benef}  ${nome_benef}
        Log  ${result_beneficiario}
        Log  ${list_info_titular}
        Set Test Variables  @{list_info_titular}
        ${result}  Run Keyword  Validar Linhas - Movimentação Cadastral  ${list_info_titular}  ${result_beneficiario}
    END
    
    # beneficiario 01
    Set Focus To Element  xpath://*[@id="subPanel"]//span/a[contains(., 'Nome do Beneficiário')]
    ${elementos}  Get WebElements  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Cônjuge')]/../../../td[11]/span/span
    ${linhas}  Get Element Count  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[11]/span/span
    @{list_info_dependente}  Create List
    FOR  ${t}  IN  @{elementos}
        ${informacoes}  Salvar dados Beneficiario Dependente - Movimentação Cadastral
        Append To List  ${list_info_dependente}  ${informacoes}
        ${result_beneficiario}  Query - Validação Mov Cadastral  ${cod_fam_benef}  ${nome_benef}
        Log  ${result_beneficiario}
        Log  ${list_info_dependente}
        Set Test Variables  @{list_info_dependente}
        ${result}  Run Keyword  Validar Linhas - Movimentação Cadastral  ${list_info_dependente}  ${result_beneficiario}
    END

    # beneficiario 02
    Set Focus To Element  xpath://*[@id="subPanel"]//span/a[contains(., 'Nome do Beneficiário')]
    ${elementos}  Get WebElements  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Filhos(as)')]/../../../td[11]/span/span
    ${linhas}  Get Element Count  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[11]/span/span
    @{list_info_dependente_2}  Create List
    FOR  ${t}  IN  @{elementos}
        ${informacoes}  Salvar dados Beneficiario Dependente - Movimentação Cadastral
        Append To List  ${list_info_dependente_2}  ${informacoes}
        ${result_beneficiario}  Query - Validação Mov Cadastral  ${cod_fam_benef}  ${nome_benef}
        Log  ${result_beneficiario}
        Log  ${list_info_dependente_2}
        Set Test Variables  @{list_info_dependente_2}
        ${result}  Run Keyword  Validar Linhas - Movimentação Cadastral  ${list_info_dependente_2}  ${result_beneficiario}
    END




Validar dados CRM x Sistema de Gestão - Movimentação Cadastral
    # ----- Aba Beneficiarios -----
    Repeat Keyword  3 times  Press Keys  None  END
    Sleep  6s
    Set Focus To Element  xpath://*[@id="subPanel"]//span/a[contains(., 'Nome do Beneficiário')]
    ${elementos}  Get WebElements  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[11]/span/span
    ${linhas}  Get Element Count  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[11]/span/span
    @{list_info_titular}  Create List
    FOR  ${t}  IN  @{elementos}
        ${informacoes}  Salvar dados Beneficiario Titular - Movimentação Cadastral
        Append To List  ${list_info_titular}  ${informacoes}
        ${result_beneficiario}  Query - Validação Mov Cadastral  ${cod_fam_benef}  ${nome_benef}
        Log  ${result_beneficiario}
        Log  ${list_info_titular}
        Set Test Variables  @{list_info_titular}
        ${result}  Run Keyword  Validar Linhas - Movimentação Cadastral  ${list_info_titular}  ${result_beneficiario}
    END


    Set Focus To Element  xpath://*[@id="subPanel"]//span/a[contains(., 'Nome do Beneficiário')]
    ${elementos}  Get WebElements  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Cônjuge') or contains(text(), 'Filhos(as)')]/../../../td[11]/span/span
    ${linhas}  Get Element Count  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[11]/span/span
    @{list_info_dependente}  Create List
    FOR  ${t}  IN  @{elementos}
        ${informacoes}  Salvar dados Beneficiario Dependente - Movimentação Cadastral
        Append To List  ${list_info_dependente}  ${informacoes}
        ${result_beneficiario}  Query - Validação Mov Cadastral  ${cod_fam_benef}  ${nome_benef}
        Log  ${result_beneficiario}
        Log  ${list_info_dependente}
        Set Test Variables  @{list_info_dependente}
        ${result}  Run Keyword  Validar Linhas - Movimentação Cadastral  ${list_info_dependente}  ${result_beneficiario}
    END


Salvar dados Beneficiario Titular - Movimentação Cadastral
    @{LISTA_TEMP_TITULAR}    Create List
    Set Focus To Element  ${PAINEL_BENEFICIARIOS}
    ${nome_benef}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[1]/span/a
    Append To List       ${LISTA_TEMP_TITULAR}    ${nome_benef}
    Set Test Variables   ${nome_benef}
    ${situacao_benef_titular}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[6]/span
    Append To List       ${LISTA_TEMP_TITULAR}    ${situacao_benef_titular}
    ${cod_fam_benef}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[12]/span
    Append To List       ${LISTA_TEMP_TITULAR}    ${cod_fam_benef}
    Set Test Variables   ${cod_fam_benef}

    Set Focus To Element  xpath://*[@id="subPanel"]//span/a[contains(., 'Nome do Beneficiário')]
    Set Focus To Element  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]//span[contains(., '${nome_benef}')]/a
    Click Element  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]//span[contains(., '${nome_benef}')]/a
    Wait Until Page Contains  Beneficiários » ${nome_benef}

    Set Focus To Element   ${SITUACAO_BENEFICIARIO}
    ${situacao_benef}  Get Value  ${SITUACAO_BENEFICIARIO}
    Append To List       ${LISTA_TEMP_TITULAR}    ${situacao_benef}
    
    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'cancelado'  Get Text  ${DATA_EXCLUSAO_BENEFICIARIO}
    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'cancelado'  Convert Date       ${data_exclusao_benef}     date_format=%d/%m/%Y %H:%M     result_format=%Y-%m-%d %H:%M
    Run Keyword If  '${situacao_benef}' == 'cancelado'  Append To List       ${LISTA_TEMP_TITULAR}    ${data_exclusao_benef}

    Go Back
    #Execute Javascript  history.back()
    Log Many  @{LISTA_TEMP_TITULAR}
    RETURN    @{LISTA_TEMP_TITULAR}


Salvar dados Beneficiario Dependente - Movimentação Cadastral
    @{LISTA_TEMP_DEPENDENTE}    Create List

    Set Focus To Element  ${PAINEL_BENEFICIARIOS}
    ${nome_benef}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Cônjuge') or contains(text(), 'Filhos(as)')]/../../../td[1]/span/a
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${nome_benef}
    Set Test Variables   ${nome_benef}
    ${situacao_benef_dependente}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Cônjuge') or contains(text(), 'Filhos(as)')]/../../../td[6]/span
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${situacao_benef_dependente}
    ${cod_fam_benef}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Cônjuge') or contains(text(), 'Filhos(as)')]/../../../td[12]/span
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${cod_fam_benef}
    Set Test Variables   ${cod_fam_benef}
    
    Set Focus To Element  xpath://*[@id="subPanel"]//span/a[contains(., 'Nome do Beneficiário')]
    Set Focus To Element  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]//span[contains(., '${nome_benef}')]/a
    Click Element  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]//span[contains(., '${nome_benef}')]/a
    Wait Until Page Contains  Beneficiários » ${nome_benef}

    Set Focus To Element   ${SITUACAO_BENEFICIARIO}
    ${situacao_benef}  Get Value  ${SITUACAO_BENEFICIARIO}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${situacao_benef}
    
    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'cancelado'  Get Text  ${DATA_EXCLUSAO_BENEFICIARIO}
    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'cancelado'  Convert Date       ${data_exclusao_benef}     date_format=%d/%m/%Y %H:%M     result_format=%Y-%m-%d %H:%M
    Run Keyword If  '${situacao_benef}' == 'cancelado'  Append To List       ${LISTA_TEMP_DEPENDENTE}    ${data_exclusao_benef}
    
    Go Back
    #Execute Javascript  history.back()
    Log Many  @{LISTA_TEMP_DEPENDENTE}
    RETURN    @{LISTA_TEMP_DEPENDENTE}



Validar Linhas - Movimentação Cadastral
    [Arguments]  ${lista_final}  ${lista_banco}
    FOR  ${benef}  IN  @{lista_final}
        Validar Linha - Movimentação Cadastral  ${benef}  ${lista_banco}
    END

Validar Linha - Movimentação Cadastral
    [Arguments]  ${lista_final}  ${lista_banco}
    FOR  ${i}  IN  @{lista_banco}
        # DEP_CODIGO, GRAU_DEP, FAM_CODIGO, CNP, USS_COMPLETO, USS_DT_EXCLUSAO
        ${db_dep_codigo}    Set Variables   ${i[0]}
        ${db_grau_dep}      Set Variables   ${i[1]}
        ${db_fam_codigo}    Set Variables   ${i[2]}
        ${db_cnp}           Set Variables   ${i[3]}
        ${db_uss_completo}  Set Variables   ${i[4]}
        ${db_dt_exclusao}   Set Variables   ${i[5]}
        ${db_dt_exclusao}   Convert To String  ${db_dt_exclusao}

        ${tl_situacao_benef}  Set Variables      ${lista_final[3]}
        ${tl_fam_codigo}      Set Variables      ${lista_final[2]}
        ${tl_fam_codigo}      Convert To Integer  ${tl_fam_codigo}
        ${tl_uss_completo}    Set Variables      ${lista_final[0]}
        ${tl_dt_exclusao}     Run Keyword If  '${tl_situacao_benef}' == 'cancelado'  Set Variables  ${lista_final[4]}
  
        Should Be Equal  ${tl_fam_codigo}    ${db_fam_codigo}    
        Should Be Equal  ${tl_uss_completo}  ${db_uss_completo}
        # Run Keyword If  '${tl_situacao_benef}' == 'cancelado'   Should Be Equal  ${tl_dt_exclusao}   ${db_dt_exclusao}

        Log Many  @{lista_final}
        Log Many  @{lista_banco}
        Set Global Variable  @{lista_final}  ${EMPTY}
        Set Global Variable  @{lista_banco}  ${EMPTY}
    END


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, não alterou o campo "Data de Exclusão", "Data de Obito" igual a DATA DE ONTEM, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    44 - Óbito
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     - 1 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_obito}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_obito}
    Input Text   ${BENEF_DATA_OBITO}    ${data_obito}

    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Execute Javascript  document.getElementById('beneficiario').value="${arg1[32]}"
    Sleep  5s
    Repeat Keyword  2 times  Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[27]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '44')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA DE HOJE, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    46 - Inclusão indevida de beneficiários
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[32]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[27]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '46')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    47 - Fraude (art. 13 da Lei 9.656/98)
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[32]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[27]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '47')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    48 - Por portabilidade de carência
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[32]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[27]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '48')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    41 - Rompimento do contrato por iniciativa do beneficiário
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[44]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '41')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Click Element   ${NAO_CONTRIBUIU}
    Wait Until Page Contains   Não possui direito da continuidade do plano    timeout=60
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[44]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a PEDIDO DEMISSÃO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Click Element   ${SIM_CONTRIBUIU}
    Wait Until Page Contains  Motivos da extinção do Contrato de Trabalho:  timeout=${TIMEOUT}
    Click Element   xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody//label[contains(., 'Pedido de demissão')]
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[56]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a NÃO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Click Element   ${SIM_CONTRIBUIU}
    Wait Until Page Contains  Motivos da extinção do Contrato de Trabalho:  timeout=${TIMEOUT}
    Click Element  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody//label[contains(., 'Aposentadoria')]
    Wait Until Page Contains  O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?  timeout=${TIMEOUT}
    Click Element  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[7]/td[2]/label[contains(., 'Não')]
    Wait Until Page Contains  Não possui direito da continuidade do plano  timeout=${TIMEOUT}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[71]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[25]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[75]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a SIM, "titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a NÃO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Click Element   ${SIM_CONTRIBUIU}
    Wait Until Page Contains  Motivos da extinção do Contrato de Trabalho:  timeout=${TIMEOUT}
    Click Element  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[6]/td[2]/label[contains(., 'Aposentadoria')]
    Wait Until Page Contains  O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?  timeout=${TIMEOUT}
    Click Element  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[7]/td[2]/label[contains(., 'Sim')]
    Wait Until Page Contains  Possui direito da continuidade do plano  timeout=${TIMEOUT}
    Wait Until Page Contains  O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?  timeout=${TIMEOUT}
    Click Element  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[9]/td[2]/label[contains(., 'Não')]
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[88]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[92]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a NÃO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Click Element   ${SIM_CONTRIBUIU}
    Wait Until Page Contains  Motivos da extinção do Contrato de Trabalho:  timeout=${TIMEOUT}
    Click Element    xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[6]/td[2]/label[contains(., 'Demissão/exoneração sem justa causa')]
    Wait Until Page Contains  Possui direito da continuidade do plano  timeout=${TIMEOUT}
    Wait Until Page Contains  O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?  timeout=${TIMEOUT}
    Click Element  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[9]/td[2]/label[contains(., 'Não')]
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[104]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[108]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 10 Vidas)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_10vidas.csv

    ${titular1}  Create List   ${arg1[40]}  ${arg1[39]}  ${arg1[43]}  ${arg1[44]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente1}  Create List   ${arg1[48]}  ${arg1[47]}  ${arg1[39]}  ${arg1[51]}  ${arg1[52]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${titular2}  Create List   ${arg1[56]}  ${arg1[55]}  ${arg1[59]}  ${arg1[61]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente2}  Create List   ${arg1[64]}  ${arg1[63]}  ${arg1[55]}  ${arg1[67]}  ${arg1[68]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${titular3}  Create List   ${arg1[72]}  ${arg1[71]}  ${arg1[75]}  ${arg1[77]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente3}  Create List   ${arg1[80]}  ${arg1[79]}  ${arg1[71]}  ${arg1[83]}  ${arg1[84]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${titular4}  Create List   ${arg1[88]}  ${arg1[87]}  ${arg1[91]}  ${arg1[93]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente4}  Create List   ${arg1[96]}  ${arg1[95]}  ${arg1[87]}  ${arg1[99]}  ${arg1[100]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${titular5}  Create List   ${arg1[104]}  ${arg1[103]}  ${arg1[107]}  ${arg1[109]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente5}  Create List   ${arg1[112]}  ${arg1[111]}  ${arg1[103]}  ${arg1[115]}  ${arg1[116]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${slots_titular}  Create List   0  1  8  14  30  31  48
    ${slots_dependente}  Create List   0  1  5  8  14  30  31  47  48

    Edit Line  0  ${titular1}   ${slots_titular}
    Edit Line  1  ${dependente1}   ${slots_dependente}

    Edit Line  2  ${titular2}   ${slots_titular}
    Edit Line  3  ${dependente2}   ${slots_dependente}

    Edit Line  4  ${titular3}   ${slots_titular}
    Edit Line  5  ${dependente3}   ${slots_dependente}

    Edit Line  6  ${titular4}   ${slots_titular}
    Edit Line  7  ${dependente4}   ${slots_dependente}

    Edit Line  8  ${titular5}   ${slots_titular}
    Edit Line  9  ${dependente5}   ${slots_dependente}

    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_10vidas.csv
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_10vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_mov_cadastral_10vidas    timeout=${TIMEOUT}


Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 6 Vidas)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_6vidas.csv

    ${titular1}  Create List   ${arg1[39]}  ${arg1[38]}  ${arg1[42]}  ${arg1[44]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente1}  Create List   ${arg1[47]}  ${arg1[46]}  ${arg1[38]}  ${arg1[50]}  ${arg1[52]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${titular2}  Create List   ${arg1[55]}  ${arg1[54]}  ${arg1[58]}  ${arg1[60]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente2}  Create List   ${arg1[63]}  ${arg1[62]}  ${arg1[54]}  ${arg1[66]}  ${arg1[68]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${titular3}  Create List   ${arg1[71]}  ${arg1[70]}  ${arg1[74]}  ${arg1[76]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente3}  Create List   ${arg1[79]}  ${arg1[78]}  ${arg1[70]}  ${arg1[82]}  ${arg1[84]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${slots_titular}  Create List   0  1  8  14  30  31  48
    ${slots_dependente}  Create List   0  1  5  8  14  30  31  47  48

    Edit Line  0  ${titular1}   ${slots_titular}
    Edit Line  1  ${dependente1}   ${slots_dependente}

    Edit Line  2  ${titular2}   ${slots_titular}
    Edit Line  3  ${dependente2}   ${slots_dependente}

    Edit Line  4  ${titular3}   ${slots_titular}
    Edit Line  5  ${dependente3}   ${slots_dependente}

    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_6vidas.csv

    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_6vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}

    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_mov_cadastral    timeout=${TIMEOUT}


Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 4 Vidas)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_4vidas.csv

    ${titular1}  Create List   ${arg1[39]}  ${arg1[38]}  ${arg1[42]}  ${arg1[44]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente1}  Create List   ${arg1[47]}  ${arg1[46]}  ${arg1[38]}  ${arg1[50]}  ${arg1[52]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${titular2}  Create List   ${arg1[55]}  ${arg1[54]}  ${arg1[58]}  ${arg1[60]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente2}  Create List   ${arg1[63]}  ${arg1[62]}  ${arg1[54]}  ${arg1[66]}  ${arg1[68]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${slots_titular}  Create List   0  1  8  14  30  31  48
    ${slots_dependente}  Create List   0  1  5  8  14  30  31  47  48
    
    ${t}  Run Keyword And Ignore Error   Edit Line  0  ${titular1}   ${slots_titular}
    Run Keyword If  "${t[0]}" == "FAIL"  Edit Line  1  ${titular1}   ${slots_titular}
    
    Edit Line  2  ${dependente1}   ${slots_dependente}

    Edit Line  3  ${titular2}   ${slots_titular}
    Edit Line  4  ${dependente2}   ${slots_dependente}

    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_4vidas.csv

    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_4vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}

    ${i}  Run Keyword And Ignore Error   Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Run Keyword If  "${i[0]}" == "FAIL"  Wait Until Page Contains    Importado Parcial    timeout=${TIMEOUT}
    
    Wait Until Page Contains    Importação » beneficiario_import_mov_cadastral_4vidas    timeout=${TIMEOUT}


Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 4 Vidas - Segundo Contrato)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_4vidas.csv

    ${titular1}  Create List   ${arg1[71]}  ${arg1[70]}  ${arg1[74]}  ${arg1[76]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente1}  Create List   ${arg1[79]}  ${arg1[78]}  ${arg1[70]}  ${arg1[82]}  ${arg1[84]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${titular2}  Create List   ${arg1[87]}  ${arg1[86]}  ${arg1[90]}  ${arg1[92]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente2}  Create List   ${arg1[95]}  ${arg1[94]}  ${arg1[86]}  ${arg1[98]}  ${arg1[100]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${slots_titular}  Create List   0  1  8  14  30  31  48
    ${slots_dependente}  Create List   0  1  5  8  14  30  31  47  48

    Edit Line  0  ${titular1}   ${slots_titular}
    Edit Line  1  ${dependente1}   ${slots_dependente}

    Edit Line  2  ${titular2}   ${slots_titular}
    Edit Line  3  ${dependente2}   ${slots_dependente}

    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_4vidas.csv

    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_4vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_mov_cadastral_4vidas    timeout=${TIMEOUT}


Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 2 Vidas)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_2vidas.csv
    Log  ${lines}

    ${titular1}  Create List   ${arg1[39]}  ${arg1[38]}  ${arg1[42]}  ${arg1[44]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente1}  Create List   ${arg1[47]}  ${arg1[46]}  ${arg1[38]}  ${arg1[50]}  ${arg1[52]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${slots_titular}  Create List   0  1  8  14  30  31  48
    ${slots_dependente}  Create List   0  1  5  8  14  30  31  47  48

    Edit Line  0  ${titular1}   ${slots_titular}
    Edit Line  1  ${dependente1}   ${slots_dependente}

    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_2vidas.csv

    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_2vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_mov_cadastral_2vidas    timeout=${TIMEOUT}


Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 2 Vidas - Teste)
    [Arguments]  @{arg1}
    #Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${lines}  Set Variables  ${EMPTY}
    ${header}  Set Variables  ${EMPTY}
    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_2vidas_2.csv
    Log  ${lines}

    ${titular1}  Create List   ${arg1[39]}  ${arg1[38]}  ${arg1[42]}  ${arg1[44]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente1}  Create List   ${arg1[47]}  ${arg1[46]}  ${arg1[38]}  ${arg1[50]}  ${arg1[52]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${slots_titular}  Create List   0  1  8  14  30  31  48
    ${slots_dependente}  Create List   0  1  5  8  14  30  31  47  48

    Edit Line  0  ${titular1}   ${slots_titular}
    Edit Line  1  ${dependente1}   ${slots_dependente}

    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_2vidas_2.csv

    # Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    # Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_2vidas.csv
    # Click Element                     ${BOTAO_SALVAR_CONTRATO}
    # ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    # Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    # Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    # Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    # Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    # Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    # Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    # Click Element    ${BOTAO_SIM_CONFIRMACAO}
    # Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    # Wait Until Page Contains    Importação » beneficiario_import_mov_cadastral_2vidas    timeout=${TIMEOUT}


Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 2 Vidas - Tranf Grupo Familiar)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_2vidas.csv
    Log To Console  ${lines}

    ${titular1}  Create List   ${arg1[119]}  ${arg1[118]}  ${arg1[122]}  ${arg1[124]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente1}  Create List   ${arg1[127]}  ${arg1[126]}  ${arg1[118]}  ${arg1[130]}  ${arg1[132]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${slots_titular}  Create List   0  1  8  14  30  31  48
    ${slots_dependente}  Create List   0  1  5  8  14  30  31  47  48

    Edit Line  0  ${titular1}   ${slots_titular}
    Edit Line  1  ${dependente1}   ${slots_dependente}

    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_2vidas.csv

    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_2vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_mov_cadastral_2vidas    timeout=${TIMEOUT}


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a SIM, "titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM, "Tempo de contribuição?" igual a 60, selecionou os Dependentes, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Click Element   ${SIM_CONTRIBUIU}
    Wait Until Page Contains  O titular contribuiu no pagamento da mensalidade de seu plano?  timeout=${TIMEOUT}
    Click Element   ${BOTAO_SIM_MENSALIDADE}

    Wait Until Page Contains  Motivos da extinção do Contrato de Trabalho:  timeout=${TIMEOUT}
    Click Element    xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody//label[contains(., 'Aposentadoria')]
    
    Wait Until Page Contains  Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?  timeout=${TIMEOUT}
    Click Element      Click Element   ${BOTAO_SIM_VINCULO_EMPREGATICIO}
   
    Wait Until Page Contains  Possui direito da continuidade do plano  timeout=${TIMEOUT}
    Wait Until Page Contains  O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?  timeout=${TIMEOUT}
    Click Element  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[9]/td[2]/label[contains(., 'Sim')]
    
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Tempo de contribuição?:  timeout=${TIMEOUT}
    Input Text   ${INPUT_TEMPO_CONTRIBUICAO}  60
    Click Element    ${LABEL_TEMPO_CONTRIBUICAO}
    Click Element   xpath://*[@id="LBL_EDITVIEW_PANEL1"]/tbody/tr[2]/td[2]/label[2]/input
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[44]}
    Set Focus To Element    ${INPUT_CEP}
    Sleep  2s
    Input Text   ${INPUT_CEP}    ${arg1[23]}
    #Execute Javascript  document.getElementById('registro_endereco_end_cep_aaaaa').value="${arg1[22]}"
    Sleep  2s
    Click Element  ${LABEL_CEP}
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${LOADING_CEP}  timeout=${TIMEOUT}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${LOADING_CEP}  timeout=${TIMEOUT}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Sleep  2s
    Set Focus To Element   ${INPUT_NUMERO}
    Input Text   ${INPUT_NUMERO}    ${arg1[24]}
    #Execute Javascript  document.getElementById('registro_endereco_end_numero_aaaaa').value="${arg1[23]}"
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  É necessário anexar documento comprobatório de contribuição excedente ao indicado.  timeout=${TIMEOUT}
    Click Element  ${BOTAO_SIM_CONFIRMACAO}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM, "Tempo de contribuição?" igual a 60, selecionou os Dependentes, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Click Element   ${SIM_CONTRIBUIU}
    Wait Until Page Contains  Motivos da extinção do Contrato de Trabalho:  timeout=${TIMEOUT}
    Click Element    xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[6]/td[2]/label[contains(., 'Demissão/exoneração sem justa causa')]
    Wait Until Page Contains  Possui direito da continuidade do plano  timeout=${TIMEOUT}
    Wait Until Page Contains  O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?  timeout=${TIMEOUT}
    Click Element  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody/tr[9]/td[2]/label[contains(., 'Sim')]
    
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[56]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Tempo de contribuição?:  timeout=${TIMEOUT}
    Input Text   ${INPUT_TEMPO_CONTRIBUICAO}  60
    Click Element    ${LABEL_TEMPO_CONTRIBUICAO}
    Click Element   xpath://*[@id="LBL_EDITVIEW_PANEL1"]/tbody/tr[2]/td[2]/label[2]/input
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element    ${INPUT_CEP}
    Sleep  2s
    Input Text   ${INPUT_CEP}    ${arg1[23]}
    #Execute Javascript  document.getElementById('registro_endereco_end_cep_aaaaa').value="${arg1[22]}"
    Sleep  2s
    Click Element  ${LABEL_CEP}
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${LOADING_CEP}  timeout=${TIMEOUT}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${LOADING_CEP}  timeout=${TIMEOUT}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Sleep  2s
    Set Focus To Element   ${INPUT_NUMERO}
    Input Text   ${INPUT_NUMERO}    ${arg1[24]}
    #Execute Javascript  document.getElementById('registro_endereco_end_numero_aaaaa').value="${arg1[23]}"
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  É necessário anexar documento comprobatório de contribuição excedente ao indicado.  timeout=${TIMEOUT}
    Click Element  ${BOTAO_SIM_CONFIRMACAO}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    44 - Óbito
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     - 1 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_obito}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_obito}
    Input Text   ${BENEF_DATA_OBITO}    ${data_obito}

    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '44')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    44 - Óbito
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     - 1 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_obito}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_obito}
    Input Text   ${BENEF_DATA_OBITO}    ${data_obito}

    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[65]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[27]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[69]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '44')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    46 - Inclusão indevida de beneficiários
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[39]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[25]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[59]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '46')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    46 - Inclusão indevida de beneficiários
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[64]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[68]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '46')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    47 - Fraude (art. 13 da Lei 9.656/98)
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '47')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    47 - Fraude (art. 13 da Lei 9.656/98)
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[64]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[68]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '47')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    48 - Por portabilidade de carência
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '48')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    48 - Por portabilidade de carência
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[64]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[68]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '48')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    41 - Rompimento do contrato por iniciativa do beneficiário
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '41')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    41 - Rompimento do contrato por iniciativa do beneficiário
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[64]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[68]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '41')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO, telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Click Element   ${NAO_CONTRIBUIU}
    Wait Until Page Contains   Não possui direito da continuidade do plano    timeout=60
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a PEDIDO DEMISSÃO, telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Click Element   ${SIM_CONTRIBUIU}
    Wait Until Page Contains  Motivos da extinção do Contrato de Trabalho:  timeout=${TIMEOUT}
    Click Element   xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody//label[contains(., 'Pedido de demissão')]
    Wait Until Page Contains   Não possui direito da continuidade do plano    timeout=60
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[56]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a NÃO, telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Click Element   ${SIM_CONTRIBUIU}
    Wait Until Page Contains  Motivos da extinção do Contrato de Trabalho:  timeout=${TIMEOUT}
    Click Element  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody//label[contains(., 'Aposentadoria')]
    Wait Until Page Contains  O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?  timeout=${TIMEOUT}
    Click Element  xpath://*[@id="Default_saude_MOVIMENTACAO_BENEF_Subpanel"]/tbody//label[contains(., 'Não')]
    Wait Until Page Contains  Não possui direito da continuidade do plano  timeout=${TIMEOUT}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[72]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[76]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" de 1º dia do mês seguinte para DATA DE HOJE, telefone celular, e-mail    @{INTEGMOVEXCPJ14}
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    46 - Inclusão indevida de beneficiários
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     30 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[39]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[25]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[59]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '46')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail    @{INTEGMOVEXCPJ14}
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    46 - Inclusão indevida de beneficiários
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[63]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[25]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[67]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '46')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    47 - Fraude (art. 13 da Lei 9.656/98)
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[39]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[25]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[59]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '47')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    47 - Fraude (art. 13 da Lei 9.656/98)
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[63]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[25]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[67]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '47')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    48 - Por portabilidade de carência
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '48')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    48 - Por portabilidade de carência
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[64]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[68]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '48')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", informou um Telefone celular e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    41 - Rompimento do contrato por iniciativa do beneficiário
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '41')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, informou um Telefone celular e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    41 - Rompimento do contrato por iniciativa do beneficiário
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[64]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[68]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '41')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    42 - Desligamento da empresa
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Click Element   ${NAO_CONTRIBUIU}
    Wait Until Page Contains   Não possui direito da continuidade do plano    timeout=60
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '42')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    44 - Óbito
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     - 1 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_obito}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_obito}
    Input Text   ${BENEF_DATA_OBITO}    ${data_obito}

    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '44')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s



Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    44 - Óbito
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     - 1 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_obito}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_obito}
    Input Text   ${BENEF_DATA_OBITO}    ${data_obito}

    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[63]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[25]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[67]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '44')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    46 - Inclusão indevida de beneficiários
    ${data_exclusao}  Get Value  ${BENEF_DATA_EXCLUSAO}
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[39]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[25]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[59]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '46')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    46 - Inclusão indevida de beneficiários
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[64]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[68]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '46')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Gerar uma Movimentação Cadastral de Exclusão de Beneficiário RN412
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${SUBMENU_GERAR_MOV_CADASTRAL}
    Wait Until Page Contains   Gerar Movimentação Cadastral    timeout=${TIMEOUT}
    Wait Until Element Is Visible    ${TIPO_MOVIMENTACAO_CADASTRAL}    timeout=${TIMEOUT}
    Click Element  ${TIPO_MOVIMENTACAO_CADASTRAL}
    Click Element  ${TIPO_MOV_EXC_BENEF_RN412}
    #Select From List By Label  ${TIPO_MOVIMENTACAO_CADASTRAL}   Exclusão de Beneficiário
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    Click Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    Wait Until Page Contains  Movimentação criada com sucesso.  timeout=${TIMEOUT}
    ${cod_mov_cadastral}  Get Text  xpath://*[@id="pagecontent"]/div[1]/h2
    Set Global Variable    ${cod_mov_cadastral}
    Wait Until Page Contains  ${cod_mov_cadastral}   timeout=${TIMEOUT}
    ${protocolo_mov_cadastral}  Get Text  xpath://*[@id="proto"]/a
    Set Test Variables   ${protocolo_mov_cadastral}


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone celular e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    41 - Rompimento do contrato por iniciativa do beneficiário
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Sleep  5s
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[48]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[52]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '41')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    48 - Por portabilidade de carência
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Sleep  5s
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[47]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[25]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[51]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '48')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    41 - Rompimento do contrato por iniciativa do beneficiário
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Sleep  5s
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains  Dependentes que serão excluídos com o Titular:  timeout=${TIMEOUT}
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '41')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    41 - Rompimento do contrato por iniciativa do beneficiário
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[64]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[68]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '41')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual DATA DE HOJE, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    41 - Rompimento do contrato por iniciativa do beneficiário
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[48]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[52]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '41')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    48 - Por portabilidade de carência
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    #Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[60]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '48')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_benef_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Click Element  ${BOTAO_CRIAR_BENEF_EXCLUSAO}
    Wait Until Page Contains  Beneficiários Exclusão » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${MOTIVO_BENEF_EXCLUSAO}    48 - Por portabilidade de carência
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    #Input Text   ${BENEF_DATA_EXCLUSAO}    ${data_exclusao}
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[48]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Input Text   ${TELEFONE_CEL_EXCLUSAO}  ${arg1[26]}
    Input Text   ${EMAIL_EXCLUSAO}  ${arg1[52]}
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Set Focus To Element  xpath://*[@id="subPanel"]/tbody/tr/td[8]/span[contains(., '48')]
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Alteração" igual a EM 24 HORAS, selecionou novo produto
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_troca_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_MUDANCA_PROD}
    Click Element  ${BOTAO_CRIAR_MUDANCA_PROD}
    Wait Until Page Contains  Mudança de Produto » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${ALTERACAO_PROD_VIGENCIA}    Em 24 horas
    Wait Until Page Contains  O pedido de mudança de produto "em 24 horas" será efetivado até o primeiro dia útil subsequente à solicitação, observados o protocolo apto a ser processado e a análise prévia da Unimed.  timeout=${TIMEOUT}  
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Click Element   ${NOVO_PRODUTO}
    Click Element   xpath://*[@id="aos_products_id1_c"]/option[2]
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, informou "Alteração" igual a 1° DIA DO MÊS SEGUINTE, selecionou novo produto
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_troca_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_MUDANCA_PROD}
    Click Element  ${BOTAO_CRIAR_MUDANCA_PROD}
    Wait Until Page Contains  Mudança de Produto » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${ALTERACAO_PROD_VIGENCIA}    1º dia do mês seguinte
    Sleep  5s
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[64]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Click Element   ${NOVO_PRODUTO}
    Click Element   xpath://*[@id="aos_products_id1_c"]/option[2]
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Alteração" igual a EÚLTIMO DIA DO MÊS, selecionou novo produto
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_troca_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_MUDANCA_PROD}
    Click Element  ${BOTAO_CRIAR_MUDANCA_PROD}
    Wait Until Page Contains  Mudança de Produto » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${ALTERACAO_PROD_VIGENCIA}    Último dia do mês
    Sleep  5s
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[72]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Sleep  3s
    Click Element   ${NOVO_PRODUTO}
    Click Element   xpath://*[@id="aos_products_id1_c"]/option[2]
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário DEPENDENTE, informou "Alteração" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou novo produto
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_troca_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_MUDANCA_PROD}
    Click Element  ${BOTAO_CRIAR_MUDANCA_PROD}
    Wait Until Page Contains  Mudança de Produto » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${ALTERACAO_PROD_VIGENCIA}    Especificar data
    Wait Until Page Contains  O pedido de mudança de produto será efetivado até o primeiro dia útil subsequente à solicitação, observados o protocolo apto a ser processado e a análise prévia da Unimed.  timeout=${TIMEOUT}  
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     5 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${DATA_ALTERACAO_MUD_PROD}  ${data_exclusao}
    Click Element    ${LABEL_DATA_ALTERACAO_MUD_PROD}
    Sleep  5s
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[96]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Click Element   ${NOVO_PRODUTO}
    Click Element   xpath://*[@id="aos_products_id1_c"]/option[2]
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Gerar uma Movimentação Cadastral de Mudança de Produto
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${SUBMENU_GERAR_MOV_CADASTRAL}
    Wait Until Page Contains   Gerar Movimentação Cadastral    timeout=${TIMEOUT}
    Wait Until Element Is Visible    ${TIPO_MOVIMENTACAO_CADASTRAL}    timeout=${TIMEOUT}
    Click Element  ${TIPO_MOVIMENTACAO_CADASTRAL}
    Click Element  ${TIPO_MOV_MUDANCA_PROD}
    #Select From List By Label  ${TIPO_MOVIMENTACAO_CADASTRAL}   Exclusão de Beneficiário
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    Click Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    ${f}  Run Keyword And Ignore Error    Wait Until Page Contains  ${cod_mov_cadastral}   timeout=${TIMEOUT}
    Run Keyword If  "${f[0]}" == "PASS"   Pegar Código Movimentação cadastral


Gerar uma Movimentação Cadastral de Transferência de Grupo Familiar
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${SUBMENU_GERAR_MOV_CADASTRAL}
    Wait Until Page Contains   Gerar Movimentação Cadastral    timeout=${TIMEOUT}
    Wait Until Element Is Visible    ${TIPO_MOVIMENTACAO_CADASTRAL}    timeout=${TIMEOUT}
    Click Element  ${TIPO_MOVIMENTACAO_CADASTRAL}
    Click Element  ${TIPO_MOV_TRANSFERENCIA_GRUPO_FAMILIAR}
    #Select From List By Label  ${TIPO_MOVIMENTACAO_CADASTRAL}   Exclusão de Beneficiário
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    Click Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    ${f}  Run Keyword And Ignore Error    Wait Until Page Contains  ${cod_mov_cadastral}   timeout=${TIMEOUT}
    Run Keyword If  "${f[0]}" == "PASS"   Pegar Código Movimentação cadastral


Pegar Código Movimentação cadastral
    ${cod_mov_cadastral}  Get Text  xpath://*[@id="pagecontent"]/div[1]/h2
    Set Global Variable    ${cod_mov_cadastral}
    Wait Until Page Contains  ${cod_mov_cadastral}   timeout=${TIMEOUT}
    ${protocolo_mov_cadastral}  Get Text  xpath://*[@id="proto"]/a
    Set Test Variables   ${protocolo_mov_cadastral}


CRM apresenta a mensagem de erro "A mudança de produto via movimentação cadastral é permitido apenas para Contratos Pessoa Jurídica."
    Wait Until Page Contains  Contratos »  timeout=${TIMEOUT}
    Wait Until Page Contains    A mudança de produto via movimentação cadastral é permitido apenas para Contratos Pessoa Jurídica.   timeout=${TIMEOUT}


CRM apresenta a mensagem de erro "A Transferência de Grupo Familiar via movimentação cadastral é permitida apenas para Contratos Pessoa Jurídica."
    Wait Until Page Contains  Contratos »  timeout=${TIMEOUT}
    Wait Until Page Contains    A Transferência de Grupo Familiar via movimentação cadastral é permitida apenas para Contratos Pessoa Jurídica.   timeout=${TIMEOUT}


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EM 24 HORAS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_transf_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_TRANSF}
    Click Element  ${BOTAO_CRIAR_TRANSF}
    Wait Until Page Contains  Transferência de Grupo Familiar » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${ALTERACAO_PROD_VIGENCIA}    Em 24 horas
    Wait Until Page Contains  O pedido de transferência de grupo familiar "em 24 horas" será efetivado até o primeiro dia útil subsequente à solicitação, observados o protocolo apto a ser processado e a análise prévia da Unimed.  timeout=${TIMEOUT}  
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[40]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Set Focus To Element   ${INPUT_CONTRATO_DESTINO}
    Sleep  3s
    Input Text   ${INPUT_CONTRATO_DESTINO}    ${arg1[32]}
    Click Element    ${LABEL_CONTRATO_DESTINO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Select From List By Label   ${INPUT_PRODUTO_ASSISTENCIAL}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Click Element    ${CHECKBOX_ACESSORIO1}
    Click Element    ${CHECKBOX_ACESSORIO2}
    Click Element    ${CHECK_SIM_MESMO_PRODUTO_TITULAR}
    Wait Until Page Contains    ${arg1[46]}    timeout=60
    Sleep  3s
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a 1° DIA DO MÊS SEGUINTE, selecionou o Contrato Destino, selecionou produto Assistencial
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_transf_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_TRANSF}
    Click Element  ${BOTAO_CRIAR_TRANSF}
    Wait Until Page Contains  Transferência de Grupo Familiar » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${ALTERACAO_PROD_VIGENCIA}    1º dia do mês seguinte
    Sleep  5s
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[56]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Set Focus To Element   ${INPUT_CONTRATO_DESTINO}
    Sleep  3s
    Input Text   ${INPUT_CONTRATO_DESTINO}    ${arg1[32]}
    Click Element    ${LABEL_CONTRATO_DESTINO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Select From List By Label   ${INPUT_PRODUTO_ASSISTENCIAL}      ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Click Element    ${CHECKBOX_ACESSORIO1}
    Click Element    ${CHECKBOX_ACESSORIO2}
    Click Element    ${CHECK_SIM_MESMO_PRODUTO_TITULAR}
    Wait Until Page Contains    ${arg1[64]}    timeout=60
    Sleep  3s
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EÚLTIMO DIA DO MÊS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_transf_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_TRANSF}
    Click Element  ${BOTAO_CRIAR_TRANSF}
    Wait Until Page Contains  Transferência de Grupo Familiar » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${ALTERACAO_PROD_VIGENCIA}    Último dia do mês
    Sleep  5s
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[72]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Set Focus To Element   ${INPUT_CONTRATO_DESTINO}
    Sleep  3s
    Input Text   ${INPUT_CONTRATO_DESTINO}    ${arg1[32]}
    Click Element    ${LABEL_CONTRATO_DESTINO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Select From List By Label   ${INPUT_PRODUTO_ASSISTENCIAL}     ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Click Element    ${CHECKBOX_ACESSORIO1}
    Click Element    ${CHECKBOX_ACESSORIO2}
    Click Element    ${CHECK_SIM_MESMO_PRODUTO_TITULAR}
    Wait Until Page Contains    ${arg1[80]}    timeout=60
    Sleep  3s
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou o Contrato Destino, selecionou produto Assistencial
    [Arguments]  @{arg1}
    Set Focus To Element  xpath://*[@id="subpanel_title_saude_movimentacao_cadastral_saude_movimentacao_transf_1"]/table/tbody/tr/td[1]/h3
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_TRANSF}
    Click Element  ${BOTAO_CRIAR_TRANSF}
    Wait Until Page Contains  Transferência de Grupo Familiar » Criar  timeout=${TIMEOUT}
    Select From List By Label   ${ALTERACAO_PROD_VIGENCIA}    Especificar data
    Wait Until Page Contains   O pedido de transferência de grupo familiar será efetivado até o primeiro dia útil subsequente à solicitação, observados o protocolo apto a ser processado e a análise prévia da Unimed.  timeout=${TIMEOUT}  
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     5 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_exclusao}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_exclusao}
    Input Text   ${DATA_TRANSF_GRUPO_FAMILIAR}  ${data_exclusao}
    Click Element    ${LABEL_DATA_TRANSF_GRUPO_FAMILIAR}
    Sleep  5s
    Set Focus To Element    ${INPUT_BENEFICIARIO_EXCLUSAO}
    Input Text   ${INPUT_BENEFICIARIO_EXCLUSAO}  ${arg1[88]}
    Click Element    ${LABEL_EXC_BENEFICIARIO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Set Focus To Element   ${INPUT_CONTRATO_DESTINO}
    Sleep  3s
    Input Text   ${INPUT_CONTRATO_DESTINO}    ${arg1[32]}
    Click Element    ${LABEL_CONTRATO_DESTINO}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Select From List By Label   ${INPUT_PRODUTO_ASSISTENCIAL}      ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Click Element    ${CHECKBOX_ACESSORIO1}
    Click Element    ${CHECKBOX_ACESSORIO2}
    Click Element    ${CHECK_SIM_MESMO_PRODUTO_TITULAR}
    Wait Until Page Contains    ${arg1[96]}    timeout=60
    Sleep  3s
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Click Element  ${BOTAO_SALVAR_FOOTER}

    Wait Until Page Contains  Movimentação Cadastral »  timeout=${TIMEOUT}
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s


Validar Beneficiarios do Contrato Origem e Contrato Destino (10 Vidas)
    [Arguments]  @{arg1}
    # Pegar valores da table
    Repeat Keyword  3 times  Press Keys  None  END
    Sleep  3s
    Set Focus To Element   xpath://*[@id="subPanel"]/tbody//span/a[contains(., '${arg1[40]}')]

    ${nome_beneficiario1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  3    1
    Set Test Variables  ${nome_beneficiario1} 

    ${nome_beneficiario2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  4    1
    Set Test Variables  ${nome_beneficiario2} 

    ${nome_beneficiario3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  5    1
    Set Test Variables  ${nome_beneficiario3} 

    ${nome_beneficiario4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  6    1
    Set Test Variables  ${nome_beneficiario4} 

    ${nome_beneficiario5}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  7    1
    Set Test Variables  ${nome_beneficiario5} 

    ${nome_beneficiario6}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  8    1
    Set Test Variables  ${nome_beneficiario6} 

    ${nome_beneficiario7}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  9    1
    Set Test Variables  ${nome_beneficiario7} 

    ${nome_beneficiario8}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  10   1
    Set Test Variables  ${nome_beneficiario8}

    ${nome_beneficiario9}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  11    1
    Set Test Variables  ${nome_beneficiario9} 

    ${nome_beneficiario10}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  12   1
    Set Test Variables  ${nome_beneficiario10}


Validar Beneficiarios do Contrato Origem e Contrato Destino (2 Vidas)
    [Arguments]  @{arg1}
    # Pegar valores da table
    Repeat Keyword  3 times  Press Keys  None  END
    Sleep  3s
    Set Focus To Element   xpath://*[@id="subPanel"]/tbody//span/a[contains(., '${arg1[40]}')]

    ${nome_beneficiario1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  3    1
    Set Test Variables  ${nome_beneficiario1} 

    ${nome_beneficiario2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  4    1
    Set Test Variables  ${nome_beneficiario2}


Contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[40]}' or '${nome_beneficiario1}' == '${arg1[48]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[40]}' or '${nome_beneficiario2}' == '${arg1[48]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[40]}' or '${nome_beneficiario3}' == '${arg1[48]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[40]}' or '${nome_beneficiario4}' == '${arg1[48]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[40]}' or '${nome_beneficiario5}' == '${arg1[48]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[40]}' or '${nome_beneficiario6}' == '${arg1[48]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[40]}' or '${nome_beneficiario7}' == '${arg1[48]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[40]}' or '${nome_beneficiario8}' == '${arg1[48]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[40]}' or '${nome_beneficiario9}' == '${arg1[48]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  11
    Run Keyword If  '${nome_beneficiario10}' == '${arg1[40]}' or '${nome_beneficiario10}' == '${arg1[48]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  12


Contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO (Canal)
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[39]}' or '${nome_beneficiario1}' == '${arg1[47]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  5
    # Run Keyword If  '${nome_beneficiario2}' == '${arg1[39]}' or '${nome_beneficiario2}' == '${arg1[47]}'   Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  4


Validar contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO
    [Arguments]    ${i}
    ${nome_beneficiario_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  ${i}    1
    ${situacao}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  ${i}    4
    
    Should Be Equal  ${situacao}  cancelado
    Run Keyword If  '${situacao}' == 'cancelado'  Pass Execution  Status da Situação do Beneficiario: ${nome_beneficiario_tela} é igual a ${situacao}!
    Log  O Beneficiario ${nome_beneficiario_tela} possui Status da Situação igual a: ${situacao}.  INFO


Contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[56]}' or '${nome_beneficiario1}' == '${arg1[64]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[56]}' or '${nome_beneficiario2}' == '${arg1[64]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[56]}' or '${nome_beneficiario3}' == '${arg1[64]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[56]}' or '${nome_beneficiario4}' == '${arg1[64]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[56]}' or '${nome_beneficiario5}' == '${arg1[64]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[56]}' or '${nome_beneficiario6}' == '${arg1[64]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[56]}' or '${nome_beneficiario7}' == '${arg1[64]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[56]}' or '${nome_beneficiario8}' == '${arg1[64]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[56]}' or '${nome_beneficiario9}' == '${arg1[64]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  11
    Run Keyword If  '${nome_beneficiario10}' == '${arg1[56]}' or '${nome_beneficiario10}' == '${arg1[64]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  12

    Run Keyword If  '${nome_beneficiario1}' == '${arg1[72]}' or '${nome_beneficiario1}' == '${arg1[80]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[72]}' or '${nome_beneficiario2}' == '${arg1[08]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[72]}' or '${nome_beneficiario3}' == '${arg1[08]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[72]}' or '${nome_beneficiario4}' == '${arg1[80]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[72]}' or '${nome_beneficiario5}' == '${arg1[80]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[72]}' or '${nome_beneficiario6}' == '${arg1[80]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[72]}' or '${nome_beneficiario7}' == '${arg1[80]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[72]}' or '${nome_beneficiario8}' == '${arg1[80]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[72]}' or '${nome_beneficiario9}' == '${arg1[80]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  11
    Run Keyword If  '${nome_beneficiario10}' == '${arg1[72]}' or '${nome_beneficiario10}' == '${arg1[80]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  12

    Run Keyword If  '${nome_beneficiario1}' == '${arg1[88]}' or '${nome_beneficiario1}' == '${arg1[96]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[88]}' or '${nome_beneficiario2}' == '${arg1[96]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[88]}' or '${nome_beneficiario3}' == '${arg1[96]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[88]}' or '${nome_beneficiario4}' == '${arg1[96]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[88]}' or '${nome_beneficiario5}' == '${arg1[96]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[88]}' or '${nome_beneficiario6}' == '${arg1[96]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[88]}' or '${nome_beneficiario7}' == '${arg1[96]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[88]}' or '${nome_beneficiario8}' == '${arg1[96]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[88]}' or '${nome_beneficiario9}' == '${arg1[96]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  11
    Run Keyword If  '${nome_beneficiario10}' == '${arg1[88]}' or '${nome_beneficiario10}' == '${arg1[96]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  12

    Run Keyword If  '${nome_beneficiario1}' == '${arg1[104]}' or '${nome_beneficiario1}' == '${arg1[112]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[104]}' or '${nome_beneficiario2}' == '${arg1[112]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[104]}' or '${nome_beneficiario3}' == '${arg1[112]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[104]}' or '${nome_beneficiario4}' == '${arg1[112]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[104]}' or '${nome_beneficiario5}' == '${arg1[112]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[104]}' or '${nome_beneficiario6}' == '${arg1[112]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[104]}' or '${nome_beneficiario7}' == '${arg1[112]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[104]}' or '${nome_beneficiario8}' == '${arg1[112]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[104]}' or '${nome_beneficiario9}' == '${arg1[112]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  11
    Run Keyword If  '${nome_beneficiario10}' == '${arg1[104]}' or '${nome_beneficiario10}' == '${arg1[112]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  12

    Run Keyword If  '${nome_beneficiario1}' == '${arg1[120]}' or '${nome_beneficiario1}' == '${arg1[128]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[120]}' or '${nome_beneficiario2}' == '${arg1[128]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[120]}' or '${nome_beneficiario3}' == '${arg1[128]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[120]}' or '${nome_beneficiario4}' == '${arg1[128]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[120]}' or '${nome_beneficiario5}' == '${arg1[128]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[120]}' or '${nome_beneficiario6}' == '${arg1[128]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[120]}' or '${nome_beneficiario7}' == '${arg1[128]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[120]}' or '${nome_beneficiario8}' == '${arg1[128]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[120]}' or '${nome_beneficiario9}' == '${arg1[128]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  11
    Run Keyword If  '${nome_beneficiario10}' == '${arg1[120]}' or '${nome_beneficiario10}' == '${arg1[128]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  12


Contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO (Canal)
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[55]}' or '${nome_beneficiario1}' == '${arg1[63]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  5
    # Run Keyword If  '${nome_beneficiario2}' == '${arg1[55]}' or '${nome_beneficiario2}' == '${arg1[63]}'   Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  5


Validar contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO
    [Arguments]    ${i}
    ${nome_beneficiario_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  ${i}    1
    ${situacao}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  ${i}    4
    
    Should Be Equal  ${situacao}  ativo
    Run Keyword If  '${situacao}' == 'ativo'  Pass Execution  Status da Situação do Beneficiario: ${nome_beneficiario_tela} é igual a ${situacao}!
    Log  O Beneficiario ${nome_beneficiario_tela} possui Status da Situação igual a: ${situacao}.  INFO


Contrato Origem BENEFICIÁRIO transferidos não devem ser apresentados
    [Arguments]  @{arg1}
    Page Should Not Contain  ${arg1[40]}
    Page Should Not Contain  ${arg1[48]}
    Page Should Not Contain  ${arg1[56]}
    Page Should Not Contain  ${arg1[64]}
    Page Should Not Contain  ${arg1[72]}
    Page Should Not Contain  ${arg1[80]}
    Page Should Not Contain  ${arg1[88]}
    Page Should Not Contain  ${arg1[96]}
    Page Should Not Contain  ${arg1[104]}
    Page Should Not Contain  ${arg1[112]}


Gerar uma Movimentação Cadastral de Cancelamento de Contrato
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${SUBMENU_GERAR_MOV_CADASTRAL}
    Wait Until Page Contains   Gerar Movimentação Cadastral    timeout=${TIMEOUT}
    Wait Until Element Is Visible    ${TIPO_MOVIMENTACAO_CADASTRAL}    timeout=${TIMEOUT}
    Click Element  ${TIPO_MOVIMENTACAO_CADASTRAL}
    Click Element  ${TIPO_MOV_CANC_CONTRATO}
    #Select From List By Label  ${TIPO_MOVIMENTACAO_CADASTRAL}   Exclusão de Beneficiário
    Sleep  2s
    Set Focus To Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    Click Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    Wait Until Page Contains  Movimentação criada com sucesso.  timeout=${TIMEOUT}
    ${cod_mov_cadastral}  Get Text  xpath://*[@id="pagecontent"]/div[1]/h2
    Set Global Variable    ${cod_mov_cadastral}
    Wait Until Page Contains  ${cod_mov_cadastral}   timeout=${TIMEOUT}
    ${protocolo_mov_cadastral}  Get Text  xpath://*[@id="proto"]/a
    Set Test Variables   ${protocolo_mov_cadastral}


Contrato, campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO
    [Arguments]  ${arg1}
    Wait Until Page Contains  Contratos »   timeout=${TIMEOUT}
    ${v}  Run Keyword And Ignore Error  Wait Until Page Contains  Cancelado   timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Run Keyword If  "${v[0]}" == "FAIL"  Sleep  10s
    Run Keyword If  "${v[0]}" == "FAIL"  Reload Page
    Run Keyword If  "${v[0]}" == "FAIL"  Wait Until Page Contains  Cancelado   timeout=${TIMEOUT}
    ${data_exclusao_contrato}  Get Text  ${DATA_EXCLUSAO_CONTRATO}
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y 00:00
    Should Be Equal    ${date}    ${data_exclusao_contrato}
    Set Focus To Element   ${PAINEL_BENEFICIARIOS}
    Sleep  3s
    Set Focus To Element   xpath://*[@id="subPanel"]//tr[1]/td[contains(., 'Cancelado')]
    Set Focus To Element   xpath://*[@id="subPanel"]//tr[2]/td[contains(., 'Cancelado')]
    

Contrato, campo "Data de Exclusão" preenchido com a data informada, com a "situação" do Contrato igual a INTEGRADO e dos Beneficiários igual a ATIVO
    [Arguments]  ${arg1}
    Wait Until Page Contains  Contratos »   timeout=${TIMEOUT}
    Sleep  5s
    ${v}  Run Keyword And Ignore Error  Wait Until Page Contains  Integrado   timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Run Keyword If  "${v[0]}" == "FAIL"  Sleep  10s
    Run Keyword If  "${v[0]}" == "FAIL"  Reload Page
    Run Keyword If  "${v[0]}" == "FAIL"  Wait Until Page Contains  Integrado   timeout=${TIMEOUT}
    ${data_exclusao_contrato}  Get Text  ${DATA_EXCLUSAO_CONTRATO}
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     1 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y 00:00
    Should Be Equal    ${date}    ${data_exclusao_contrato}
    Set Focus To Element   ${PAINEL_BENEFICIARIOS}
    Sleep  3s
    Set Focus To Element   xpath://*[@id="subPanel"]//tr[1]/td[contains(., 'Ativo')]
    Set Focus To Element   xpath://*[@id="subPanel"]//tr[2]/td[contains(., 'Ativo')]
 

Consulta por Codigo Contrato se a Conta, Contrato e Beneficiários estão excluidos
    [Arguments]  @{arg1}
    # ----- Aba Beneficiarios -----
    Sleep  3s
    Repeat Keyword  3 times  Press Keys  None  END
    Set Focus To Element   ${PAINEL_BENEFICIARIOS}
    ${elementos}  Get WebElements  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[11]/span/span
    @{list_info_titular}  Create List
    FOR  ${t}  IN  @{elementos}
        ${informacoes}  Salvar dados Beneficiario Titular - Cancelamento Contrato
        Append To List  ${list_info_titular}  ${informacoes}
        ${result_beneficiario}  Query - Validar exclusão de contrato  ${arg1}
        Log  ${result_beneficiario}
        Log  ${list_info_titular}
        Set Test Variables  @{list_info_titular}
        ${result}  Run Keyword  Validar Linhas - Cancelamento Contrato  ${list_info_titular}  ${result_beneficiario}
    END

    ${elementos}  Get WebElements  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Cônjuge') or contains(text(), 'Filhos(as)')]/../../../td[11]/span/span
    @{list_info_dependente}  Create List
    FOR  ${t}  IN  @{elementos}
        ${informacoes}  Salvar dados Beneficiario Dependente - Cancelamento Contrato
        Append To List  ${list_info_dependente}  ${informacoes}
        ${result_beneficiario}  Query - Validar exclusão de contrato  ${arg1}
        Log  ${result_beneficiario}
        Log  ${list_info_dependente}
        Set Test Variables  @{list_info_dependente}
        ${result}  Run Keyword  Validar Linhas - Cancelamento Contrato  ${list_info_dependente}  ${result_beneficiario}
    END


Salvar dados Beneficiario Titular - Cancelamento Contrato
    @{LISTA_TEMP_TITULAR}    Create List
    Set Focus To Element  ${PAINEL_BENEFICIARIOS}
    ${nome_benef}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[1]/span/a
    Append To List       ${LISTA_TEMP_TITULAR}    ${nome_benef}
    Set Test Variables   ${nome_benef}
    ${situacao_benef_titular}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[6]/span
    Append To List       ${LISTA_TEMP_TITULAR}    ${situacao_benef_titular}
    ${cod_fam_benef}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Titular')]/../../../td[12]/span
    Append To List       ${LISTA_TEMP_TITULAR}    ${cod_fam_benef}
    Set Test Variables   ${cod_fam_benef}

    Set Focus To Element  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]//span[contains(., '${nome_benef}')]/a
    Click Element  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]//span[contains(., '${nome_benef}')]/a
    Wait Until Page Contains  Beneficiários » ${nome_benef}

    Set Focus To Element   ${SITUACAO_BENEFICIARIO}
    ${situacao_benef}  Get Value  ${SITUACAO_BENEFICIARIO}
    Append To List       ${LISTA_TEMP_TITULAR}    ${situacao_benef}
    
    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'ativo'  Get Text  ${DATA_EXCLUSAO_BENEFICIARIO}
    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'ativo'  Convert Date       ${data_exclusao_benef}     date_format=%d/%m/%Y %H:%M     result_format=%Y-%m-%d %H:%M:%S
    Run Keyword If  '${situacao_benef}' == 'cancelado'  Append To List       ${LISTA_TEMP_TITULAR}    ${data_exclusao_benef}

    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'cancelado'  Get Text  ${DATA_EXCLUSAO_BENEFICIARIO}
    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'cancelado'  Convert Date       ${data_exclusao_benef}     date_format=%d/%m/%Y %H:%M     result_format=%Y-%m-%d %H:%M:%S
    Run Keyword If  '${situacao_benef}' == 'cancelado'  Append To List       ${LISTA_TEMP_TITULAR}    ${data_exclusao_benef}

    Go Back
    #Execute Javascript  history.back()
    Log Many  @{LISTA_TEMP_TITULAR}
    RETURN    @{LISTA_TEMP_TITULAR}


Salvar dados Beneficiario Dependente - Cancelamento Contrato
    @{LISTA_TEMP_DEPENDENTE}    Create List
    Set Focus To Element  ${PAINEL_BENEFICIARIOS}
    ${nome_benef}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Cônjuge') or contains(text(), 'Filhos(as)')]/../../../td[1]/span/a
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${nome_benef}
    Set Test Variables   ${nome_benef}
    ${situacao_benef_dependente}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Cônjuge') or contains(text(), 'Filhos(as)')]/../../../td[6]/span
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${situacao_benef_dependente}
    ${cod_fam_benef}  Get Text  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts']/table//span[contains(text(), 'Cônjuge') or contains(text(), 'Filhos(as)')]/../../../td[12]/span
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${cod_fam_benef}
    Set Test Variables   ${cod_fam_benef}
    
    Set Focus To Element  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]//span[contains(., '${nome_benef}')]/a
    Click Element  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]//span[contains(., '${nome_benef}')]/a
    Wait Until Page Contains  Beneficiários » ${nome_benef}

    Set Focus To Element   ${SITUACAO_BENEFICIARIO}
    ${situacao_benef}  Get Value  ${SITUACAO_BENEFICIARIO}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${situacao_benef}
    
    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'ativo'  Get Text  ${DATA_EXCLUSAO_BENEFICIARIO}
    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'ativo'  Convert Date       ${data_exclusao_benef}     date_format=%d/%m/%Y %H:%M     result_format=%Y-%m-%d %H:%M:%S
    Run Keyword If  '${situacao_benef}' == 'cancelado'  Append To List       ${LISTA_TEMP_DEPENDENTE}    ${data_exclusao_benef}

    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'cancelado'  Get Text  ${DATA_EXCLUSAO_BENEFICIARIO}
    ${data_exclusao_benef}  Run Keyword If  '${situacao_benef}' == 'cancelado'  Convert Date       ${data_exclusao_benef}     date_format=%d/%m/%Y %H:%M     result_format=%Y-%m-%d %H:%M:%S
    Run Keyword If  '${situacao_benef}' == 'cancelado'  Append To List       ${LISTA_TEMP_DEPENDENTE}    ${data_exclusao_benef}
    
    Go Back
    #Execute Javascript  history.back()
    Log Many  @{LISTA_TEMP_DEPENDENTE}
    RETURN    @{LISTA_TEMP_DEPENDENTE}



Validar Linhas - Cancelamento Contrato
    [Arguments]  ${lista_final}  ${lista_banco}
    FOR  ${benef}  IN  @{lista_final}
        Validar Linha - Cancelamento Contrato  ${benef}  ${lista_banco}
    END

Validar Linha - Cancelamento Contrato
    [Arguments]  ${lista_final}  ${lista_banco}
    FOR  ${i}  IN  @{lista_banco}
        # DT_EXC_CONTA, DT_EXC_CONTRATO, USS_NOME, DT_EXC_BENEFICIARIO
        ${db_dep_codigo}    Set Variables   ${i[0]}
        ${db_grau_dep}      Set Variables   ${i[1]}
        ${db_fam_codigo}    Set Variables   ${i[2]}
        ${db_cnp}           Set Variables   ${i[3]}
        ${db_uss_completo}  Set Variables   ${i[4]}
        ${db_dt_exclusao}   Set Variables   ${i[5]}
        ${db_dt_exclusao}   Convert To String  ${db_dt_exclusao}

        ${tl_situacao_benef}  Set Variables      ${lista_final[3]}
        ${tl_fam_codigo}      Set Variables      ${lista_final[2]}
        ${tl_fam_codigo}      Convert To Integer  ${tl_fam_codigo}
        ${tl_uss_completo}    Set Variables      ${lista_final[0]}
        ${tl_dt_exclusao}     Run Keyword If  '${tl_situacao_benef}' == 'cancelado'  Set Variables  ${lista_final[4]}
  
        Should Be Equal  ${tl_fam_codigo}    ${db_fam_codigo}    
        Should Be Equal  ${tl_uss_completo}  ${db_uss_completo}
        Run Keyword If  '${tl_situacao_benef}' == 'cancelado'   Should Be Equal  ${tl_dt_exclusao}   ${db_dt_exclusao}

        Log Many  @{lista_final}
        Log Many  @{lista_banco}
        Set Global Variable  @{lista_final}  ${EMPTY}
        Set Global Variable  @{lista_banco}  ${EMPTY}
    END


Gerar uma Movimentação Cadastral de Inclusão de Beneficiários
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${SUBMENU_GERAR_MOV_CADASTRAL}
    Wait Until Page Contains   Gerar Movimentação Cadastral    timeout=${TIMEOUT}
    Wait Until Element Is Visible    ${TIPO_MOVIMENTACAO_CADASTRAL}    timeout=${TIMEOUT}
    Set Focus To Element  ${TIPO_MOVIMENTACAO_CADASTRAL}
    Sleep  3s
    Select From List By Label  ${TIPO_MOVIMENTACAO_CADASTRAL}   Inclusão de Beneficiário
    Sleep  3s
    Click Element  ${LABEL_VENDEDOR_INC_BENEF}
    Set Focus To Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    Click Element  ${BOTAO_CRIAR_MOV_CADASTRAL}
    Wait Until Page Contains  Movimentação criada com sucesso.  timeout=${TIMEOUT}
    ${cod_mov_cadastral}  Get Text  xpath://*[@id="pagecontent"]/div[1]/h2
    Set Global Variable    ${cod_mov_cadastral}
    Wait Until Page Contains  ${cod_mov_cadastral}   timeout=${TIMEOUT}
    ${protocolo_mov_cadastral}  Get Text  xpath://*[@id="proto"]/a
    Set Test Variables   ${protocolo_mov_cadastral}


Importar arquivo - Inclusão Beneficiario
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Sleep  3s
    Set Focus To Element  ${IMPORTAR_ARQUIVO_MOV_CADASTRAL}
    Click Element  ${IMPORTAR_ARQUIVO_MOV_CADASTRAL}
    Wait Until Page Contains  Importação » Criar   timeout=${TIMEOUT}


Importar segundo arquivo - Inclusão Beneficiario
    Sleep  3s
    Wait Until Page Contains  Importação » Criar   timeout=${TIMEOUT}


Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 3 Vidas - Inclusão Beneficiario)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_3vidas.csv
    Log To Console  ${lines}

    ${titular1}  Create List   ${arg1[56]}  ${arg1[55]}  ${arg1[59]}  ${arg1[61]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}
    ${dependente1}  Create List   ${arg1[64]}  ${arg1[63]}  ${arg1[55]}  ${arg1[67]}  ${arg1[69]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}
    ${dependente2}  Create List   ${arg1[48]}  ${arg1[47]}  ${arg1[55]}  ${arg1[51]}  ${arg1[53]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_ATUAL}

    ${slots_titular}  Create List   0  1  8  14  30  31  48
    ${slots_dependente}  Create List   0  1  5  8  14  30  31  47  48


    Edit Line  0  ${titular1}   ${slots_titular}
    Edit Line  1  ${dependente1}   ${slots_dependente}
    Edit Line  2  ${dependente2}   ${slots_dependente}

    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_3vidas.csv

    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_mov_cadastral_3vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_mov_cadastral_3vidas    timeout=${TIMEOUT}


Clicar no Link "Movimentação Cadastral"
    Set Focus To Element  xpath://*[@id="relacionamentos_span"]/table/tbody/tr/td[2]/a
    Click Link  xpath://*[@id="relacionamentos_span"]/table/tbody/tr/td[2]/a
    Wait Until Page Contains    Movimentação Cadastral »     timeout=${TIMEOUT}
    

No Contrato BENEFICIÁRIO incluidos (Importação - 3 Vidas)
    [Arguments]    @{arg1}
    # ----- Aba Beneficiarios -----
    Sleep  3s
    Repeat Keyword  3 times  Press Keys  None  END
    Set Focus To Element   ${PAINEL_BENEFICIARIOS}
    Page Should Contain  ${arg1[56]}
    Page Should Contain  ${arg1[64]}
    Page Should Contain  ${arg1[48]}


No Contrato BENEFICIÁRIO incluidos (Importação - 10 Vidas)
    [Arguments]    @{arg1}
    # ----- Aba Beneficiarios -----
    Sleep  3s
    Repeat Keyword  3 times  Press Keys  None  END
    Set Focus To Element   ${PAINEL_BENEFICIARIOS}
    Page Should Contain  ${arg1[40]}
    Page Should Contain  ${arg1[48]}
    Page Should Contain  ${arg1[56]}
    Page Should Contain  ${arg1[64]}
    Page Should Contain  ${arg1[72]}
    Page Should Contain  ${arg1[80]}
    Page Should Contain  ${arg1[88]}
    Page Should Contain  ${arg1[96]}
    Page Should Contain  ${arg1[104]}
    Page Should Contain  ${arg1[112]}


Cadastrar 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     1 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_4vidas.csv
    Log To Console  ${lines}

    ${titular1}  Create List   ${arg1[1]}  ${arg1[39]}  ${arg1[43]}  ${arg1[45]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_INICIO_VIGENCIA}

    ${slots_titular}  Create List   0  1  8  14  30  31  48

    Edit Line  0  ${titular1}   ${slots_titular}


Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     31 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=01/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente1}  Create List   ${arg1[48]}  ${arg1[47]}  01  ${arg1[39]}  ${arg1[51]}  ${arg1[52]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  1  ${dependente1}   ${slots_dependente}


Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     3 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente2}  Create List   ${arg1[56]}  ${arg1[55]}  10  ${arg1[39]}  ${arg1[59]}  ${arg1[61]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  2  ${dependente2}   ${slots_dependente}


Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     9 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente3}  Create List   ${arg1[64]}  ${arg1[63]}  70  ${arg1[39]}  ${arg1[67]}  ${arg1[69]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48
    
    Edit Line  3  ${dependente3}   ${slots_dependente}

    
Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM)
    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_4vidas.csv
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_4vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_inclusao_benef_4vidas    timeout=${TIMEOUT}


Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM - COLETIVO POR ADESÃO)
    ${titular1}  Create List   5051
    ${dependente1}  Create List   5051
    ${dependente2}  Create List   5051
    ${dependente3}  Create List   5051

    ${slots_titular}  Create List   31
    ${slots_dependente}  Create List   31
    
    Edit Line  0  ${titular1}   ${slots_titular}
    Edit Line  1  ${dependente1}   ${slots_dependente}
    Edit Line  2  ${dependente2}   ${slots_dependente}
    Edit Line  3  ${dependente3}   ${slots_dependente}

    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_4vidas.csv
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_4vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_inclusao_benef_4vidas    timeout=${TIMEOUT}


No Contrato BENEFICIÁRIO incluidos (Importação - 4 Vidas)
    [Arguments]    @{arg1}
    # ----- Aba Beneficiarios -----
    Sleep  3s
    Repeat Keyword  3 times  Press Keys  None  END
    Set Focus To Element   ${PAINEL_BENEFICIARIOS}
    Page Should Contain  ${arg1[1]}
    Page Should Contain  ${arg1[48]}
    Page Should Contain  ${arg1[56]}
    Page Should Contain  ${arg1[64]}


No Contrato BENEFICIÁRIO incluidos (Importação - 9 Vidas)
    [Arguments]    @{arg1}
    # ----- Aba Beneficiarios -----
    Sleep  3s
    Repeat Keyword  3 times  Press Keys  None  END
    Set Focus To Element   ${PAINEL_BENEFICIARIOS}
    Page Should Contain  ${arg1[1]}
    Page Should Contain  ${arg1[47]}
    Page Should Contain  ${arg1[55]}
    Page Should Contain  ${arg1[63]}
    Page Should Contain  ${arg1[71]}
    Page Should Contain  ${arg1[79]}
    Page Should Contain  ${arg1[87]}
    Page Should Contain  ${arg1[95]}
    Page Should Contain  ${arg1[103]}


No Contrato BENEFICIÁRIO incluidos (Importação - 8 Vidas)
    [Arguments]    @{arg1}
    # ----- Aba Beneficiarios -----
    Sleep  3s
    Repeat Keyword  3 times  Press Keys  None  END
    Set Focus To Element   ${PAINEL_BENEFICIARIOS}
    Page Should Contain  ${arg1[48]}
    Page Should Contain  ${arg1[56]}
    Page Should Contain  ${arg1[64]}
    Page Should Contain  ${arg1[72]}
    Page Should Contain  ${arg1[80]}
    Page Should Contain  ${arg1[88]}
    Page Should Contain  ${arg1[96]}
    Page Should Contain  ${arg1[104]}


No Contrato BENEFICIÁRIO incluidos (Importação Portabilidade - 4 Vidas)
    [Arguments]    @{arg1}
    # ----- Aba Beneficiarios -----
    Sleep  3s
    Repeat Keyword  3 times  Press Keys  None  END
    Set Focus To Element   ${PAINEL_BENEFICIARIOS}
    Page Should Contain  ${arg1[1]}
    Page Should Contain  ${arg1[48]}
    Page Should Contain  ${arg1[56]}
    Page Should Contain  ${arg1[64]}


Cadastrar 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     1 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_4vidas.csv
    Log To Console  ${lines}

    ${titular1}  Create List   ${arg1[1]}  ${arg1[39]}  ${arg1[43]}  ${arg1[45]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_INICIO_VIGENCIA}

    ${slots_titular}  Create List   0  1  8  14  30  31  48

    Edit Line  0  ${titular1}   ${slots_titular}


Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     31 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=01/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente1}  Create List   ${arg1[47]}  ${arg1[46]}  01  ${arg1[38]}  ${arg1[50]}  ${arg1[52]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  1  ${dependente1}   ${slots_dependente}


Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     3 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente2}  Create List   ${arg1[56]}  ${arg1[55]}  10  ${arg1[39]}  ${arg1[59]}  ${arg1[61]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  2  ${dependente2}   ${slots_dependente}


Cadastrar 1 (UM) Beneficiário TITULAR, sem Portabilidade, com "Início vigência" igual a EM 24 HORAS
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     1 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_4vidas.csv
    Log To Console  ${lines}

    ${titular1}  Create List   ${arg1[1]}  ${arg1[38]}  ${arg1[42]}  ${arg1[44]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_INICIO_VIGENCIA}

    ${slots_titular}  Create List   0  1  8  14  30  31  48

    Edit Line  0  ${titular1}   ${slots_titular}


Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, sem Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     31 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=01/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente1}  Create List   ${arg1[47]}  ${arg1[46]}  01  ${arg1[38]}  ${arg1[50]}  ${arg1[52]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  1  ${dependente1}   ${slots_dependente}



Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     9 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente3}  Create List   ${arg1[64]}  ${arg1[63]}  70  ${arg1[39]}  ${arg1[67]}  ${arg1[69]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  3  ${dependente3}   ${slots_dependente}


Editar o Contrato, desmarcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    Set Focus To Element    ${BTN_EDITAR}
    Click Element  ${BTN_EDITAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}
    Set Focus To Element    ${COLUNA_PARAM_APLIC_CARENCIA_DIAS}
    ${c}  Run Keyword And Ignore Error   Checkbox Should Be Selected  ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Run Keyword If  "${c[0]}" == "PASS"    Set Focus To Element    ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Run Keyword If  "${c[0]}" == "PASS"    Click Element   ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Sleep  5s
    Set Focus To Element   ${BOTAO_SALVAR}
    Click Element   ${BOTAO_SALVAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}

Editar o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    Set Focus To Element    ${BTN_EDITAR}
    Click Element  ${BTN_EDITAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}
    Set Focus To Element    ${COLUNA_PARAM_APLIC_CARENCIA_DIAS}
    ${c}  Run Keyword And Ignore Error   Checkbox Should Be Selected  ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Run Keyword If  "${c[0]}" == "FAIL"    Set Focus To Element    ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Run Keyword If  "${c[0]}" == "FAIL"    Click Element   ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Sleep  5s
    Set Focus To Element   ${BOTAO_SALVAR}
    Click Element   ${BOTAO_SALVAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}

Editou Contrato, com campo "Beneficiários - Inclusões sem carência" igual a SIM
    Set Focus To Element    ${BTN_EDITAR}
    Click Element  ${BTN_EDITAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}
    Set Focus To Element    ${LABEL_BENEFICIARIOS_INCLUSAO_SEM_CARENCIA}
    Select From List By Label  ${SELECT_BENEFICIARIOS_INCLUSAO_SEM_CARENCIA}  Sim
    Sleep  5s
    Set Focus To Element   ${BOTAO_SALVAR}
    Click Element   ${BOTAO_SALVAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}


Editou Contrato, com campo "Beneficiários - Inclusões sem carência" diferente de SIM
    Set Focus To Element    ${BTN_EDITAR}
    Click Element  ${BTN_EDITAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}
    Set Focus To Element    ${LABEL_BENEFICIARIOS_INCLUSAO_SEM_CARENCIA}
    Select From List By Label  ${SELECT_BENEFICIARIOS_INCLUSAO_SEM_CARENCIA}  Não
    Sleep  5s
    Set Focus To Element   ${BOTAO_SALVAR}
    Click Element   ${BOTAO_SALVAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}


Cadastrar 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS (Primeira Familia)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    IF    $arg1[6] == ''
        ${PROD_ASSIST}    Split String    ${arg1[7]}

    ELSE
        ${PROD_ASSIST}    Split String    ${arg1[6]}
        
    END
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     1 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_6vidas.csv
    Log To Console  ${lines}

    ${titular1}  Create List   ${arg1[1]}  ${arg1[39]}  ${arg1[43]}  ${arg1[45]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_INICIO_VIGENCIA}

    ${slots_titular}  Create List   0  1  8  14  30  31  48

    Edit Line  0  ${titular1}   ${slots_titular}


Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Primeira Familia)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}

    ${PROD_ASSIST}    Split String    ${arg1[6]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     31 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=01/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente1}  Create List   ${arg1[47]}  ${arg1[46]}  01  ${arg1[38]}  ${arg1[50]}  ${arg1[52]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  1  ${dependente1}   ${slots_dependente}


Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS (Primeira Familia)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    IF    $arg1[6] == ''
        ${PROD_ASSIST}    Split String    ${arg1[7]}
    ELSE
        ${PROD_ASSIST}    Split String    ${arg1[6]}
        
    END
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     3 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente2}  Create List   ${arg1[56]}  ${arg1[55]}  10  ${arg1[39]}  ${arg1[59]}  ${arg1[60]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  2  ${dependente2}   ${slots_dependente}


Cadastrar 1 (UM) Beneficiário TITULAR, sem Portabilidade, com "Início vigência" igual a EM 24 HORAS (Segunda Familia)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}

    ${PROD_ASSIST}    Split String    ${arg1[6]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     1 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_4vidas.csv
    Log To Console  ${lines}

    ${titular1}  Create List   ${arg1[71]}  ${arg1[70]}  ${arg1[74]}  ${arg1[76]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_INICIO_VIGENCIA}

    ${slots_titular}  Create List   0  1  8  14  30  31  48

    Edit Line  0  ${titular1}   ${slots_titular}


Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, sem Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Segunda Familia)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    IF    $arg1[6] == ''
        ${PROD_ASSIST}    Split String    ${arg1[7]}
    ELSE
        ${PROD_ASSIST}    Split String    ${arg1[6]}
        
    END
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     31 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=01/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente1}  Create List   ${arg1[80]}  ${arg1[79]}  01  ${arg1[71]}  ${arg1[83]}  ${arg1[85]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  1  ${dependente1}   ${slots_dependente}


Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS (Segunda Familia)
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}

    ${PROD_ASSIST}    Split String    ${arg1[6]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  ${PROD_ASSIST[0]}
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Add Time To Date   ${DATA_INICIO_VIGENCIA}     9 days
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente3}  Create List   ${arg1[63]}  ${arg1[62]}  70  ${arg1[70]}  ${arg1[66]}  ${arg1[68]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  3  ${dependente3}   ${slots_dependente}


Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM - Segunda Familia)
    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_6vidas.csv
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_6vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_inclusao_benef_6vidas    timeout=${TIMEOUT}


Editar o Contrato, com campo "Beneficiários - Inclusões sem carência" VAZIO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
    Set Focus To Element    ${BTN_EDITAR}
    Click Element  ${BTN_EDITAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}
    Set Focus To Element    ${LABEL_BENEFICIARIOS_INCLUSAO_SEM_CARENCIA}
    Select From List By Label  ${SELECT_BENEFICIARIOS_INCLUSAO_SEM_CARENCIA}  ${empty}
    Sleep  3s
    Set Focus To Element    ${COLUNA_PARAM_APLIC_CARENCIA_DIAS}
    Click Element   ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    ${c}  Run Keyword And Ignore Error   Checkbox Should Be Selected  ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Run Keyword If  "${c[0]}" == "FAIL"    Set Focus To Element    ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Run Keyword If  "${c[0]}" == "FAIL"    Click Element   ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Sleep  5s
    Set Focus To Element    ${INPUT_DIAS_CARENCIA_TITULAR}
    Input Text    ${INPUT_DIAS_CARENCIA_TITULAR}  10
    Set Focus To Element    ${INPUT_DIAS_CARENCIA_CONJUGE}
    Input Text    ${INPUT_DIAS_CARENCIA_CONJUGE}  20
    Set Focus To Element    ${INPUT_DIAS_CARENCIA_FILHO}
    Input Text    ${INPUT_DIAS_CARENCIA_FILHO}  20
    Set Focus To Element    ${INPUT_DIAS_CARENCIA_FILHO_ADOTIVO}
    Input Text    ${INPUT_DIAS_CARENCIA_FILHO_ADOTIVO}  20
    Set Focus To Element   ${BOTAO_SALVAR}
    Click Element   ${BOTAO_SALVAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}


Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM - 9 Vidas)
    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_9vidas.csv
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_9vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_inclusao_benef_9vidas    timeout=${TIMEOUT}


Editar o Contrato, com campo "Beneficiários - Inclusões sem carência" igual a NÃO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
    Set Focus To Element    ${BTN_EDITAR}
    Click Element  ${BTN_EDITAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}
    Set Focus To Element    ${LABEL_BENEFICIARIOS_INCLUSAO_SEM_CARENCIA}
    Select From List By Label  ${SELECT_BENEFICIARIOS_INCLUSAO_SEM_CARENCIA}  Não
    Sleep  3s
    Set Focus To Element    ${COLUNA_PARAM_APLIC_CARENCIA_DIAS}
    Click Element   ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    ${c}  Run Keyword And Ignore Error   Checkbox Should Be Selected  ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Run Keyword If  "${c[0]}" == "FAIL"    Set Focus To Element    ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Run Keyword If  "${c[0]}" == "FAIL"    Click Element   ${CHECKBOX_PARAM_APLIC_CARENCIA_DIAS}
    Sleep  5s
    Set Focus To Element    ${INPUT_DIAS_CARENCIA_TITULAR}
    Input Text    ${INPUT_DIAS_CARENCIA_TITULAR}  10
    Set Focus To Element    ${INPUT_DIAS_CARENCIA_CONJUGE}
    Input Text    ${INPUT_DIAS_CARENCIA_CONJUGE}  20
    Set Focus To Element    ${INPUT_DIAS_CARENCIA_FILHO}
    Input Text    ${INPUT_DIAS_CARENCIA_FILHO}  20
    Set Focus To Element    ${INPUT_DIAS_CARENCIA_FILHO_ADOTIVO}
    Input Text    ${INPUT_DIAS_CARENCIA_FILHO_ADOTIVO}  20
    Set Focus To Element   ${BOTAO_SALVAR}
    Click Element   ${BOTAO_SALVAR}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    Wait Until Page Contains    Contratos »   timeout=${TIMEOUT}


Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM - 3 Vidas)
    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_3vidas.csv
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_3vidas.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_inclusao_benef_3vidas    timeout=${TIMEOUT}


Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM - 8 Dependentes)
    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_8dependentes.csv
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_8dependentes.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_inclusao_benef_8dependentes    timeout=${TIMEOUT}


Selecionou automaticamente campo "Necessita Validar Declaração de Saúde?"
    Checkbox Should Be Selected  ${CHECKBOX_VALIDAR_DECLARACAO_SAUDE}

Não Selecionou automaticamente campo "Necessita Validar Declaração de Saúde?"
    Checkbox Should Not Be Selected  ${CHECKBOX_VALIDAR_DECLARACAO_SAUDE}

Clicar no link "Cotação"
    Set Focus To Element  ${LINK_COTACAO}
    Click Element  ${LINK_COTACAO}
    