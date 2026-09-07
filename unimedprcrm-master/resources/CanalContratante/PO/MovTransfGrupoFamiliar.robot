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
${SALVAR_TRANSF} =  xpath://input[contains(@value,'SALVAR')]
${CANCELAR_TRANSF} =  xpath://a[contains(.,'CANCELAR')]
${SITUACAO_STATUS} =  xpath://button[contains(.,'Em Andamento')]
${TEXT_TABELA_TRANSF_BENEF} =  id:table_list_transf_benef_info
${PESQUISAR_BENEFTITULAR} =  xpath://*[@id="beneficiario_div"]/span/i
${CAMPO_PESQUISA} =  xpath://*[@id="table_list_pesquisa_benef_filter"]/label/input
${SELECIONAR_BENEF_TITULAR} =  xpath://*[@id="table_list_pesquisa_benef"]/tbody/tr[1]
${PRIORIDADES_MUD_PROD} =  xpath://*[@id="DataTables_Table_0"]/tbody/tr/td[3]
${MENU_MOVIMENTACAO_CADASTRAL} =  xpath://*[@id="tab4"]/em[contains(., 'Movimentação Cadastral')]
${CAMPO_MOTIVO} =  id:submotivo
${CAMPO_TRANSFERENCIA} =  id:inicio_vigencia
${CAMPO_BENEF_TITULAR} =  id:beneficiario_name
${CAMPO_NUM_MATRICULA} =  id:num_matricula
${CAMPO_CONTRATO_DESTINO} =  id:contrato_destino_name
${CAMPO_PRODUTO_ASSISTENCIAL} =  id:produto_assistencial
${BENEF_DEPENDENTE_TRANSF} =  id:produtos_dependentes
${PESQUISAR_CONTRATO_DESTINO} =  xpath://*[@id="form_transferencia"]/div/div[2]/div[2]/div[3]/div/span
${PESQUISAR_CONTRATOS} =  xpath://input[contains(@Value,'PESQUISAR')]
${SELECIONAR_CONTRATO_TRANSF} =  xpath://*[@id="table_list_modal_contratos"]/tbody/tr
${MESMO_PRODUTO_TITULAR} =  xpath://*[@id="form_transferencia"]/div/div[2]/div[4]/div
${PRODUTOS_ACESSORIOS} =  xpath://*[@id="produtos_titular"]/div[2]
${CAMPO_PRODUTO_ASSISTENCIAL_BENEF} =  xpath://*[@id="produtos_dependentes"]/div[3]/div/select
${PRODUTOS_ACESSORIOS_BENEF} =  xpath://*[@id="produtos_dependentes"]/div[3]/div[2]
${BOTAO_ACOES} =  xpath://button[1][contains(.,'AÇÕES')]

**Keywords***
Selecionar o Contrato, no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicar no botão "SALVAR"
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
    Select From List By Value  id:tipo_movimentacao  7
    Set Focus To Element  ${SALVAR_TRANSF}
    Click Element  ${SALVAR_TRANSF}

O Canal do Contratante deve apresentar a mensagem de erro "A Transferência de Grupo Familiar via movimentação cadastral é permitida apenas para Contratos Pessoa Jurídica."
    Wait Until Page Contains  A Transferência de Grupo Familiar via movimentação cadastral é permitida apenas para Contratos Pessoa Jurídica.  timeout=${TIMEOUT}

Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    Wait Until Page Contains  Beneficiários - Transferência de Grupo Familiar  timeout=${TIMEOUT}
    Element Text Should Be  ${SITUACAO_STATUS}  Em Andamento
    Element Text Should Be  ${TEXT_TABELA_TRANSF_BENEF}  Nenhum registro encontrado

Validou a apresentação da tela "Transf. de Grupo Familiar", com os campos "Transferência", "Motivo", "Beneficiário Titular", "Número da Matricula", "Contrato Destino", "Produto Assistencial" vazio e bloqueado e os botões "SALVAR" e "CANCELAR"
    Wait Until Page Contains  Transf. de Grupo Familiar  timeout=${TIMEOUT}
    Page Should Contain Element  ${CAMPO_TRANSFERENCIA}
    Page Should Contain Element  ${CAMPO_MOTIVO}
    Page Should Contain Element  ${CAMPO_BENEF_TITULAR}
    Page Should Contain Element  ${CAMPO_NUM_MATRICULA}
    Page Should Contain Element  ${CAMPO_CONTRATO_DESTINO}
    Page Should Contain Element  ${CAMPO_PRODUTO_ASSISTENCIAL}
    Page Should Contain Element  ${SALVAR_TRANSF}
    Page Should Contain Element  ${CANCELAR_TRANSF}

