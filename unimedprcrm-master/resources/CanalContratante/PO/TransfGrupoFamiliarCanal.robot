*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary
Library    String



*** Variables ***
${EDIT_BUTTON}  id:edit_button
${CHECKBOX_TRANSFERENCIA}  xpath://*[@id="_funcoes_permitidas5"][contains(@Value,mov_transferencia)]
${SAVE_FOOTER_BUTTON}  id:SAVE_FOOTER
${NOME_REGISTRO} =  id:nome
${TIPO_MOVIMENTACAO} =  id:tipo_movimentacao
${OPTION_VALUE_TRANSFERENCIA} =  xpath://*[@id="tipo_movimentacao"]/option[3][contains(.,'Transferência de Grupo Familiar')]
${BTN_SALVAR_MOVIMENTACAO} =  xpath://*[@id="form_criar_movimentacao"]/div/div[3]/input
${PAINEL_BENEFICIARIO} =  xpath://*[@id="table_list_transf_benef"]//td[contains(.,'Nenhum registro encontrado')]
${BTN_PESQUISAR_BENEFICIARIO} =  xpath://*[@id="modal_beneficiarios"]//input[contains(@Value,'PESQUISAR')]
${MENSAGEM_LICALIZAR_BENEFICIARIO} =  xpath://*[@id="table_list_beneficiarios"]//td[contains(.,'Não foram localizados Beneficiários para os parâmetros informados na pesquisa.')]
${BTN_ADICIONAR_BENEFICIARIO} =  xpath://div[1]//input[contains(@Value,'+ Adicionar Beneficiários')]
${CONTA_NOME} =  id:conta_nome
${CONTRATO_NUMERO} =  id:contrato_numero
${VALIDAR TITULAR} =  xpath://*[@id="table_list_beneficiarios"]/tbody
${BTN_SELECT} =  xpath://*[@id="modal_beneficiarios"]/div/div/div[3]/button[1][contains(.,"Selecionar")]
${TITULAR_VINCULADO} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table/tbody/tr[3]/td[3]
${TITULAR_VINCULADO_2} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table[2]/tbody/tr[3]/td[3]
${TAB_CONTRATO} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table/tbody/tr[3]
${TAB_CONTRATO_2} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table[2]/tbody/tr[3]
${ASSISTENCIAL} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table/tbody/tr[3]/td[7]/select
${ACESSORIO} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table/tbody/tr[3]/td[8]/select
${ASSISTENCIAL_2} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table[2]/tbody/tr[3]/td[7]/select
${ACESSORIO_2} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table[2]/tbody/tr[3]/td[8]/select
${PESQUISA_CONTRATO} =  xpath:/html/body/div[1]/div/section[2]/div[6]/div/div/div[2]/div/div/div[2]/div/table/tbody/tr
${CONTRATO_DESTIONO} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table/tbody/tr[3]/td[2]/div/span
${CONTRATO_DESTIONO_2} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table[2]/tbody/tr[3]/td[2]/div/span
@{LIST}  _empty_  em_24_horas  1_dia_mes_seguinte  ultimo_dia_mes  especificar_data
@{LIST_ASS}   _empty_  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
${ACESSORIO_VAZIO} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table/tbody/tr[3]/td[8]/select
${TRANSF_SALVAR} =  xpath:/html/body/div[1]/div/section[2]/div[4]/input[contains(@Value,"Salvar")]
@{LIST_ASS_2}   _empty_  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF   5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
${ACESSORIO_VAZIO_2} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table[2]/tbody/tr[3]/td[8]/select
${BTN_ACAO_MOVIMENTACAO} =  xpath:/html/body/div[1]/div/section[2]/div[1]/div[2]/div/div[2]/div/button[1]
${BTN_MOVIMENTACAO_CADASTRAL} =  xpath:/html/body/div[1]/div/section[2]/div[1]/div[2]/div/div[2]/div/ul/li[3]/a
${MENSAGEM_APROVACAO} =  xpath:/html/body/div[1]/div/section[2]/div[1]
${REGISTRO_BENEF} =  xpath://*[@id="table_list_transf_benef"]/tbody/tr[1]
${QTD_REGISTRO} =  xpath://*[@id="table_list_movimentacoes_wrapper"]/div[3]/div[1]
${SITUACAO_MOV} =  xpath:/html/body/div[1]/div/section[2]/div[4]/div[2]/div/div/div[2]/div/table/tbody/tr[1]/td[3]/span
${TRANSFERENCIA_DISABLED} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table/tbody/tr[3]/td[4]/select
${DADOS_PADRAO} =  xpath://*[@id="form_dados_padrao"]/table/tbody/tr[2]/td[3]/div/span
${CHECKBOX_CONTRATO_ORIGEM} =  xpath:/html/body/div[1]/div/section[2]/form[2]/div/table/tbody/tr[2]/td[1]/input
${BUTTON_BACK} =  class:voltar
${BUTTON_SEARCH} =  xpath://*[@id="form-contrato"]/div/div[3]/input[1]

