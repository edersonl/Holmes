*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30

*** Keywords ***
Verificar Tela de Cadastro Pontecial Cliente
    Wait Until Page Contains  Potencial Cliente » Criar  timeout=${TIMEOUT}

Colocar o tipo Pessoa como Pessoa Física
    # Selecionar Tipo de Pessoa
    Wait Until Element Is Visible    xpath=//select[@id="tipo_pessoa_c"]
    Select From List By Label  xpath=//select[@id="tipo_pessoa_c"]  Pessoa Física
    Sleep  ${SLEEP}

Colocar o tipo Pessoa como Pessoa Jurídica(CNPJ)
    # Selecionar Tipo de Pessoa
    Sleep  5s
    Select From List By Label  xpath=//select[@id="tipo_pessoa_c"]  Pessoa Jurídica (CNPJ)
    Sleep  ${SLEEP}

Colocar o tipo Pessoa como Pessoa Jurídica(CAEPF)
    # Selecionar Tipo de Pessoa
    Wait Until Element Is Visible    xpath=//select[@id="tipo_pessoa_c"]
    Select From List By Label  xpath=//select[@id="tipo_pessoa_c"]  Pessoa Jurídica (CAEPF)
    Sleep  ${SLEEP}

Preencher Nome/Fantasia com 
    [Arguments]  ${nomeconta}
    # Preencher Nome da Conta
    Input Text  xpath=//input[@id="EditView_account_name"]  ${nomeconta}
    Sleep  ${SLEEP}

Preencher Nome com
    [Arguments]  ${nomecliente}
    # Preencher Nome
    Select From List By Label    xpath=//select[@id="salutation"]  Sr.
    Input Text  xpath=//input[@id="first_name"]   ${nomecliente}
    Sleep  ${SLEEP}

Preencher CPF/CNPJ/CAEPF com
    [Arguments]  @{cpf}
    Input Text  xpath=//input[@id="poc_cpf_cnpj_c"]  ${cpf}
    Set Focus To Element  xpath=//input[@id="first_name"] 
    Wait Until Page Contains  Disponível para solicitar reserva de mercado  timeout=30
    Sleep  ${SLEEP}

Preencher Número de Vidas com
    [Arguments]  ${numvidas}
    Input Text  xpath=//input[@id="poc_nro_vida_c"]  ${numvidas}
    Sleep  ${SLEEP}

Preencher Email com
    [Arguments]  ${email}
    Input Text  xpath=//input[@id="Leads0emailAddress0"]  ${email}
    Sleep  ${SLEEP}

Preencher Telefone Residencial com
    [Arguments]  ${telres}
    Input Text  xpath=//input[@id="phone_home"]  ${telres}
    Sleep  ${SLEEP}

Preencher Telefone Celular com
    [Arguments]  ${telcel}
    Input Text  xpath=//input[@id="phone_mobile"]  ${telcel}
    Sleep  ${SLEEP}

Preencher Telefone Comercial com
    [Arguments]  ${telcom}
    Input Text  xpath=//input[@id="phone_work"]  ${telcom}
    Sleep  ${SLEEP}

Preencher Razão Social com
    [Arguments]  ${razao}
    Input Text  xpath=//input[@id="poc_razao_social_c"]  ${razao}
    Sleep  ${SLEEP}

Preencher Porte da Empresa com
    [Arguments]  ${porEmpresa}
    # Preencher Nome
    Select From List By Label    xpath=//select[@id="tipo_empresa_c"]  ${porEmpresa}
    Sleep  ${SLEEP}

Preencher Tipo Estabelecimento com
    [Arguments]  ${porEmpresa}
    # Preencher Nome
    Select From List By Label    xpath=//select[@id="tipo_estabelecimento_c"]  ${porEmpresa}
    Sleep  ${SLEEP}

Preencher Natureza Jurídica com
    [Arguments]  ${natJur}
    # Preencher Nome
    Select From List By Value    xpath=//select[@id="natureza_juridica_c"]  ${natJur}
    Sleep  ${SLEEP}

Apertar Botão Salvar Pontecial Cliente 
    # Clicar em Salvar
    Set Focus To Element  xpath=//input[@id="SAVE_HEADER"]
    Click Button  xpath=//input[@id="SAVE_HEADER"]

Apresentar a Modal de Preencher Endereço
    Wait Until Page Contains  Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?

Apertar Botão Não do Modal
    Click Button  xpath=//button[@id="yui-gen1-button"]