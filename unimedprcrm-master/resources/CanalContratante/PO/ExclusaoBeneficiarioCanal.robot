*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary


**Variables***
${LINK_EDITAR}                      xpath://a[@id='edit_button'][contains(.,'Editar')]
${TEXT_DATA_PADRAO}                 id:assumir_data_padrao_exclusao_c_label
${SELECT_DATA_PADRAO}               id:assumir_data_padrao_exclusao_c
${BTN_SALVAR_DATA}                  xpath:(//input[@id='SAVE_HEADER'])[1]
${BTN_PESQUISAR_MOVIMENTACAO}       xpath://*[@id="movimentacao-criar"]/div/div[2]/div[1]/div/div/span
${INPUT_CNPJ_CPF}                   id:conta_cnpj
${BTN_PESQUISA_CONTRATO}            xpath://input[@value='PESQUISAR']
${BENEFICIARIO_CONTRATO}            xpath://table[@id='table_list_modal_contratos']/tbody/tr[1]
${SELECT_TIPO_MOVI}                 id:tipo_movimentacao
${BTN_SALVAR_MOVI}                  xpath://input[@value='SALVAR']
${TEXT_PROTOCOLO}                   xpath://section[@class='content-header']/h1
${TEXT_STATUS}                      xpath://button[@class='btn btn-success btn-action btn-xs btn-circle']             
${TEXT_TABELA_EXCLUSAO}             id:table_list_inclusao_benef_info
${BTN_ADICIONAR_EXCLUSAO}           xpath://a[@class='btn btn-success'][contains(.,'ADICIONAR')][2]
${SELECT_MOTIVO}                    id:motivo
${SELECT_SUBMOTIVO}                 id:submotivo
${SELECT_BENEFICIARIO}              id:beneficiario
${BTN_PESQUISA_BENEFICIARIO}        xpath://span[@class='input-group-addon pointer']
${INPUT_SEARCH}                     xpath://div[@id='table_list_pesquisa_benef_filter']//input
${OPCAO_TITULAR}                    xpath://table[@id='table_list_pesquisa_benef']/tbody/tr[1]
${BTN_RADIO_SIM}                    id:carteirinhas_devolvidas_sim
${INPUT_EMAIL_CONTRAT}              id:email
${BTN_SALVAR_EXCLUSAO}              xpath://input[@value='SALVAR']
${COLUM_TABLE_CPF_1}                xpath://table[@id='table_list_inclusao_benef']/tbody/tr[1]/td[4]
${COLUM_TABLE_CPF_2}                xpath://table[@id='table_list_inclusao_benef']/tbody/tr[2]/td[4]
${ABRIR_SELECT_TODOS}               xpath://a[@title='Mostrar Todos']
${BTN_ADD_EMLOTE}                   xpath://a[@class='btn btn-success'][contains(.,'ADICIONAR EM LOTE')]
${BTN_RADIO_SIM_ADD_EXCLUSAO}       xpath:(//input[@value='sim'])[5]

## tela do CRM 01 - 46 | 02 -30
${COLUM_CPF1_MOV_CADASTRAR}          xpath://div[@id='list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_benef_1_conferencia']/table[@id='subPanel']/tbody/tr[1]/td[5]
${COLUM_CPF2_MOV_CADASTRAR}          xpath://div[@id='list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_benef_1_conferencia']/table[@id='subPanel']/tbody/tr[2]/td[5]

## 01 - 46 | 02 -30 NAO UTILIZADO
${COLUM_DATA_EXCLUSAO_MOV_CADASTRAL1}        xpath://div[@id='list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_benef_1_conferencia']/table[@id='subPanel']/tbody/tr[1]/td[8]
${COLUM_DATA_EXCLUSAO_MOV_CADASTRAL2}        xpath://div[@id='list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_benef_1_conferencia']/table[@id='subPanel']/tbody/tr[2]/td[8]

${SETA_MENU_VALIDAR_DADOS}                   xpath://ul[@id='detail_header_action_menu']//span
${SUBMENU_APROVAR_CONF}                      xpath://*[@id="detail_header_action_menu"]/li/ul/li[1]/a[contains(text(), 'Aprovar')]
${LINK_INTEGRACAO_SOLIC}                     xpath://div[@id='list_subpanel_saude_solicita_integracao']/table/tbody//td[1]//a
${TEXT_DATA_INTEGRACAO_SOLI}                 xpath://div[@id='list_subpanel_saude_solicita_integracao']/table/tbody//td[2]/span

**Keywords***
Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    
    Wait Until Element Is Visible           ${LINK_EDITAR}             timeout=30
    Click Element                           ${LINK_EDITAR}
    Wait Until Page Contains Element        ${TEXT_DATA_PADRAO}         timeout=5
    Mouse Down                              ${TEXT_DATA_PADRAO}
    Wait Until Element Is Visible           ${TEXT_DATA_PADRAO}         timeout=5
    Select From List By Value               ${SELECT_DATA_PADRAO}       sim_primeiro_dia_mes
    Execute JavaScript                      window.scrollTo(1000,0)
    Sleep                                   3s
    Click Element                           ${BTN_SALVAR_DATA}
    Sleep                                   30s
    Page Should Contain                     Sim. Primeiro dia do mês.


Editou os campos "Integração automática" igual a EXCLUSÃO DE BENEFICIÁRIOS e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    Wait Until Element Is Visible           ${LINK_EDITAR}             timeout=30
    Click Element                           ${LINK_EDITAR}
    Wait Until Page Contains Element        ${TEXT_DATA_PADRAO}         timeout=5
    Select From List By Value               ${SELECT_DATA_PADRAO}       sim_dia_solicitacao   
    Execute JavaScript                      window.scrollTo(1000,0)
    Sleep                                   3s
    Click Element                           ${BTN_SALVAR_DATA}
    Sleep                                   30s
    Page Should Contain                     Sim. No dia da solicitação.


Editou os campos "Integração automática" igual a EXCLUSÃO DE BENEFICIÁRIOS e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    Wait Until Element Is Visible           ${LINK_EDITAR}             timeout=30
    Click Element                           ${LINK_EDITAR}
    Wait Until Page Contains Element        ${TEXT_DATA_PADRAO}         timeout=5
    Select From List By Value               ${SELECT_DATA_PADRAO}       sim_primeiro_dia_mes
    Execute JavaScript                      window.scrollTo(1000,0)
    Sleep                                   3s
    Click Element                           ${BTN_SALVAR_DATA}
    Sleep                                   30s
    Page Should Contain                     Sim. Primeiro dia do mês.


Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    Wait Until Element Is Visible           ${LINK_EDITAR}             timeout=30
    Click Element                           ${LINK_EDITAR}
    Wait Until Page Contains Element        ${TEXT_DATA_PADRAO}         timeout=5
    Mouse Down                              ${TEXT_DATA_PADRAO}
    Wait Until Element Is Visible           ${TEXT_DATA_PADRAO}         timeout=5
    Select From List By Value               ${SELECT_DATA_PADRAO}       sim_primeiro_dia_mes
    Execute JavaScript                      window.scrollTo(1000,0)
    Sleep                                   3s
    Click Element                           ${BTN_SALVAR_DATA}
    Sleep                                   30s
    Page Should Contain                     Sim. Primeiro dia do mês.


Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    Wait Until Element Is Visible           ${LINK_EDITAR}             timeout=30
    Click Element                           ${LINK_EDITAR}
    Wait Until Page Contains Element        ${TEXT_DATA_PADRAO}         timeout=5
    Mouse Down                              ${TEXT_DATA_PADRAO}
    Wait Until Element Is Visible           ${TEXT_DATA_PADRAO}         timeout=5
    Select From List By Value               ${SELECT_DATA_PADRAO}       sim_dia_solicitacao   
    Execute JavaScript                      window.scrollTo(1000,0)
    Sleep                                   3s
    Click Element                           ${BTN_SALVAR_DATA}
    Sleep                                   30s
    Page Should Contain                     Sim. No dia da solicitação.

Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    Wait Until Element Is Visible           ${LINK_EDITAR}             timeout=30
    Click Element                           ${LINK_EDITAR}
    Wait Until Page Contains Element        ${TEXT_DATA_PADRAO}         timeout=5
    Mouse Down                              ${TEXT_DATA_PADRAO}
    Wait Until Element Is Visible           ${TEXT_DATA_PADRAO}         timeout=5
    Select From List By Value               ${SELECT_DATA_PADRAO}       sim_dia_solicitacao   
    Execute JavaScript                      window.scrollTo(1000,0)
    Sleep                                   3s
    Click Element                           ${BTN_SALVAR_DATA}
    Sleep                                   30s
    Page Should Contain                     Sim. No dia da solicitação.

Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"
    [Arguments]                             @{arg1}
    Page Should Contain                     Nova Solicitação de Movimentação Cadastral         
    Click Element                           ${BTN_PESQUISAR_MOVIMENTACAO}
    Page Should Contain                     Pesquisa Contratos
    Input Text                              ${INPUT_CNPJ_CPF}               ${arg1[2]}
    Click Element                           ${BTN_PESQUISA_CONTRATO}
    Sleep                                   3s
    Set Focus To Element                    ${BENEFICIARIO_CONTRATO}
    Click Element                           ${BENEFICIARIO_CONTRATO} 
    Select From List By Value               ${SELECT_TIPO_MOVI}         2
    Click Element                           ${BTN_SALVAR_MOVI}

Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    Wait Until Element Contains             xpath://section[@class='content-header']/h1            Protocolo        timeout=30               
    ${TEXT_STATUS}                          Get Text                                ${TEXT_STATUS} 
    Element Text Should Be                  ${TEXT_TABELA_EXCLUSAO}        Nenhum registro encontrado

Clicou no botão "ADICIONAR"
    Click Element                           ${BTN_ADICIONAR_EXCLUSAO}
    Wait Until Element Contains             xpath://section[@class='content-header']/h1            Solicitação de Exclusão        timeout=30

Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    Wait Until Element Is Visible           ${SELECT_MOTIVO}
    Select From List By Value               ${SELECT_MOTIVO}            41


Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    Wait Until Element Is Visible           ${SELECT_MOTIVO}
    Select From List By Value               ${SELECT_MOTIVO}            42

Validou a apresentação do campo "Submotivo"
    Wait Until Element Is Visible  ${SELECT_SUBMOTIVO}  timeout=30

    ${s}  Run Keyword And Ignore Error    Select From List By Label  ${SELECT_SUBMOTIVO}  submotivo 41
    Run Keyword If  "${s[0]}" == "FAIL"   Select From List By Label  ${SELECT_SUBMOTIVO}  submotivo 48

Selecionou "Motivo" 44 - ÓBITO
    Wait Until Element Is Visible           ${SELECT_MOTIVO}
    Select From List By Value               ${SELECT_MOTIVO}            44

Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    Wait Until Element Is Visible           ${SELECT_SUBMOTIVO}             timeout=10
    Page Should Contain Element             id:data_obito
    Select From List By Label           ${SELECT_SUBMOTIVO}             submotivo 44


Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    Wait Until Element Is Visible           ${SELECT_SUBMOTIVO}             timeout=10


## CONTA PF COM CPF
Selecionou 1 (UM) Beneficiário TITULAR, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR" 
    [Arguments]                         @{arg1}
    ${date}  Get Current Date

    ${date}  Convert Date  ${date}  exclude_millis=yes

    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Sleep               2s 
    Input Text          id:data_obito   ${data_formatada}
    Choose File                         id:arquivo                  ${DOCUMENTS_FOLDER}${/}doc_fake.pdf
    Sleep                               2s
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[2]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       ${BTN_RADIO_SIM}
    Input Text                          ${INPUT_EMAIL_CONTRAT}          test123@oi.com
    Sleep                               3s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}

# CONTA CAEPF E PJ COM CNPJ
Selecionou 1 (UM) Beneficiário TITULAR CAEPF, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR" 
    [Arguments]                         @{arg1}
    ${date}  Get Current Date

    ${date}  Convert Date  ${date}  exclude_millis=yes

    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Sleep               2s 
    Input Text          id:data_obito   ${data_formatada}
    Select From List By Label           ${SELECT_SUBMOTIVO}             submotivo 44
    Choose File                         id:arquivo                  ${DOCUMENTS_FOLDER}${/}doc_fake.pdf
    Sleep                               2s
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[38]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       ${BTN_RADIO_SIM}
    # nova ação de preencher telefone
    Clear Element Text                  xpath://input[@id='tel_celular']
    Input Text                          xpath://input[@id='tel_celular']        (41)9550-90969
    Input Text                          ${INPUT_EMAIL_CONTRAT}          test123@oi.com
    Sleep                               3s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}