*** Keywords ***
Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"
    Wait Until Page Contains  Usuários Canal do Contratante » kautomatico  timeout=${TIMEOUT}
    Mouse Up    ${EDIT_BUTTON}
    Set Focus To Element  ${EDIT_BUTTON}
    Click Element    ${EDIT_BUTTON}
    Page Should Contain  Funções Permitidas:

    ${c}  Run Keyword And Ignore Error   Checkbox Should Be Selected  ${CHECKBOX_TRANSFERENCIA}
    Run Keyword If  "${c[0]}" == "PASS"   Set Focus To Element  ${SAVE_FOOTER_BUTTON}
    Run Keyword If  "${c[0]}" == "PASS"   Click Element  ${SAVE_FOOTER_BUTTON}
    Run Keyword If  "${c[0]}" == "FAIL"   Click Element  ${CHECKBOX_TRANSFERENCIA}
    Run Keyword If  "${c[0]}" == "FAIL"   Click Element  ${SAVE_FOOTER_BUTTON}
 
Preencheu o campo "Nome", selecionou no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicou no botão "SALVAR"
    [Arguments]    ${arg1}
    Wait Until Page Contains  Nova Solicitação de Movimentação Cadastral em Massa  timeout=${TIMEOUT}
    ${nome_mov}  Catenate  MOV  ${arg1}
    Input Text  ${NOME_REGISTRO}  ${nome_mov}
    Set Focus To Element  ${TIPO_MOVIMENTACAO}
    Click Element  ${TIPO_MOVIMENTACAO}
    Set Focus To Element  ${OPTION_VALUE_TRANSFERENCIA}
    Click Element  ${OPTION_VALUE_TRANSFERENCIA}
    Click Element  ${BTN_SALVAR_MOVIMENTACAO}

Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    [Arguments]    ${arg1}
    Wait Until Page Contains  Movimentação em Massa - MOV ${arg1}  timeout=${TIMEOUT}
    Page Should Contain   Pendente
    ${PAINEL_BENEFICIARIO}  Get Text  ${PAINEL_BENEFICIARIO}
    Should Be Equal  ${PAINEL_BENEFICIARIO}  Nenhum registro encontrado

Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO"
    Wait Until Page Contains  Movimentação em Massa  timeout=${TIMEOUT}
    Page Should Contain Element  ${BTN_ADICIONAR_BENEFICIARIO}

Clicou botão "+ ADICIONAR BENEFICIÁRIOS"
    Set Focus To Element  ${BTN_ADICIONAR_BENEFICIARIO}
    Click Element  ${BTN_ADICIONAR_BENEFICIARIO}

Validou a apresentação da modal "Pesquisa Beneficiários"
    Wait Until Page Contains  Pesquisa Beneficiários  timeout=${TIMEOUT}

Preencher o campo "Nome / Razão Social" do Contrato PF
    [Arguments]    ${arg1}
    Input Text  ${CONTA_NOME}  ${arg1}

