*** Settings ***
Library    SeleniumLibrary
Resource    ../../../main.resource
*** Variables ***
${BOTAO_CRIAR_CONTAS} =  xpath://*[@id="create_link"]
${TITULO_CONTAS_PESQUISA} =  xpath://*[@id="pagecontent"]/div[1]/h2
${TIMEOUT} =  30
${CONTA_NOME_CONTA_RAZAO} =  xpath://*[@id="name_basic"]
${CONTA_TIPO} =  xpath://*[@id="account_type_basic"]
${CONTA_RESULT_NOME_CONTA} =  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]/b/a
${CONTA_RESULT_TIPO} =  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[5]
${CONTA_BOTAO_PESQUISAR} =  xpath://input[@id="search_form_submit"]
${CONTA_BOTAO_LIMPAR} =  xpath://input[@id="search_form_clear"]


*** Keywords ***
Verificar Página Contas Pesquisa
    Wait Until Page Contains  Contas » Pesquisar  timeout=${TIMEOUT}
    
Aperta Botão Criar Contas
    Click Link  ${BOTAO_CRIAR_CONTAS}

Preencher Campo Nome da Conta / Razão Social na Pesquisa
    [Arguments]  ${nomecontarazaosocial}
    Wait Until Page Contains Element  ${CONTA_NOME_CONTA_RAZAO}  timeout=${TIMEOUT}
    Input Text  ${CONTA_NOME_CONTA_RAZAO}  ${nomecontarazaosocial}  clear=True

Preencher Campo CPF/CNPJ/CAEPF na Pesquisa
    [Arguments]  ${cpfcnpjcaepf}
    Wait Until Page Contains Element  xpath://input[@id="cnpj_mf_c_basic"]   timeout=${TIMEOUT}
    ${cpfcnpjcaepf} =  Remove String  ${cpfcnpjcaepf}  .  /  -
    Log  ${cpfcnpjcaepf}
    Input Text  xpath://input[@id="cnpj_mf_c_basic"]  ${cpfcnpjcaepf}  clear=True

Colocar Tipo Pessoa com
    [Arguments]  ${arg1}
    Wait Until Page Contains Element  ${CONTA_TIPO}  timeout=${TIMEOUT}
    Select From List By Label  ${CONTA_TIPO}  ${arg1}

Aperta Botão Pesquisar Contas
    Wait Until Page Contains Element  ${CONTA_BOTAO_PESQUISAR}  timeout=${TIMEOUT}
    Click Element  ${CONTA_BOTAO_PESQUISAR}

Aperta Botão Limpar Pesquisar Contas
    Wait Until Page Contains Element  ${CONTA_BOTAO_LIMPAR}  timeout=${TIMEOUT}
    Click Element  ${CONTA_BOTAO_LIMPAR}

Resultado da Pesquisa de Contas
    [Arguments]  @{arg1}
    Wait Until Element Contains  ${CONTA_RESULT_NOME_CONTA}  ${arg1[1]}  timeout=${TIMEOUT}
    Wait Until Element Contains  ${CONTA_RESULT_TIPO}  ${arg1[0]}  timeout=${TIMEOUT}

Apertar no Resultado da Pesquisa de Contas
    Click Link  ${CONTA_RESULT_NOME_CONTA}