*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary
Library    String

Resource   ../CanalContratanteUnimedPR.robot

*** Variables ***
${TIMEOUT} =  30
${MENU_PORTABILIDADE} =  xpath:/html/body/div[1]/div/section[2]/div[1]/div[2]/div[1]/div[3]/div/div[1]
${BTN_PORTABILIDADE} =  xpath://div[1]/div/section[2]/div[1]/div[2]/div[1]/div[3]/div/div[2]/a/h5
${MENU_ACOES} =  xpath://button[1][contains(.,'AÇÕES')]
${BTN_NOVA_SOLICITACAO} =  xpath://div[1]/div/section[2]/div[1]/div[1]/div[1]/div[2]/div/ul/li/a
${ICONE_PESQUISA} =  xpath://*[@id="form_portabilidade"]/div/div[2]/div/div/div/span
${SELECT_CONTRATO} =  xpath:/html/body/div[1]/div/section[2]/div[2]/div/div/div[2]/div[2]/div/div[2]/div/table/tbody/tr[5]
${BTN_SALVAR} =  xpath://*[@id="form_portabilidade"]/div/div[3]/input[2]
${BTN_ADICIONAR} =  xpath://*[@id="tab_1"]/div[2]/div[1]/div/a
${INPUT_NOME} =  id:nome
${INPUT_CPF} =  id:cpf
${INPUT_DATA_NASC} =  id:data_nascimento
${SELECT_TIPO} =  id:tipo
${SELECT_PRODUTO} =  id:produto_assistencial
${OPTION_VALUE} =  xpath://*[@id="produto_assistencial"]/option[2]
${PESSOA_CELULAR} =  id:pessoa_celular
${PESSOA_EMAIL} =  id:pessoa_email
${BTN_SALVAR_PESSOA} =  xpath://*[@id="form_portabilidade"]/div/div[3]/input[2]
${SELECT_GRAU} =  id:grau_dependencia
${OPTION_VALUE_GRAU} =  xpath://*[@id="grau_dependencia"]/option[4]
${PESSOAS_ADD_TITULAR} =  xpath://*[@id="table_list_pre_grupo_familiar"]/tbody/tr[2]
${PESSOAS_ADD_DEPENDENTE} =  xpath://*[@id="table_list_pre_grupo_familiar"]/tbody/tr[1]
${BTN_ADICIONAR_DOC} =  xpath://*[@id="tab_1"]/div[3]/div[1]/div/a
${BTN_ARQUIVO} =  id:arquivo
${NOME_DOCUMENTO} =  id:nome_documento
${SALVAR_ARQUIVO} =  xpath://*[@id="form_documento"]/div/div[3]/input[1]
${DOC_ADD} =  xpath://*[@id="table_list_documento"]/tbody/tr
${BTN_ACAO_ENCAMINHAR} =  xpath:/html/body//button[contains(., 'AÇÕES')]
${ENCAMINHAR_VALIDACAO} =  xpath:/html/body//a[contains(., 'Encaminhar para Validação')]
${MODAL_CONFIRMACAO} =  xpath://*[@id="modal_confirm"]/div/div
${MODAL_CONFIRMACAO_BTN} =  id:modal_confirm_btn
${ALERT_SOLICITACAO_PORTABILIDADE} =  xpath:/html/body/div[1]/div/section[2]/div[1][contains(.,'A solicitação de portabilidade foi encaminhada para a validação da documentação enviada.')]
${SITUACAO_PORTABILIDADE} =  xpath://*[@id="tab_1"]/div[1]/div[1][contains(.,'Aguardando Validação')]
${EMITIR_PROPOSTA} =  xpath://a[contains(.,'Emitir Proposta de Adesão de Portabilidade')]
${VIEWER} =  id:viewer
${REALIZAR_UPLOAD} =  xpath://div[1]/div/section[2]/div[1]/div[2]/div/div/div/ul/li[2]/a
${BTN_ARQUIVO_ADESAO} =  id:arquivo_proposta_adesao
${BTN_SALVAR_ADESAO} =  xpath://*[@id="modal_upload_proposta_adesao"]/form/div/div/div[2]/div/div[3]/input
${SITUACAO_PROPOSTA} =  xpath://*[@id="tab_1"]/div[1]/div[1]
${LINK_BAIXAR} =  xpath://*[@id="tab_1"]/div[1]/div[5]/a
${SOLICITAR_PROPOSTA} =  xpath://div[1]/div/section[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/table/tbody/tr[1]
${MODAL_PROPOSTA_ADESAO} =  title:Proposta de Adesão
${MENSAGEM_ALERTA} =  xpath:/html/body/div[1]/div/section[2]/div[1]
${DATA_DE_VIGENCIA} =  xpath://*[@id="table_list_modal_contratos"]/thead/tr/th[5][contains(.,'Data de Vigência')]
${PESQUISA_CONTRATOS} =  xpath://*[@id="modal_contratos"]/div/div/div[2]/div[1]/div[3]/div[5]/input
${SELECIONAR_CONTRATO} =  xpath:/html/body/div[1]/div/section[2]/div[2]/div/div/div[2]/div[2]/div/div[2]/div/table/tbody/tr
${INPUT_PROTOCOLO} =  id:protocolo
${BTN_PESQUISAR} =  xpath://*[@id="form-portabilidade"]/div/div[3]/input[1]
${PORTABILIDADE_APROVADA} =  xpath:/html/body/div[1]/div/section[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/table/tbody/tr
${SELECIONAR_TITULAR} =   xpath://*[@id="form_portabilidade"]/div/div[2]/div[2]/div[4]/div[1]/span
${PESQUISA_CPF_TITULAR} =  xpath://*[@id="table_list_pesquisa_pessoas_filter"]/label/input
${SELECIONAR_TITULAR_PF} =  xpath://*[@id="table_list_pesquisa_pessoas"]/tbody/tr
${SELECIONAR__CONTA} =  xpath://*[@id="table_list_portabilidade"]/tbody/tr[1]
${PROPOSTA_ASSINADA} =  xpath://*[@id="proposta_assinada_c"]/a

*** Keywords ***
Clicou no menu Portabilidade > Solicitar Portabilidade
    Wait Until Page Contains  Bem-vindo, Prime Automação  timeout=${TIMEOUT}
    Wait Until Element Is Enabled  ${MENU_PORTABILIDADE}
    Mouse Over  ${MENU_PORTABILIDADE}
    Sleep  10s
    Set Focus To Element   ${BTN_PORTABILIDADE}
    Click Element  ${BTN_PORTABILIDADE}

Clicou no menu Ações > Nova Solicitação de Portabilidade
    Wait Until Page Contains  Solicitação de Portabilidade  timeout=${TIMEOUT}
    Click Element  ${MENU_ACOES}
    Click Element  ${BTN_NOVA_SOLICITACAO}

Selecionou o Contrato e clicou no botão "SALVAR"
    Wait Until Page Contains  Nova Solicitação de Portabilidade  timeout=${TIMEOUT}
    Click Element  ${ICONE_PESQUISA}
    Sleep  30s
    Input Text  id:contrato_numero  ${ID_GESTAO}
    Click Element  ${PESQUISA_CONTRATOS}
    Sleep  30s
    Click Element  ${SELECIONAR_CONTRATO}
    Click Element  ${BTN_SALVAR}

Clicou no botão "ADICIONAR" painel Pessoa
    Wait Until Page Contains  Pessoas  timeout=${TIMEOUT}
    Click Element  ${BTN_ADICIONAR}

Cadastrou duas Pessoa TITULAR e DEPENDENTE
    [Arguments]    @{arg1}
    Wait Until Page Contains  Pessoa (Portabilidade)  timeout=${TIMEOUT}
    #Cadastro Pessoa TITULAR
    Input Text  ${INPUT_NOME}  ${arg1[39]}
    Input Text  ${INPUT_CPF}  ${arg1[38]}
    Input Text  ${INPUT_DATA_NASC}  ${arg1[42]}
    Select From List By Value  ${SELECT_TIPO}  titular
    Click Element  ${SELECT_PRODUTO}
    Wait Until Element Is Visible  ${OPTION_VALUE}
    Click Element  ${OPTION_VALUE}
    Input Text  ${PESSOA_CELULAR}  ${arg1[25]}
    Input Text  ${PESSOA_EMAIL}  ${arg1[43]}
    Click Element  ${BTN_SALVAR_PESSOA}
    #Cadastro Pessoa DEPENDENTE
    Clicou no botão "ADICIONAR" painel Pessoa
    Wait Until Page Contains  Pessoa (Portabilidade)  timeout=${TIMEOUT}
    Input Text  ${INPUT_NOME}  ${arg1[31]}
    Input Text  ${INPUT_CPF}  ${arg1[11]}
    Input Text  ${INPUT_DATA_NASC}  ${arg1[12]}
    Click Element  ${SELECT_GRAU}
    Wait Until Element Is Visible  ${OPTION_VALUE_GRAU}
    Click Element  ${OPTION_VALUE_GRAU}
    Click Element  ${SELECT_PRODUTO}
    Wait Until Element Is Visible  ${OPTION_VALUE}
    Click Element  ${OPTION_VALUE}
    Input Text  ${PESSOA_CELULAR}  ${arg1[25]}
    Input Text  ${PESSOA_EMAIL}  ${arg1[26]}
    Click Element  ${BTN_SALVAR_PESSOA}
    
Anexou um arquivo no painel Documentos
    Wait Until Page Contains  Solicitação de Portabilidade  timeout=${TIMEOUT}
    Click Element  ${BTN_ADICIONAR_DOC}
    Wait Until Page Contains  Inclusão de Documentos  timeout=${TIMEOUT}
    Choose File  ${BTN_ARQUIVO}  ${DOCUMENTS_FOLDER}${/}beneficiario_import.csv
    #Input Text  ${NOME_DOCUMENTO}  nome_arquivo
    Click Element  ${SALVAR_ARQUIVO}
    Element Should Be Visible  ${DOC_ADD}

Clicou o menu "ENCAMINHAR PARA VALIDAÇÃO"
   Set Focus To Element   ${BTN_ACAO_ENCAMINHAR}
   Click Element  ${BTN_ACAO_ENCAMINHAR}
   Set Focus To Element  ${ENCAMINHAR_VALIDACAO}
   Click Element  ${ENCAMINHAR_VALIDACAO}

Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    Wait Until Page Contains  Deseja Encaminhar para Validação?  timeout=${TIMEOUT}
    #Element Should Be Visible  ${MENSAGEM_CONFIMACAO}
    Click Element  ${MODAL_CONFIRMACAO_BTN}

Apresentou a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação."
    Wait Until Page Contains   A solicitação de portabilidade foi encaminhada para a validação da documentação enviada.  timeout=${TIMEOUT}
    Page Should Contain  Em breve você receberá um retorno de sua solicitação.

Alterou a "Situação" para AGUARDANDO VALIDAÇÃO
    Wait Until Page Contains   Solicitação de Portabilidade  timeout=${TIMEOUT}
    ${SITUACAO_PORTABILIDADE}  Get Text  ${SITUACAO_PORTABILIDADE}
    Should Be Equal  ${SITUACAO_PORTABILIDADE}  Situação:\nAguardando Validação
    Close Browser

Acessou a Solicitação de Portabilidade pelo Canal do Contratante
    CanalContratanteUnimedPR.O Usuário logou no sistema Canal do Contratante
    Clicou no menu Portabilidade > Solicitar Portabilidade
    Wait Until Page Contains  Solicitação de Portabilidade  timeout=${TIMEOUT}

Clicou no menu "EMITIR PROPOSTA DE ADESÃO PORTABILIDADE"
    Set Focus To Element  ${MENU_ACOES}
    Click Element  ${MENU_ACOES}
    Click Element  ${EMITIR_PROPOSTA}
    

Fechou a modal aberta
    ${url}  Get Location
    ${url_modal}  Replace String  ${url}  detail  pdf
    Switch Window  url:${url_modal}/proposta_adesao
    Close Window

Clicou o menu "REALIZAR UPLOAD DE PROPOSTA DE ADESÃO DE PORTABILIDADE"
    Switch Window  MAIN
    Set Focus To Element  ${BTN_ACAO_ENCAMINHAR}
    Click Element  ${BTN_ACAO_ENCAMINHAR}
    Click Element  ${REALIZAR_UPLOAD}

Anexou e gravou o documento
    Wait Until Page Contains  Proposta de Adesão de Portabilidade Assinada:  timeout=${TIMEOUT}
    Choose File  ${BTN_ARQUIVO_ADESAO}  ${DOCUMENTS_FOLDER}${/}proposta_adesao.pdf
    Click Element  ${BTN_SALVAR_ADESAO}

Apresentou a mensagem "${MENSAGEM_ANALISE_ASSINATURA}", alterou a "Situação" para AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO e no campo "${PROPOSTA_ADESAO}" incluiu um link "Baixar"
    Wait Until Page Contains  A solicitação de portabilidade foi enviada para análise da assinatura.  timeout=${TIMEOUT}
    Page Should Contain  Aguardando validação de Assinatura da Proposta de Adesão
    Page Should Contain Link  ${LINK_BAIXAR}
    Close Browser

# O Canal do Contratante deve atualizar a tela Solicitação de Portabilidade, com situação igual a APROVADA
#     Wait Until Page Contains  ${PROTOCOLO}  timeout=${TIMEOUT}
#     Input Text  ${INPUT_PROTOCOLO}  ${PROTOCOLO}
#     Click Element  ${BTN_PESQUISAR}
#     Sleep  20s
#     Element Should Contain  ${PORTABILIDADE_APROVADA}  Aprovada

Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, sem pessoas na tabela "Pessoas"
    Wait Until Page Contains  Solicitação de Portabilidade  timeout=${TIMEOUT}
    Page Should Contain  Rascunho
    ${SEM_PESSOASA}  Get Text  id:table_list_pre_grupo_familiar_info
    Should Be Equal  ${SEM_PESSOASA}  Nenhum registro encontrado


Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge
    [Arguments]    @{arg1}
    Wait Until Page Contains  Pessoa (Portabilidade)  timeout=${TIMEOUT}
    Input Text  ${INPUT_NOME}  ${arg1[47]}
    Input Text  ${INPUT_CPF}  ${arg1[46]}
    Input Text  ${INPUT_DATA_NASC}  ${arg1[50]}
    Select From List By Label   id:tipo   ${arg1[45]}
    Select From List By Label   id:grau_dependencia   ${arg1[49]}
    Select From List By Label   id:produto_assistencial   ${arg1[6]}
    Set Focus To Element   ${SELECIONAR_TITULAR}
    Click Element  ${SELECIONAR_TITULAR}
    Input Text  ${PESQUISA_CPF_TITULAR}  ${arg1[2]}
    Sleep  10s
    Set Focus To Element  ${SELECIONAR_TITULAR_PF}
    Click Element  ${SELECIONAR_TITULAR_PF}
    Input Text  ${PESSOA_CELULAR}  ${arg1[25]}
    Input Text  ${PESSOA_EMAIL}  ${arg1[26]}
    Click Element  ${BTN_SALVAR_PESSOA}


Cadastrou 1 (UM) Pessoa DEPENDENTE Filho
    [Arguments]    @{arg1}
    Clicou no botão "ADICIONAR" painel Pessoa
    Wait Until Page Contains  Pessoa (Portabilidade)  timeout=${TIMEOUT}
    Input Text  ${INPUT_NOME}  ${arg1[55]}
    Input Text  ${INPUT_CPF}  ${arg1[54]}
    Input Text  ${INPUT_DATA_NASC}  ${arg1[58]}
    Select From List By Label   id:tipo   ${arg1[53]}
    Select From List By Label   id:grau_dependencia   ${arg1[57]}
    Select From List By Label   id:produto_assistencial   ${arg1[6]}
    Set Focus To Element   ${SELECIONAR_TITULAR}
    Click Element  ${SELECIONAR_TITULAR}
    Input Text  ${PESQUISA_CPF_TITULAR}  ${arg1[2]}
    Sleep  10s
    Set Focus To Element  ${SELECIONAR_TITULAR_PF}
    Click Element  ${SELECIONAR_TITULAR_PF}
    Input Text  ${PESSOA_CELULAR}  ${arg1[25]}
    Input Text  ${PESSOA_EMAIL}  ${arg1[26]}
    Click Element  ${BTN_SALVAR_PESSOA}

Cadastrou 1 (UM) Pessoa TITULAR, com Produtos Asistencial (5050)
    [Arguments]    @{arg1}
    Wait Until Page Contains  Pessoa (Portabilidade)  timeout=${TIMEOUT}
    Input Text  ${INPUT_NOME}  ${arg1[39]}
    Input Text  ${INPUT_CPF}  ${arg1[38]}
    Input Text  ${INPUT_DATA_NASC}  ${arg1[42]}
    Select From List By Label   id:tipo   ${arg1[37]}
    Select From List By Label   id:produto_assistencial   ${arg1[6]}
    Input Text  ${PESSOA_CELULAR}  ${arg1[25]}
    Input Text  ${PESSOA_EMAIL}  ${arg1[26]}
    Click Element  ${BTN_SALVAR_PESSOA}

Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge, com Produtos Asistencial (5051)
    [Arguments]    @{arg1}
    Clicou no botão "ADICIONAR" painel Pessoa
    Wait Until Page Contains  Pessoa (Portabilidade)  timeout=${TIMEOUT}
    Input Text  ${INPUT_NOME}  ${arg1[47]}
    Input Text  ${INPUT_CPF}  ${arg1[46]}
    Input Text  ${INPUT_DATA_NASC}  ${arg1[50]}
    Select From List By Label   id:tipo   ${arg1[45]}
    Select From List By Label   id:grau_dependencia   ${arg1[49]}
    Select From List By Label   id:produto_assistencial   ${arg1[27]}
    Input Text  ${PESSOA_CELULAR}  ${arg1[25]}
    Input Text  ${PESSOA_EMAIL}  ${arg1[26]}
    Click Element  ${BTN_SALVAR_PESSOA}

Cadastrou 1 (UM) Pessoa TITULAR, com Produtos Asistencial (5045)
    [Arguments]    @{arg1}
    Wait Until Page Contains  Pessoa (Portabilidade)  timeout=${TIMEOUT}
    Input Text  ${INPUT_NOME}  ${arg1[39]}
    Input Text  ${INPUT_CPF}  ${arg1[38]}
    Input Text  ${INPUT_DATA_NASC}  ${arg1[42]}
    Select From List By Label   id:tipo   ${arg1[37]}
    Select From List By Label   id:produto_assistencial   ${arg1[6]}
    Input Text  ${PESSOA_CELULAR}  ${arg1[25]}
    Input Text  ${PESSOA_EMAIL}  ${arg1[26]}
    Click Element  ${BTN_SALVAR_PESSOA}

Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge, com Produtos Asistencial (5048)
    [Arguments]    @{arg1}
    Clicou no botão "ADICIONAR" painel Pessoa
    Wait Until Page Contains  Pessoa (Portabilidade)  timeout=${TIMEOUT}
    Input Text  ${INPUT_NOME}  ${arg1[47]}
    Input Text  ${INPUT_CPF}  ${arg1[46]}
    Input Text  ${INPUT_DATA_NASC}  ${arg1[50]}
    Select From List By Label   id:tipo   ${arg1[45]}
    Select From List By Label   id:grau_dependencia   ${arg1[49]}
    Select From List By Label   id:produto_assistencial   ${arg1[27]}
    Input Text  ${PESSOA_CELULAR}  ${arg1[25]}
    Input Text  ${PESSOA_EMAIL}  ${arg1[26]}
    Click Element  ${BTN_SALVAR_PESSOA}    

Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, com pessoas na tabela "Pessoas"
    Wait Until Page Contains  Solicitação de Portabilidade  timeout=${TIMEOUT}
    Page Should Contain  Rascunho
    ${SEM_PESSOASA}  Get Text  id:table_list_pre_grupo_familiar_info
    Should Be Equal  ${SEM_PESSOASA}  Mostrando 1 a 2 de 2 registros

Validou a apresentação da tela "Solicitação de Portabilidade", com a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação.", com "Situação" da Portabilidade e das Pessoas igual a AGUARDANDO VALIDAÇÃO
    Wait Until Page Contains  Solicitação de Portabilidade  timeout=${TIMEOUT}
    Sleep  10s
    Page Should Contain   A solicitação de portabilidade foi encaminhada para a validação da documentação enviada.
    Page Should Contain  Aguardando Validação

Validou a apresentação da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a AGUARDANDO VALIDAÇÃO
   ${date}  Get Current Date
   ${date}  Convert Date  ${date}  exclude_millis=yes
   ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
   Page Should Contain  Solicitação de Portabilidade » Solicitação - ${data_formatada}
   Page Should Contain   Aguardando Validação
   Page Should Contain   Movimentação Cadastral

Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a DOCUMENTAÇÃO APROVADA
   ${date}  Get Current Date
   ${date}  Convert Date  ${date}  exclude_millis=yes
   ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
   Page Should Contain  Solicitação de Portabilidade » Solicitação - ${data_formatada}
   Page Should Contain   Aguardando Validação
   Page Should Contain   Movimentação Cadastral
   Page Should Contain   Documentação Aprovada

Validou a alteração da "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    Wait Until Page Contains  Solicitação de Portabilidade  timeout=${TIMEOUT}
    Sleep  15s
    Mouse Down  ${SELECIONAR__CONTA}
    Set Focus To Element  ${SELECIONAR__CONTA}
    Click Element  ${SELECIONAR__CONTA}
    Page Should Contain   Assinatura da Proposta de Adesão Pendente
    Page Should Contain   Aguardando Assinatura

Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO, preencheu os campos "Data Emissão Proposta de Adesão de Portabilidade" com a DATA E HORA, "Proposta de Adesão de Portabilidade Assinada" igual a PROPOSTA DE ADESÃO DE PORTABILIDADE ASSINADA (link) e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
   ${date}  Get Current Date
   ${date}  Convert Date  ${date}  exclude_millis=yes
   ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y %H:
   Page Should Contain  Solicitação de Portabilidade » Solicitação - ${data_formatada}
   Page Should Contain   Aguardando validação de Assinatura da Proposta de Adesão
   Element Should Contain  id:data_emissao_proposta_c   ${data_formatada}
   Page Should Contain Link  ${PROPOSTA_ASSINADA}
   Page Should Contain   Aguardando Assinatura

O CRM deve atualizar a tela "Solicitação de Portabilidade" + Protocolo, com a mensagem "Protocolo Finalizado.", a "Situação" igual a APROVADA, "Data Encerramento Protocolo" igual a data e hora atual
    Wait Until Page Contains  Solicitação de Portabilidade  timeout=${TIMEOUT}
    Page Should Contain   Protocolo Finalizado.
    Page Should Contain   Aprovada
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y %H:
    Element Should Contain  id:data_encerramento_protocolo_c   ${data_formatada}