Clicar no botão "PESQUISAR"
    Set Focus To Element  ${BTN_PESQUISAR_BENEFICIARIO}
    Click Element  ${BTN_PESQUISAR_BENEFICIARIO}

O Canal do Contratante deve apresentar a mensagem "Não foram localizados Beneficiários para os parâmetros informados na pesquisa."
    Sleep  5s
    ${MENSAGEM_LICALIZAR_BENEFICIARIO}  Get Text  ${MENSAGEM_LICALIZAR_BENEFICIARIO}
    Should Be Equal  ${MENSAGEM_LICALIZAR_BENEFICIARIO}  Não foram localizados Beneficiários para os parâmetros informados na pesquisa.

Preencheu o campo "Nome / Razão Social" do Contrato PJ ADESÃO
    [Arguments]    @{arg1}
    Input Text  ${CONTA_NOME}  ${arg1[1]}
    Input Text  id:conta_cnpj  ${arg1[2]}
    

Preencheu o campo "Nome / Razão Social" do Contrato CAEPF ADESÃO e clicou no botão "PESQUISAR"
    [Arguments]    @{arg1}
    Input Text  ${CONTA_NOME}  ${arg1[1]}
    Input Text  id:conta_cnpj  ${arg1[2]}
    Clicar no botão "PESQUISAR"

Validou a apresentação de somente Beneficiários TITULARES
    Page Should Contain Element  ${VALIDAR TITULAR}

Clicou em um beneficiário TITULAR e clicou no botão "SELECIONAR"
    Sleep  5s
    Set Focus To Element  ${VALIDAR TITULAR}
    Click Element  ${VALIDAR TITULAR}
    Set Focus To Element  ${BTN_SELECT}
    Click Element  ${BTN_SELECT}

Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Transferência", "Contrato de Destino", "Produto Assistencial", "Produto(s) Acessório", "Tipo Transferência", "Motivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão onde o beneficiário que será excluido está vinculado, com as colunas "Contrato de Destino", "Titular", "Transferência" desabilitado, "Matricula", "Motivo", "Assistencial" e "Produto(s) Acessório" desabilitados
    [Arguments]  ${arg1}
    Sleep  10s
    Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO"
    Page Should Contain Element  id:form_dados_padrao
    Page Should Contain    Dados padrão para Transferência
    Page Should Contain    Contrato de Destino:
    Page Should Contain    Produto Assistencial
    Page Should Contain    Produto(s) Acessório:
    Page Should Contain    Tipo Transferência
    Page Should Contain    Motivo:
    Page Should Contain Element    id:btn_aplicar_dados_padrao
    Page Should Contain Element    id:btn_limpar_dados_padrao
    
    ${e}  Run Keyword And Ignore Error    Page Should Contain Element   ${TAB_CONTRATO}
    Run Keyword If  "${e[0]}" == "PASS"    Page Should Contain  ${arg1}
    Run Keyword If  "${e[0]}" == "PASS"    Mouse Down  ${TITULAR_VINCULADO}
    Run Keyword If  "${e[0]}" == "PASS"    Page Should Contain    Contrato de Destino
    Run Keyword If  "${e[0]}" == "PASS"    Page Should Contain    Titular  
    Run Keyword If  "${e[0]}" == "PASS"    Page Should Contain  Matricula
    Run Keyword If  "${e[0]}" == "PASS"    Page Should Contain  Motivo
    Run Keyword If  "${e[0]}" == "PASS"    Element Should Be Disabled  ${ASSISTENCIAL}
    Run Keyword If  "${e[0]}" == "PASS"    Element Should Be Disabled  ${ACESSORIO}


Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Transferência", "Contrato de Destino", "Produto Assistencial", "Produto(s) Acessório", "Tipo Transferência", "Motivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão onde o beneficiário que será excluido está vinculado, com as colunas "Contrato de Destino", "Titular", "Transferência" desabilitado, "Matricula", "Motivo", "Assistencial" e "Produto(s) Acessório" desabilitados 5045
    ${f}  Run Keyword And Ignore Error    Page Should Contain Element   ${TAB_CONTRATO_2}
    Run Keyword If  "${f[0]}" == "PASS"    Mouse Down  ${TITULAR_VINCULADO_2}
    Run Keyword If  "${f[0]}" == "PASS"   Page Should Contain    Contrato de Destino
    Run Keyword If  "${f[0]}" == "PASS"   Page Should Contain    Titular
    Run Keyword If  "${f[0]}" == "PASS"   Page Should Contain  Matricula
    Run Keyword If  "${f[0]}" == "PASS"   Page Should Contain  Motivo
    Run Keyword If  "${f[0]}" == "PASS"   Element Should Be Disabled  ${ASSISTENCIAL_2}
    Run Keyword If  "${f[0]}" == "PASS"   Element Should Be Disabled  ${ACESSORIO_2}
         

