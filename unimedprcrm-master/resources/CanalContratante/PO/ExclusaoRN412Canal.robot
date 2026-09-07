*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary


*** Variables ***
${TIMEOUT} =  30
${SAVE_FOOTER_BUTTON}  id:SAVE_FOOTER
${PESQUISAR_CONTRATO} =  xpath://span[contains(@data-toggle,'modal')]
${BUTTON_PESQUISAR} =  xpath://input[@value='PESQUISAR']
${CONTRATO_BENEFICIARIO} =  xpath://*[@id="table_list_modal_contratos"]/tbody/tr[1]
${SALVAR_CONTRATO} =  xpath://input[contains(@value,'SALVAR')]
${SITUACAO_STATUS} =  xpath://button[contains(.,'Em Andamento')]
${TEXT_TABELA_EXCLUSAO} =  id:table_list_inclusao_benef_info
${BUTTON_ADD} =  xpath:(//a[contains(.,'ADICIONAR')])[1]
${INPUT_MOTIVO} =  id:motivo
${PERFIL_SOLICITANTE} =  id:perfil_solicitante_c
${COMPLEMENTO} =  id:complemento
${INPUT_BENEFICIARIO} =  xpath://*[@id="form_exclusao"]/div/div[2]/div[11]/div/div/div
${RADIO_SIM} =  id:carteirinhas_devolvidas_sim
${TELEFONE_COMERCIAL} =  id:tel_comercial
${EMAIL} =  id:email
${BUTTON_SAVE} =  xpath://*[@id="form_exclusao"]/div/div[3]/input
${BUTTON_ADD_DOC} =  xpath:(//a[contains(.,'ADICIONAR')])[2]
${ESCOLHER_ARQUIVO_EXCLUSAO} =  id:arquivo
${BUTTON_SAVE_DOC} =  xpath://input[@value='SALVAR']
${BUTTON_YES} =  id:modal_confirma_rn412_btn_sim
${TABLE_CONFERENCIA} =  id:DataTables_Table_0_wrapper
${PRIORIDADE_RN412} =  xpath://*[@id="DataTables_Table_0_wrapper"]//tbody/tr/td[3]/span
${DATA_EXCLUSAO} =  xpath://*[@id="subPanel"]//tr/td[8]
${DOCUMENTOS_CONFERENCIA} =  xpath://*[@id="list_subpanel_saude_conferencia_saude_documento_conferencia"]/table/tbody/tr/td[3]/span/span
${VALIDACAO_SUCESSO} =  xpath://*[@id="LBL_DETAILVIEW_PANEL7"]/tbody/tr/td[2]/span/span[1]
${ATUALIZAR_SITUACAO} =  xpath://a[contains(.,'Atualizar Situação em Massa')]
${DOCUMENTOS} =  xpath://*[@id="modal_documentos_atualizar_situacao"]//div/table/tbody/tr
${SITUACAO_MODAL_DOC_CONFERENCIA} =  id:doc_situacao
${COMPLEMENTO_MODAL_DOC_CONFERENCIA} =  id:doc_complemento
${TEXTAREA_PARECER} =  xpath://*[@id="modal_acoes_conferencia"]/div/div/div[2]/div[4]
${BUTTON_SAVE_MODAL} =  xpath://button[contains(.,'Salvar')]

**Keywords***
Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"
    Wait Until Page Contains  Usuários Canal do Contratante » prime1  timeout=${TIMEOUT}
    Mouse Up    ${EDIT_BUTTON}
    Set Focus To Element  ${EDIT_BUTTON}
    Click Element    ${EDIT_BUTTON}
    Page Should Contain  Funções Permitidas:

    ${c}  Run Keyword And Ignore Error   Checkbox Should Be Selected  id:_funcoes_permitidas3
    Run Keyword If  "${c[0]}" == "PASS"   Set Focus To Element  ${SAVE_FOOTER_BUTTON}
    Run Keyword If  "${c[0]}" == "PASS"   Click Element  ${SAVE_FOOTER_BUTTON}
    Run Keyword If  "${c[0]}" == "FAIL"   Click Element  id:_funcoes_permitidas3
    Run Keyword If  "${c[0]}" == "FAIL"   Click Element  ${SAVE_FOOTER_BUTTON}

Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"
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
    Select From List By Value  id:tipo_movimentacao  8
    Set Focus To Element  ${SALVAR_CONTRATO}
    Click Element  ${SALVAR_CONTRATO}

Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    Wait Until Page Contains  Exclusão RN412  timeout=${TIMEOUT}
    Element Text Should Be  ${SITUACAO_STATUS}  Em Andamento
    Element Text Should Be  ${TEXT_TABELA_EXCLUSAO}  Nenhum registro encontrado

Clicou o botão "ADICIONAR"
    Set Focus To Element  ${BUTTON_ADD}
    Click Element  ${BUTTON_ADD}

Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    Wait Until Page Contains  Solicitação de Exclusão  timeout=${TIMEOUT}
    Page Should Contain Element  ${INPUT_MOTIVO}
    Page Should Contain Element  ${PERFIL_SOLICITANTE}
    Page Should Contain Element  ${COMPLEMENTO}
    Page Should Contain Element  ${INPUT_BENEFICIARIO}
    Page Should Contain Element  ${RADIO_SIM}
    Page Should Contain Element  ${TELEFONE_COMERCIAL}
    Page Should Contain Element  ${EMAIL}
    Page Should Contain Element  ${BUTTON_SAVE}

Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"
    Wait Until Page Contains  Exclusão RN412  timeout=${TIMEOUT}
    ${SITUACAO_STATUS}  Get Text  ${SITUACAO_STATUS}
    Page Should Contain  ${SITUACAO_STATUS}

    ${c}  Run Keyword And Ignore Error   Element Text Should Be  ${TEXT_TABELA_EXCLUSAO}  Mostrando 1 a 2 de 2 registros
    Run Keyword If  "${c[0]}" == "FAIL"   Element Text Should Be  ${TEXT_TABELA_EXCLUSAO}  Mostrando 1 a 1 de 1 registros

Anexou um documento no painel "Documentos"
    Set Focus To Element  ${BUTTON_ADD_DOC}
    Click Element  ${BUTTON_ADD_DOC}
    Choose File  ${ESCOLHER_ARQUIVO_EXCLUSAO}    ${DOCUMENTS_FOLDER}${/}doc_fake.pdf
    Set Focus To Element  ${BUTTON_SAVE_DOC}
    Click Element  ${BUTTON_SAVE_DOC}

Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    Wait Until Page Contains  Confirmação  timeout=${TIMEOUT}
    Sleep  15s
    Set Focus To Element  ${BUTTON_YES}
    Click Element  ${BUTTON_YES}

Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    Wait Until Page Contains  Exclusão RN412  timeout=${TIMEOUT}
    Sleep  30s
    Page Should Contain    Aguardando Aprovação

Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    Wait Until Page Contains  Conferência » Conferir Processos  timeout=${TIMEOUT}
    Mouse Down  ${TABLE_CONFERENCIA}
    Element Text Should Be  ${PRIORIDADE_RN412}  RN412

Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    Wait Until Page Contains  Beneficiários - Exclusão  timeout=${TIMEOUT}
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Element Should Contain  ${DATA_EXCLUSAO}  ${data_formatada}
    Mouse Down  ${DOCUMENTOS_CONFERENCIA}
    Element Text Should Be  ${DOCUMENTOS_CONFERENCIA}  Aguardando Conferência
    Mouse Up  id:detail_header_action_menu

Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    Sleep  30s
    Wait Until Page Contains  Resumo Conferência  timeout=${TIMEOUT}
    Element Text Should Be  ${VALIDACAO_SUCESSO}  Validação Efetuada com Sucesso

Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
   Mouse Down  ${DOCUMENTOS_CONFERENCIA}
   Click Element  ${ATUALIZAR_SITUACAO}

Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    Wait Until Page Contains  Atualizar Situação em Massa  timeout=${TIMEOUT}
    Sleep  30s
    Page Should Contain Element  ${DOCUMENTOS}
    Page Should Contain Element  ${SITUACAO_MODAL_DOC_CONFERENCIA}
    Page Should Contain Element  ${COMPLEMENTO_MODAL_DOC_CONFERENCIA}

Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    Select From List By Value  id:docMassaSelecionarTodos  todos
    Select From List By Value  ${SITUACAO_MODAL_DOC_CONFERENCIA}  2
    Input Text  ${COMPLEMENTO_MODAL_DOC_CONFERENCIA}  Automação Prime Control
    Click Element  id:btn-salvar-massa

Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Element Text Should Be  ${DOCUMENTOS_CONFERENCIA}  Aprovado
    Mouse Up  id:detail_header_action_menu

Validar a apresentação da modal "Aprovar Conferência", com a "Data/hora criação" preenchido com a DATA/HORA ATUAL, "Responsável" com o usuário logado, campo "Parecer", mensagem "Não foram encontradas devoluções de valores.", botões "SALVAR" e "CANCELAR"
    Wait Until Page Contains  Aprovar Conferência  timeout=${TIMEOUT}
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Page Should Contain  ${data_formatada}
    Page Should Contain   Prime Automação
    Page Should Contain Element  ${TEXTAREA_PARECER}
    Page Should Contain  Não foram encontradas devoluções de valores.
    Page Should Contain Element  ${TEXTAREA_PARECER}
    Page Should Contain Element  ${BUTTON_SAVE_MODAL}

Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA
    Select From List By Value  ${INPUT_MOTIVO}  48








    
    
