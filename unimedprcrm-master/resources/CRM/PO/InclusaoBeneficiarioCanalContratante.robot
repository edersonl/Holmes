*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary


*** Variables ***
${TIMEOUT} =  30
${DATA_BASE_CARENCIA} =  xpath:(//span[contains(.,'Com Carência - Com DS - Com CPT')])[2]


*** Keywords ***
Validou que o campo "Usuário Canal do Contratante" está preenchido
    Wait Until Page Contains  Conferência »  timeout=${TIMEOUT}
    ${USUARIO_CANAL}  Get Text  id:saude_portal_usuarios_id1_c
    Should Be Equal  ${USUARIO_CANAL}  Prime Automação

Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)
    ${date}  Get Current Date
    ${date}  Add Time To Date  ${date}     3 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Page Should Contain  ${data_formatada}
    ${date}  Get Current Date
    ${date}  Add Time To Date  ${date}     9 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Page Should Contain  ${data_formatada}

Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" - 301 DIAS para todos os beneficiários
    #Titular
    ${date}  Get Current Date
    ${date}  Add Time To Date  ${date}     1 days
    ${date}  Add Time To Date  ${date}     -301 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Page Should Contain  ${data_formatada}
    #Filho
    ${date}  Get Current Date
    ${date}  Add Time To Date  ${date}     3 days
    ${date}  Add Time To Date  ${date}     -301 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Page Should Contain  ${data_formatada}
    #Filho Adotivo
    ${date}  Get Current Date
    ${date}  Add Time To Date  ${date}     9 days
    ${date}  Add Time To Date  ${date}     -301 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Page Should Contain  ${data_formatada}

Clicou na aba "Movimentação Cadastral"
    Set Focus To Element  id:tab4
    Click Element  id:tab4

No Contrato os Beneficiários incluidos
    Wait Until Page Contains  Solicitação de Integração  timeout=${TIMEOUT}
    Page Should Contain  Inclusão do beneficiário efetuada com sucesso.


Validou que a coluna "Data Base Carência" foi preenchido
    Wait Until Page Contains  Beneficiários - Inclusão  timeout=${TIMEOUT}
    ${d}  Run Keyword And Ignore Error     Get Text  ${DATA_BASE_CARENCIA}
    Run Keyword If  "${d[0]}" == "FAIL"    Get Text  xpath:(//span[contains(.,'Com Carência - Com DS')])[2]