Selecionou um Contrato PJ EMPRESARIAL
    [Arguments]  ${arg1}
    Sleep  15s
    Mouse Down  ${CONTRATO_DESTIONO}
    Click Element  ${CONTRATO_DESTIONO}
    Sleep  15s
    Input Text  //*[@id="table_list_modal_contratos_filter"]/label/input  ${arg1}
    Sleep  15s
    Click Element  ${PESQUISA_CONTRATO}

Selecionou um Contrato CAEPF EMPRESARIAL
    [Arguments]  ${arg2}
    Sleep  15s
    Mouse Down  ${CONTRATO_DESTIONO}
    Click Element  ${CONTRATO_DESTIONO}
    Sleep  15s
    Input Text  //*[@id="table_list_modal_contratos_filter"]/label/input  ${arg2}
    Sleep  15s
    Click Element  ${PESQUISA_CONTRATO}

Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato PJ EMPRESARIAL, "Produto(s) Acessório" vazio
    ${ID}  Get Element Attribute  xpath://div[@id='tabelas_contratos']/table[1]//tr[3]  data-hash
    ${ID_TRANSFERENCIA}  Catenate  tipo_transferencia_${ID}
    Set Test Variables  ${ID_TRANSFERENCIA}
    Page Should Contain Element  ${ID_TRANSFERENCIA}
    @{VALUE_LIST_TRANSFERENCIA}  Get Selected List Values  ${ID_TRANSFERENCIA}
    Should Be Equal  @{VALUE_LIST_TRANSFERENCIA}  @{LIST_ASS}
    Page Should Contain Element  ${ASSISTENCIAL}
    @{VALUE_LIST_ASS}  Get Selected List Values  ${ASSISTENCIAL}
    Should Be Equal  @{VALUE_LIST_ASS}  @{LIST_ASS}
    Should Not Be Empty  ${ACESSORIO_VAZIO}

Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do CAEPF EMPRESARIAL, "Produto(s) Acessório" vazio
    ${ID}  Get Element Attribute  xpath://div[@id='tabelas_contratos']/table[1]//tr[3]  data-hash
    ${ID_TRANSFERENCIA}  Catenate  tipo_transferencia_${ID}
    Set Test Variables  ${ID_TRANSFERENCIA}
    Page Should Contain Element  ${ID_TRANSFERENCIA}
    @{VALUE_LIST_TRANSFERENCIA}  Get Selected List Values  ${ID_TRANSFERENCIA}
    Should Be Equal  @{VALUE_LIST_TRANSFERENCIA}  @{LIST_ASS}
    Page Should Contain Element  ${ASSISTENCIAL}
    @{VALUE_LIST_ASS}  Get Selected List Values  ${ASSISTENCIAL}
    Should Be Equal  @{VALUE_LIST_ASS}  @{LIST_ASS}
    Should Not Be Empty  ${ACESSORIO_VAZIO}

Selecionou no campo "Transferência" a opção 1° DIA DO MÊS SEGUINTE, "Assistencial" igual a 5045
    Set Focus To Element  ${ID_TRANSFERENCIA}
    Select From List By Value   ${ID_TRANSFERENCIA}   1_dia_mes_seguinte
    ${ASSITENCIAL_ID}  Get Element Attribute  xpath://div[@id='tabelas_contratos']/table[1]//tr[3]/td[7]/select/option[2]  value
    Select From List By Value  ${ASSISTENCIAL}   ${ASSITENCIAL_ID} 
    