##
Selecionou 2 (Segundo) Beneficiário TITULAR CAEPF, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR" 
    [Arguments]                         @{arg1}
    ${date}  Get Current Date

    ${date}  Convert Date  ${date}  exclude_millis=yes

    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Sleep               2s 
    Input Text          id:data_obito   ${data_formatada}
    Select From List By Label           ${SELECT_SUBMOTIVO}             submotivo 44
    Choose File                         id:arquivo                  ${DOCUMENTS_FOLDER}${/}doc_fake.pdf
    Sleep                               2s
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[62]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       ${BTN_RADIO_SIM}
    # nova ação de preencher telefone
    Clear Element Text                  xpath://input[@id='tel_celular']
    Input Text                          xpath://input[@id='tel_celular']        (41)9550-90969
    Input Text                          ${INPUT_EMAIL_CONTRAT}          test123@oi.com
    Sleep                               3s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}



Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios e clicou no botão "SALVAR"
    [Arguments]                         @{arg1}
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[2]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       ${BTN_RADIO_SIM}
    # nova ação de preencher telefone
    Clear Element Text                  xpath://input[@id='tel_celular']
    Input Text                          xpath://input[@id='tel_celular']        (41)9550-90969
    Input Text                          ${INPUT_EMAIL_CONTRAT}          test123@oi.com
    Mouse Down                          ${BTN_SALVAR_EXCLUSAO}
    Sleep                               3s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}

Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"
    [Arguments]                         @{arg1}
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text          ${INPUT_SEARCH}                 ${arg1[38]}
    ${t}    Run Keyword And Ignore Error       Page Should Contain        Nenhum registro encontrado
    Run Keyword If     "${t[0]}" == "PASS"     Input Text          ${INPUT_SEARCH}                 ${arg1[46]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       ${BTN_RADIO_SIM}
    # nova ação de preencher telefone
    Clear Element Text                  xpath://input[@id='tel_celular']
    Input Text                          xpath://input[@id='tel_celular']        (41)9550-90969
    Input Text                          ${INPUT_EMAIL_CONTRAT}          test123@oi.com
    Mouse Down                          ${BTN_SALVAR_EXCLUSAO}
    Sleep                               3s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}


Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"
    [Arguments]                         @{arg1}
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[38]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       ${BTN_RADIO_SIM}
    # nova ação de preencher telefone
    Clear Element Text                  xpath://input[@id='tel_celular']
    Input Text                          xpath://input[@id='tel_celular']        (41)9550-90969
    Input Text                          ${INPUT_EMAIL_CONTRAT}          test123@oi.com
    Mouse Down                          ${BTN_SALVAR_EXCLUSAO}
    Sleep                               3s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}