Selecionou 1 UM Beneficiário TITULAR, com dependentes
    Click ELement  ${PESQUISAR_BENEFTITULAR}
    Sleep  3s
    Click Element  ${SELECIONAR_BENEF_TITULAR}

Validou a atualização da tela com os campos "Beneficiário Dependente", "Grau de Dependência"
    Wait Until Page Contains  Beneficiário Dependente:  timeout=${TIMEOUT}
    Page Should Contain  Grau de Dependência
    Page Should Contain Element  ${BENEF_DEPENDENTE_TRANSF}

Preencheu os campos "Transferência" igual a EM 24 HORAS, "Motivo", "Contrato Destino"
    [Arguments]  @{arg1}  
    Select From List By Label   ${CAMPO_TRANSFERENCIA}   Em 24 horas
    Select From List By Label   ${CAMPO_MOTIVO}   submotivo 41
    Click Element  ${PESQUISAR_CONTRATO_DESTINO}
    Page Should Contain  Pesquisa Contratos
    Input Text  id:conta_cnpj  ${arg1[2]}
    Click Element  ${PESQUISAR_CONTRATOS}
    Sleep  10s
    Click Element  ${SELECIONAR_CONTRATO_TRANSF}

Validou a atualização da tela com os campos "Produto Assistencial" habilitado com os produtos do Contrato destino, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM
    Sleep  5s
    Page Should Contain Element  ${CAMPO_PRODUTO_ASSISTENCIAL}
    Page Should Contain Element  ${MESMO_PRODUTO_TITULAR}

Selecionou um Produto Assistencial
    [Arguments]  @{arg1}
    Select From List By Label   ${CAMPO_PRODUTO_ASSISTENCIAL}   ${arg1[6]}

Validou a atualização da tela apresentando os produtos Acessórios
    Page Should Contain Element  ${PRODUTOS_ACESSORIOS}

Validou a atualização da tela apresentando o campo "Produto Assistencial" para os dependentes
    Page Should Contain Element  ${CAMPO_PRODUTO_ASSISTENCIAL_BENEF}

Selecionou o Produto Assistencial do dependente
    [Arguments]  @{arg1}
    Select From List By Label   ${CAMPO_PRODUTO_ASSISTENCIAL_BENEF}   ${arg1[6]}

Validou a atualização da tela apresentando o campo "Produto Acessório" com as opções de acordo com o Produto Assistencial
    Page Should Contain Element  ${PRODUTOS_ACESSORIOS_BENEF}

Clicou no botão "SALVAR", sem selecionar acessórios
    Click Element  ${SALVAR_TRANSF}

Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o painel "Beneficiários - Transferência de Grupo Familiar" com registros
    Wait Until Page Contains  Beneficiários - Transferência de Grupo Familiar  timeout=${TIMEOUT}
    Page Should Contain  Em Andamento
    Element Text Should Be  ${TEXT_TABELA_TRANSF_BENEF}  Mostrando 1 a 2 de 2 registros

Clicar menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    Wait Until Page Contains  Beneficiários - Transferência de Grupo Familiar  timeout=${TIMEOUT}
    Click Element  ${BOTAO_ACOES}
    Set Focus To Element  xpath://a[contains(.,'Realizar Integração Automática')]
    Click Element  xpath://a[contains(.,'Realizar Integração Automática')]

Clicar menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA" Canal Contratante
    Click Element  ${BOTAO_ACOES}
    Sleep           3s
    Set Focus To Element  xpath://a[contains(.,'Realizar Integração Automática')]
    Click Element  xpath://a[contains(.,'Realizar Integração Automática')]


Validar a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    Wait Until Page Contains  Beneficiários - Transferência de Grupo Familiar  timeout=${TIMEOUT}
    Page Should Contain  Aguardando Integração Automática