Validou a apresentação dos registros no campo "Produto(s) Acessório"
    Should Not Be Empty  ${ACESSORIO_VAZIO}
    ${e}  Run Keyword And Ignore Error    Set Focus To Element   ${ACESSORIO_VAZIO_2}
    Run Keyword If  "${e[0]}" == "PASS"   Should Not Be Empty  ${ACESSORIO_VAZIO_2}


Preencheu o campo "Nome / Razão Social" do Contrato PJ EMPRESARIAL e clicou no botão "PESQUISAR"
    [Arguments]  ${arg1}  ${arg2}
    Clicou botão "+ ADICIONAR BENEFICIÁRIOS"
    Validou a apresentação da modal "Pesquisa Beneficiários"
    Input Text  ${CONTA_NOME}  ${arg1}
    Input Text  id:conta_cnpj  ${arg2}
    Clicar no botão "PESQUISAR"

Preencheu o campo "Nome / Razão Social" do Contrato CAEPF EMPRESARIAL e clicou no botão "PESQUISAR"
    [Arguments]  ${arg1}  ${arg2}
    Clicou botão "+ ADICIONAR BENEFICIÁRIOS"
    Validou a apresentação da modal "Pesquisa Beneficiários"
    Input Text  ${CONTA_NOME}  ${arg1}
    Input Text  id:conta_cnpj  ${arg2}
    Clicar no botão "PESQUISAR"

Selecionou um Contrato PJ ADESÃO
   [Arguments]  ${arg1}
   Sleep  15s
   Mouse Down  ${CONTRATO_DESTIONO_2}
   Click Element  ${CONTRATO_DESTIONO_2}
   Sleep  15s
   Input Text  //*[@id="table_list_modal_contratos_filter"]/label/input  ${arg1}
   Sleep  15s
   Click Element  ${PESQUISA_CONTRATO}

Selecionou um Contrato CAEPF ADESÃO
    [Arguments]  ${arg1}
   Sleep  15s
   Mouse Down  ${CONTRATO_DESTIONO_2}
   Click Element  ${CONTRATO_DESTIONO_2}
   Sleep  15s
   Input Text  //*[@id="table_list_modal_contratos_filter"]/label/input  ${arg1}
   Sleep  15s
   Click Element  ${PESQUISA_CONTRATO}
   
Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato PJ ADESÃO, "Produto(s) Acessório" vazio
    ${ID}  Get Element Attribute  xpath://div[@id='tabelas_contratos']/table[2]//tr[3]  data-hash
    ${ID_TRANSFERENCIA_2}  Catenate  tipo_transferencia_${ID}
    Set Test Variables  ${ID_TRANSFERENCIA_2}
    Page Should Contain Element  ${ID_TRANSFERENCIA_2}
    @{VALUE_LIST_TRANSFERENCIA}  Get Selected List Values  ${ID_TRANSFERENCIA_2}
    Should Be Equal  @{VALUE_LIST_TRANSFERENCIA}  @{LIST_ASS}
    Page Should Contain Element  ${ASSISTENCIAL_2}
    @{VALUE_LIST_ASS}  Get Selected List Values  ${ASSISTENCIAL_2}
    Should Be Equal  @{VALUE_LIST_ASS}  @{LIST_ASS_2}
    Should Not Be Empty  ${ACESSORIO_VAZIO_2}

Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato CAEPF ADESÃO, "Produto(s) Acessório" vazio
    ${ID}  Get Element Attribute  xpath://div[@id='tabelas_contratos']/table[2]//tr[3]  data-hash
    ${ID_TRANSFERENCIA_2}  Catenate  tipo_transferencia_${ID}
    Set Test Variables  ${ID_TRANSFERENCIA_2}
    Page Should Contain Element  ${ID_TRANSFERENCIA_2}
    @{VALUE_LIST_TRANSFERENCIA}  Get Selected List Values  ${ID_TRANSFERENCIA_2}
    Should Be Equal  @{VALUE_LIST_TRANSFERENCIA}  @{LIST_ASS}
    Page Should Contain Element  ${ASSISTENCIAL_2}
    @{VALUE_LIST_ASS}  Get Selected List Values  ${ASSISTENCIAL_2}
    Should Be Equal  @{VALUE_LIST_ASS}  @{LIST_ASS_2}
    Should Not Be Empty  ${ACESSORIO_VAZIO_2}