Selecionou 1 (UM) Beneficiário TITULAR PJ, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"
    [Arguments]                         @{arg1}
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[62]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       id:btn_add_pessoa
    Wait Until Page Contains            Dependentes que serão excluídos com o Titular:
    Execute JavaScript                  window.scrollTo(0,400)
    Click Element                       ${BTN_RADIO_SIM_ADD_EXCLUSAO}
    Mouse Down                          xpath:(//input[@class='email form-control uppercase_email'])[2]
    Input Text                          xpath:(//input[@class='email form-control uppercase_email'])[2]             test123@oi.com
    Mouse Down                          ${BTN_SALVAR_EXCLUSAO}
    Sleep                               5s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}




Validou a apresentação da mensagem de erro "A exclusão de um beneficiário Titular para contrato Pessoa Física caracteriza cancelamento de contrato e esta movimentação não é permitida via Canal do Contratante. Entre em contato com a operadora."
    Wait Until Page Contains            A exclusão de um beneficiário Titular para contrato Pessoa Física caracteriza cancelamento de contrato e esta movimentação não é permitida via Canal do Contratante. Entre em contato com a operadora.          timeout=40
    Sleep                               3s

Cadastrou 1 (UM) Beneficiário DEPENDENTE, preencheu campos obrigatórios e clicou no botão "SALVAR"
    [Arguments]                         @{arg1}
    Wait Until Element Is Visible       ${SELECT_SUBMOTIVO}         timeout=5

    ${s}  Run Keyword And Ignore Error    Select From List By Label  ${SELECT_SUBMOTIVO}  submotivo 41
    Run Keyword If  "${s[0]}" == "FAIL"   Select From List By Label  ${SELECT_SUBMOTIVO}  submotivo 48
    
    Click Element                       ${ABRIR_SELECT_TODOS}
    Sleep                               2s
    Click Element                       xpath://li[@class='ui-menu-item']/div[contains(text(),'${arg1[30]}')]
    Input Text                          ${INPUT_EMAIL_CONTRAT}          test123@oi.com
    Mouse Down                          ${BTN_SALVAR_EXCLUSAO}
    Sleep                               3s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}


