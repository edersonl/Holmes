*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary
Resource    ../../../main.resource
*** Variables ***
${BOTAO_CRIAR_PONTENCIAL_CLIENTE} =  xpath://*[@id="create_link"]
${TIMEOUT} =  30
${RESULTADO_POT} =  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[4]/b/a

*** Keywords ***
Verificar Página Ponteciais Cliente Pesquisa
    Wait Until Element Contains  xpath://*[@id="pagecontent"]/div[1]/h2    Potencial Cliente » Pesquisar    timeout=${TIMEOUT}

Aperta Botão Criar Ponteciais Clientes
    Click Link  ${BOTAO_CRIAR_PONTENCIAL_CLIENTE}

Preencher Campo Nome na Pesquisa
    [Arguments]  ${pesquisanome}
    Wait Until Page Contains Element  xpath://input[@id="first_name_advanced"]   timeout=${TIMEOUT}
    Input Text  xpath://input[@id="first_name_advanced"]  ${pesquisanome}  clear=True

Preencher Campo CPF/CNPJ/CAEPF na Pesquisa
    [Arguments]  ${cpfcnpjcaepf}
    Wait Until Page Contains Element  xpath://input[@id="poc_cpf_cnpj_c_advanced"]   timeout=${TIMEOUT}
    ${cpfcnpjcaepf} =  Remove String  ${cpfcnpjcaepf}  .  /  -
    Log  ${cpfcnpjcaepf}
    Input Text  xpath://input[@id="poc_cpf_cnpj_c_advanced"]  ${cpfcnpjcaepf}  clear=True

Preencher Campo Nome da Conta / Razão Social na Pesquisa
    [Arguments]  ${nomecontarazaosocial}
    Wait Until Page Contains Element  xpath://input[@id="account_name_advanced"]   timeout=${TIMEOUT}
    Input Text  xpath://input[@id="account_name_advanced"]  ${nomecontarazaosocial}  clear=True

Aperta Botão Pesquisar
    Wait Until Page Contains Element  xpath://input[@id="search_form_submit_advanced"]   timeout=${TIMEOUT}
    Click Element  xpath://input[@id="search_form_submit_advanced"]

Aperta Botão Limpar
    Wait Until Page Contains Element  xpath://*[@id="search_form_clear_advanced"]   timeout=${TIMEOUT}
    Click Element  xpath://*[@id="search_form_clear_advanced"]

Resultado da Pesquisa de Potencial Cliente
    [Arguments]  @{arg1}
    #validar o nome no resultado
    Wait Until Element Contains  ${RESULTADO_POT}  ${arg1[1]}  timeout=${TIMEOUT}
    #validar cpf/cnpj/caepf no resultado
    Wait Until Page Contains Element  xpath://*[@id="MassUpdate"]/table/tbody/*/td[contains(text(), '${arg1[3]}')]  timeout=${TIMEOUT}
    

Resultado da Pesquisa de Potencial Cliente com
    [Arguments]  @{arg1}  #arg0 Nome Conta, arg1 Nome, arg2 cpf/cnpj/caepf
    #validar o nome no resultado
    Wait Until Element Contains  ${RESULTADO_POT}  ${arg1[0]}  timeout=${TIMEOUT}

Clicar no Resultado de Pesquisa Potencial Cliente
    Set Focus To Element  ${RESULTADO_POT}
    Click Link  ${RESULTADO_POT}