Selecionou no campo "Transferência" a opção 1° DIA DO MÊS SEGUINTE, "Assistencial" igual a 5051
    Set Focus To Element  ${ID_TRANSFERENCIA_2}
    Select From List By Value   ${ID_TRANSFERENCIA_2}   1_dia_mes_seguinte
    ${ASSITENCIAL_ID_2}  Get Element Attribute  xpath://div[@id='tabelas_contratos']/table[2]//tr[3]/td[7]/select/option[3]  value
    Select From List By Value  ${ASSISTENCIAL_2}   ${ASSITENCIAL_ID_2} 

Clicou o botão "SALVAR"    
    Set Focus To Element  ${TRANSF_SALVAR}
    Click Element  ${TRANSF_SALVAR}

Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, com beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    [Arguments]  ${arg1}
    Wait Until Page Contains  Movimentação em Massa - MOV ${arg1}  timeout=${TIMEOUT}
    Page Should Contain  Pendente
    Page Should Contain Element  ${REGISTRO_BENEF}

Clicar no botão "SIM" da modal "Confirmação" com a mensagem "Confirma geração das movimentações cadastrais?"
    Wait Until Page Contains  Confirma geração das movimentações cadastrais?  timeout=${TIMEOUT}
    Set Focus To Element  id:modal_confirm_btn
    Click Element  id:modal_confirm_btn

O Canal do Contratante deve atualizar a tela "Movimentação em Massa" + Nome, com a mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.", "Situação" igual a CONCLUIDA, com beneficiários no painel tabela "Beneficiários - Transferência de Grupo Familiar" e no painel "Movimentações Cadastrais" DOIS registros com "Situação" igual a EM ANDAMENTO
    [Arguments]  ${arg1}
    Wait Until Page Contains  Movimentação em Massa - MOV ${arg1}  timeout=${TIMEOUT}
    ${MENSAGEM_APROVACAO}  Get Text  ${MENSAGEM_APROVACAO}
    Should Be Equal  ${MENSAGEM_APROVACAO}  Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.
    Page Should Contain  Concluída
    Page Should Contain Element  ${REGISTRO_BENEF}
    ${QTD_REGISTRO}  Get Text  ${QTD_REGISTRO}
    Should Be Equal  ${QTD_REGISTRO}  Mostrando 1 a 2 de 2 registros
    ${SITUACAO_MOV}  Get Text  ${SITUACAO_MOV}
    Should Be Equal  ${SITUACAO_MOV}  Em Andamento

Mostrar que ao atualizar a tela é apresentada a mensagem "Atenção! Há movimentações que ainda não foram encaminhadas para aprovação."
    [Arguments]  ${arg1}
    Set Focus To Element  ${BUTTON_BACK}
    Click Element  ${BUTTON_BACK}
    Wait Until Page Contains  Movimentação Cadastral em Massa  timeout=${TIMEOUT}
    Mouse Down  ${BUTTON_SEARCH}
    Set Focus To Element  ${BUTTON_SEARCH}
    Click Element  ${BUTTON_SEARCH}
    Sleep  10s
    Set Focus To Element  xpath://*[@id="table_list_movimentacoes_wrapper"]//tbody/tr
    Click Element  xpath://*[@id="table_list_movimentacoes_wrapper"]//tbody/tr
    Wait Until Page Contains  Movimentação em Massa - MOV  timeout=${TIMEOUT}
    Page Should Contain Element  xpath://section[2]/div[1]