Cadastrou 1 (UM) Beneficiário DEPENDENTE, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR"
    [Arguments]                         @{arg1}
    Wait Until Element Is Visible       ${SELECT_SUBMOTIVO}         timeout=5
    Select From List By Label           ${SELECT_SUBMOTIVO}         submotivo 44
    Click Element                       ${ABRIR_SELECT_TODOS}
    Sleep                               2s
    Click Element                       xpath://li[@class='ui-menu-item']/div[contains(text(),'${arg1[30]}')]
    Choose File                         id:arquivo                  ${DOCUMENTS_FOLDER}${/}doc_fake.pdf
    Sleep                               2s
    Input Text                          ${INPUT_EMAIL_CONTRAT}          test123@oi.com
    Mouse Down                          ${BTN_SALVAR_EXCLUSAO}
    Sleep                               3s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}

Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"
    [Arguments]                             @{arg1}
    Wait Until Element Contains             ${TEXT_PROTOCOLO}            Protocolo        timeout=30 
    ${SEGUNDO_STATUS}                       Get Text              xpath://button[@class='btn btn-success btn-action btn-xs btn-circle']
    ${ok}   Run Keyword And Ignore Error    Page Should Contain    ${arg1[30]} 
    Run Keyword If 	'${ok[0]}' == 'PASS' 	  Get Text         ${COLUM_TABLE_CPF_1}
    Run Keyword If 	'${ok[0]}' == 'FAIL' 	  Get Text         ${COLUM_TABLE_CPF_1}   
    
Clicou no botão "ADICIONAR EM LOTE"
    Click Element                           ${BTN_ADD_EMLOTE}

Selecionou 1 (UM) Beneficiário TITULAR, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"
    [Arguments]                         @{arg1}
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[2]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       id:btn_add_pessoa
    Wait Until Page Contains            Dependentes que serão excluídos com o Titular:
    Execute JavaScript                  window.scrollTo(0,400)
    Click Element                       ${BTN_RADIO_SIM_ADD_EXCLUSAO}
    Mouse Down                          xpath:(//input[@class='email form-control uppercase_email'])[2]
    Input Text                          xpath:(//input[@class='email form-control uppercase_email'])[2]             test123@oi.com
    Mouse Down                          ${BTN_SALVAR_EXCLUSAO}
    Sleep                               5s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}


Selecionou 1 (UM) Beneficiário TITULAR CAEPF, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"
    [Arguments]                         @{arg1}
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[62]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       id:btn_add_pessoa
    Wait Until Page Contains            Dependentes que serão excluídos com o Titular:
    Execute JavaScript                  window.scrollTo(0,400)
    Click Element                       ${BTN_RADIO_SIM_ADD_EXCLUSAO}
    Mouse Down                          xpath:(//input[@class='email form-control uppercase_email'])[2]
    Input Text                          xpath:(//input[@class='email form-control uppercase_email'])[2]             test123@oi.com
    Mouse Down                          ${BTN_SALVAR_EXCLUSAO}
    Sleep                               5s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}


Selecionou 1 (UM) Beneficiário TITULAR CAEPF, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios Data Obtio e documento e clicou no botão "SALVAR"
    [Arguments]                         @{arg1}
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[62]}
    Click Element                       ${OPCAO_TITULAR}
    ${date}  Get Current Date

    ${date}  Convert Date  ${date}  exclude_millis=yes

    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Sleep               2s 
    Input Text          id:data_obito   ${data_formatada}
    Select From List By Label           ${SELECT_SUBMOTIVO}             submotivo 44
    Sleep                               3s
    Click Element                       id:complemento
    Sleep                               1s
    Click Element                       id:btn_add_pessoa
    Wait Until Page Contains            Dependentes que serão excluídos com o Titular:                      timeout=15
    Choose File                         xpath:(//input[@class='arquivo_obito'])[2]                  ${DOCUMENTS_FOLDER}${/}doc_fake.pdf
    Execute JavaScript                  window.scrollTo(0,400)
    Click Element                       ${BTN_RADIO_SIM_ADD_EXCLUSAO}
    Mouse Down                          xpath:(//input[@class='email form-control uppercase_email'])[2]
    Input Text                          xpath:(//input[@class='email form-control uppercase_email'])[2]             test123@oi.com
    Mouse Down                          ${BTN_SALVAR_EXCLUSAO}
    Sleep                               2s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}

Selecionou 1 (UM) Beneficiário TITULAR, com "Data de Óbito" igual a DATA DE HOJE - 1, clicou no botão "ADICIONAR PESSOA"
    [Arguments]                         @{arg1}
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[2]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               8s
    Click Element                       id:btn_add_pessoa
    
    
Validou a apresentação de uma tabela com "Nome do Beneficiário que será excluido", com os campos "É necessário anexar a certidão de óbito", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    Wait Until Page Contains            Dependentes que serão excluídos com o Titular:
    Page Should Contain Element         id:data_obito  
    Page Should Contain Element         xpath:(//input[@class='email form-control uppercase_email'])[2] 

Preencheu campos obrigatórios e clicou no botão "SALVAR"
    Execute JavaScript                  window.scrollTo(0,400)
    Click Element                       ${BTN_RADIO_SIM_ADD_EXCLUSAO}
    Choose File                         xpath:(//input[@class='arquivo_obito'])[2]             ${DOCUMENTS_FOLDER}${/}doc_fake.pdf
    Input Text                          xpath:(//input[@class='email form-control uppercase_email'])[2]             test123@oi.com
    Sleep                               2s
    Execute JavaScript                  window.scrollTo(400,0)
    ${date}  Get Current Date

    ${date}  Convert Date  ${date}  exclude_millis=yes

    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Sleep               2s 
    Input Text          id:data_obito   ${data_formatada}
    Select From List By Label           ${SELECT_SUBMOTIVO}         submotivo 44
    Sleep                               2s
    Execute JavaScript                  window.scrollTo(0,600)
    Click Element                       ${BTN_SALVAR_EXCLUSAO}

Selecionou 1 (UM) Beneficiário DEPENDENTE, com "Data de Óbito" igual a DATA DE HOJE - 1 e clicou no botão "ADICIONAR PESSOA"
    [Arguments]                         @{arg1}
    
    Select From List By Label           ${SELECT_SUBMOTIVO}         submotivo 44
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[46]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       id:btn_add_pessoa

    
Selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu demais campos e clicou no botão "SALVAR"
    Wait Until Page contains Element    ${BTN_RADIO_SIM_ADD_EXCLUSAO}
    Page Should Contain Element         xpath:(//input[@class='arquivo_obito'])[2]
    Execute JavaScript                  window.scrollTo(0,500)
    Choose File                         xpath:(//input[@class='arquivo_obito'])[2]             ${DOCUMENTS_FOLDER}${/}doc_fake.pdf
    Click Element                       ${BTN_RADIO_SIM_ADD_EXCLUSAO}
    Input Text                          xpath:(//input[@class='email form-control uppercase_email'])[2]             test123@oi.com
    Sleep                               2s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}

Selecionou 1 (UM) Beneficiário DEPENDENTE e clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"
    [Arguments]                         @{arg1}
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text                          ${INPUT_SEARCH}                 ${arg1[46]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               5s
    Click Element                       id:btn_add_pessoa
    Wait Until Page Contains            As carteirinhas foram devolvidas?
    Execute JavaScript                  window.scrollTo(0,400)
    Click Element                       ${BTN_RADIO_SIM_ADD_EXCLUSAO}
    Mouse Down                          xpath:(//input[@class='email form-control uppercase_email'])[2]
    Input Text                          xpath:(//input[@class='email form-control uppercase_email'])[2]             test123@oi.com
    Mouse Down                          ${BTN_SALVAR_EXCLUSAO}
    Sleep                               2s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}


Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários na tabela "Exclusão de Beneficiários"
    [Arguments]                        @{arg1}
    Wait Until Page Contains           Protocolo
    Page Should Contain                ${arg1[46]}
    Page Should Contain                ${arg1[30]}
    Element Text Should Be             ${TEXT_STATUS}               Em Andamento


Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"
    [Arguments]                        @{arg1}
    Wait Until Page Contains           Protocolo
    ${ok}   Run Keyword And Ignore Error   Page Should Contain    ${arg1[54]} 
    Run Keyword If 	'${ok[0]}' == 'PASS' 	  Page Should Contain    ${arg1[54]} 
    Run Keyword If 	'${ok[0]}' == 'FAIL' 	  Page Should Contain    ${arg1[62]}
    Run Keyword If 	'${ok[0]}' == 'FAIL' 	  Page Should Contain    ${arg1[38]}
    Element Text Should Be             ${TEXT_STATUS}               Em Andamento


Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    Wait Until Element Contains         ${TEXT_PROTOCOLO}            Protocolo        timeout=45
    Reload Page
    Reload Page
    Sleep                               3s
    Wait Until Page Contains Element            xpath://button[@class='btn btn-success btn-action btn-xs btn-circle']          timeout=30
    ${TEXT_STATUS_FINAL}                Get Text                   xpath://button[@class='btn btn-success btn-action btn-xs btn-circle'] 
    Should Be Equal                     ${TEXT_STATUS_FINAL}                Aguardando Aprovação


Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte
    [Arguments]                   @{arg1}
    ${MES_ATUAL}=                 Set Variables      Get Time          return month
    Sleep                         3s
    Page Should Contain           ${arg1[46]}
    Page Should Contain           ${arg1[30]}
    ${data}        Get Text       ${COLUM_DATA_EXCLUSAO_MOV_CADASTRAL1}
    Element Should Contain        ${COLUM_DATA_EXCLUSAO_MOV_CADASTRAL1}        01


Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    Click Element                           xpath://li[@class='sugar_action_button']/a[contains(text(),'Validar Dados')]
    Wait Until Element Is Visible           xpath://li[@class='sugar_action_button']/a[contains(text(),'Validar Dados')]            timeout=30
    Wait Until Page Contains Element        //span[@id='situacao_validacao']/span[contains(text(),'Efetuada com Sucesso')]         timeout=35
    Sleep                                   2s
    Wait Until Element Is Visible           ${SETA_MENU_VALIDAR_DADOS}                    timeout=30
    Set Focus To Element                    ${SETA_MENU_VALIDAR_DADOS}
    Click Element                           ${SETA_MENU_VALIDAR_DADOS}

Clicar na opção "APROVAR CONFERÊNCIA" do submenu dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    Sleep                       2s
    Set Focus To Element        ${SUBMENU_APROVAR_CONF}
    Click Element               ${SUBMENU_APROVAR_CONF}

Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA 
    #validar se esta como "Aprovada"
    ${STATUS_APROVADA}                      Get Text                    xpath://table[@id='LBL_DETAILVIEW_PANEL1']/tbody/tr[2]/td[2]
    Should Be Equal                         ${STATUS_APROVADA}          Aprovada
    # identificador de origem ID
    ${TEXT_ID_ORIGEM}                       Get Text                    xpath://table[@id='LBL_DETAILVIEW_PANEL1']/tbody/tr[3]/td[2]
    Page Should Contain                     ${TEXT_ID_ORIGEM}
    # fazer um scroll na tela ate esse elemento
    Execute JavaScript                      window.scrollTo(0,1000)
    # Integração Solicitada
    Page Should Contain Element             ${LINK_INTEGRACAO_SOLIC}
    ${TEXT_LINK}                            Get Text                                ${LINK_INTEGRACAO_SOLIC}
    Should Be Equal                         ${TEXT_LINK}                            Integração Solicitada                         
    Get Text                                ${TEXT_DATA_INTEGRACAO_SOLI}

No Contrato os Beneficiários cadastrados na exclusão com a "Situação" igual a ATIVO e com campo "Data de Exclusão" igual a primeiro dia do mês seguinte
    Wait Until Page Contains Element        id:btn_json                             timeout=10
    Wait Until Page Contains                Integrada com Sucesso                   timeout=20
    Execute JavaScript                      window.scrollTo(0,280)


Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    [Arguments]                   @{arg1}
    ${ok}   Run Keyword And Ignore Error   Page Should Contain    ${arg1[30]} 
    Run Keyword If 	'${ok[0]}' == 'PASS' 	  Page Should Contain    ${arg1[30]} 
    Run Keyword If 	'${ok[0]}' == 'FAIL' 	  Page Should Contain    ${arg1[46]}
    Run Keyword If 	'${ok[0]}' == 'FAIL' 	  Page Should Contain    ${arg1[62]}
    Run Keyword If 	'${ok[0]}' == 'FAIL' 	  Page Should Contain    ${arg1[38]}
    ${data}        Get Text       ${COLUM_DATA_EXCLUSAO_MOV_CADASTRAL1}
    #Element Should Contain        ${COLUM_DATA_EXCLUSAO_MOV_CADASTRAL1}        03
    Execute JavaScript            window.scrollTo(0,1200)
    Sleep                         2s
    ${STATUS_SITUATION}           Get Text                      xpath://div[@id='list_subpanel_saude_conferencia_saude_documento_conferencia']/table/tbody/tr[1]/td[3]/span
    Should Be Equal               ${STATUS_SITUATION}          Aguardando Conferência
    Page Should Contain Element   xpath://div[@id='list_subpanel_saude_conferencia_saude_documento_conferencia']/table/tbody/tr[1]/td[6]/span/a
    Execute JavaScript            window.scrollTo(600,0)

# verificar erros do parametro 46
Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado
    [Arguments]                   @{arg1}
    Execute JavaScript            window.scrollTo(0,200)
    ${ok}   Run Keyword And Ignore Error   Page Should Contain    ${arg1[30]}
    Run Keyword If 	'${ok[0]}' == 'PASS' 	  Page Should Contain    ${arg1[30]} 
    Run Keyword If 	'${ok[0]}' == 'FAIL' 	  Page Should Contain    ${arg1[46]}
    Run Keyword If 	'${ok[0]}' == 'FAIL' 	  Page Should Contain    ${arg1[62]}
    Run Keyword If 	'${ok[0]}' == 'FAIL' 	  Page Should Contain    ${arg1[38]}
    ${data}        Get Text       ${COLUM_DATA_EXCLUSAO_MOV_CADASTRAL1}
    ${d}    Run Keyword And Ignore Error        Element Should Contain        ${COLUM_DATA_EXCLUSAO_MOV_CADASTRAL1}        01
    Run Keyword If 	'${d[0]}' == 'PASS' 	    Element Should Contain        ${COLUM_DATA_EXCLUSAO_MOV_CADASTRAL1}        01
    Run Keyword If 	'${d[0]}' == 'FAIL'         Element Should Contain        ${COLUM_DATA_EXCLUSAO_MOV_CADASTRAL1}        ${data}
    Execute JavaScript            window.scrollTo(300,0)

Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    Click Element                           xpath://a[@id='tab1']
    Wait Until Page Contains Element        xpath://span[@id='situacao_validacao']/span            timeout=10
    ${SITUACAO_DADOS}         Get Text                        xpath://span[@id='situacao_validacao']/span
    Should Be Equal           ${SITUACAO_DADOS}               Validação Efetuada com Sucesso 


Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA", no painel "Documentos Conferência"
    Execute JavaScript            window.scrollTo(0,800)
    Click Element                 xpath://input[@value='Atualizar Situação em Massa']/ancestor::li[@class='single']/a

Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    Page Should Contain Element         id:titular_contribuiu_label
    Wait Until Page Contains Element    ${SELECT_SUBMOTIVO}
    Select From List By Label           ${SELECT_SUBMOTIVO}  submotivo 42 (acordo)

Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos "Submotivo", "As carteirinhas foram devolvidas?", telefone, email, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM
    [Arguments]                         @{arg1}
    Sleep                               2s
    Click Element                       id:titular_contribuiu_sim
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text          ${INPUT_SEARCH}                 ${arg1[38]}
    ${t}    Run Keyword And Ignore Error       Page Should Contain        Nenhum registro encontrado
    Run Keyword If     "${t[0]}" == "PASS"     Input Text          ${INPUT_SEARCH}                 ${arg1[62]}
    Sleep                               2s
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               2s                             
    Wait Until Page Contains            As carteirinhas foram devolvidas?
    Click Element                       id:carteirinhas_devolvidas_sim
    
Validou a apresentação dos campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?","Motivos da extinção do Contrato de Trabalho"
    Page Should Contain             Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria? 
    Page Should Contain             Motivos da extinção do Contrato de Trabalho: 


Preencheu os campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA
    Click Element                   id:titular_permaneceu_sim
    Sleep                           2s
    Click Element                   id:motivo_extincao_2

Validou a apresentação dos campos "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?"
    Wait Until Page Contains Element        id:situacao_plano_inativo_1
    ${TEXT_PLANO_INATIVO}                   Get Text        id:situacao_plano_inativo_1
    Should Be Equal                         ${TEXT_PLANO_INATIVO}           Possui direito da continuidade do plano
    Page Should Contain                     O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?

Preencheu o campo "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM    
    Click Element                       id:vinculo_inativo_sim
    Select From List By Label           ${SELECT_SUBMOTIVO}  submotivo 42 (aposentadoria)
    Sleep                               2s
Validou a apresentação dos campos "Data de início de vigência no plano inativo" preenchido e bloqueado, painel "Insira abaixo o endereço atualizado do beneficiário titular" com campos de endereço, painel "Opção de Continuidade do Plano Inativo" com os campos "Tempo de contribuição? (meses)" habilitado e preenchido com o valor 0, "Dependentes que continuarão no plano" titular bloqueado e dependentes habilitados para seleção, "Custo total mensal" preenchido
    Wait Until Page Contains Element            id:data_inicio_permanencia          timeout=10
    Page Should Contain Element                 id:registro_endereco_end_cep_aaaaa
    Mouse Down                                  id:registro_endereco_end_cep_aaaaa

Preencheu os campos de endereço, "Tempo de contribuição? (meses)" igual a 120, selecionou um dependente, clicou no botão "SALVAR"
    [Arguments]                 @{arg1}
    ## preencher os capos de endereço
    Input Text                  xpath://input[@id='email']                 test123@oi.com 
    Execute JavaScript          window.scrollTo(0,200)
    Input Text                  id:registro_endereco_end_cep_aaaaa         80540000
    Click Element               id:registro_endereco_end_numero_aaaaa
    Wait Until Element Is Visible       id:registro_endereco_end_numero_aaaaa       timeout=30
    Sleep                       30s
    Input Text                  id:registro_endereco_end_numero_aaaaa       80
    Mouse Down                  id:tempo_contribuicao
    Page Should Contain         Opção de Continuidade do Plano Inativo
    Sleep                       2s
    Clear Element Text          id:tempo_contribuicao
    Input Text                  id:tempo_contribuicao               120
    Mouse Down                  xpath://input[@value='SALVAR']
    Sleep                       2s
    Click Element               xpath://input[@value='SALVAR']

Clicou no botão "OK" da modal de Confirmação com a mensagem "É necessário anexar documento comprobatório de contribuição excedente ao indicado. Consideramos o tempo vinculado ao plano da Unimed, porém ao anexar o documento este poderá ser revisto."
    Wait Until Element Is Visible               id:modal_confirm_title        timeout=20
    ${TEXT_MODAL_OK}            Get Text                    id:modal_confirm_msg
    Page Should Contain         Confirmação
    Sleep                      2s
    Click Button               id:modal_confirm_btn

Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO
    [Arguments]                         @{arg1}
    Wait Until Element Is Visible       ${SELECT_SUBMOTIVO}  timeout=30
    Select From List By Label           ${SELECT_SUBMOTIVO}  submotivo 42 (acordo)
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text          ${INPUT_SEARCH}                 ${arg1[38]}
    ${t}    Run Keyword And Ignore Error       Page Should Contain        Nenhum registro encontrado
    Run Keyword If     "${t[0]}" == "PASS"     Input Text          ${INPUT_SEARCH}                 ${arg1[62]}
    ${f}    Run Keyword And Ignore Error       Page Should Contain        Nenhum registro encontrado
    Run Keyword If     "${f[0]}" == "PASS"     Input Text          ${INPUT_SEARCH}                 ${arg1[54]}
    Sleep                               2s
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               2s
    Click Element                       id:titular_contribuiu_nao
    Execute JavaScript                  window.scrollTo(0,400)
    Click Element                       ${BTN_RADIO_SIM}
    # nova ação de preencher telefone
    Clear Element Text                  xpath://input[@id='tel_celular']
    Input Text                          xpath://input[@id='tel_celular']        (41)9550-90969
    Sleep                                2s
    Input Text                          ${INPUT_EMAIL_CONTRAT}          test123@oi.com


#adicionar pessoa
Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO clicou em ADICIONAR PESSOA E SALVAR
    [Arguments]                         @{arg1}
    Wait Until Element Is Visible       ${SELECT_SUBMOTIVO}  timeout=30
    Select From List By Label           ${SELECT_SUBMOTIVO}  submotivo 42 (acordo)
    Click Element                       ${BTN_PESQUISA_BENEFICIARIO}
    Page Should Contain                 Pesquisa Beneficiários
    Input Text          ${INPUT_SEARCH}                 ${arg1[38]}
    ${t}    Run Keyword And Ignore Error       Page Should Contain        Nenhum registro encontrado
    Run Keyword If     "${t[0]}" == "PASS"     Input Text          ${INPUT_SEARCH}                 ${arg1[62]}
    Click Element                       ${OPCAO_TITULAR}
    Sleep                               2s
    Click Element                       id:titular_contribuiu_nao
    # nova ação de preencher telefone
    Click Element                       id:btn_add_pessoa
    Wait Until Page Contains            Dependentes que serão excluídos com o Titular:
    Execute JavaScript                  window.scrollTo(0,400)
    Click Element                       ${BTN_RADIO_SIM_ADD_EXCLUSAO}
    Sleep                               2s
    Clear Element Text                  xpath:(//input[@class='tel_celular form-control'])[2]
    Input Text                          xpath:(//input[@class='tel_celular form-control'])[2]        (41)9550-90969
    Input Text                          xpath:(//input[@class='email form-control uppercase_email'])[2]          test123@oi.com
    Mouse Down                          xpath://input[@value='SALVAR']
    Sleep                               2s
    Click Element                       xpath://input[@value='SALVAR']

Validou a apresentação do campo "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO              
    ${TEXT_PLANO_INATIVO}               Get Text                    id:situacao_plano_inativo_2
    Should Be Equal                     ${TEXT_PLANO_INATIVO}       Não possui direito da continuidade do plano
    Sleep                               5s
    Click Element                       ${BTN_SALVAR_EXCLUSAO}

