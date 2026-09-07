*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SLEEP} =  0
${PESQ_NOME_CONTA} =  xpath://*[@id="name_advanced"]
${TIPO_PESSOA} =  xpath://*[@id="account_type_advanced"]
${BOTAO_PESQUISAR} =  xpath://*[@id="search_form_submit"]
${BOTAO_LIMPAR} =  xpath://*[@id="search_form_clear"]
${RESULTADO_NOME_CONTA} =  xpath:/html/body/table[4]/tbody[2]/tr[1]/td[1]/a
${RESULTADO_TIPO_PESSOA} =  xpath:/html/body/table[4]/tbody[2]/tr[1]/td[4]
${TITULO} =  xpath:/html/body/table[1]/tbody/tr/td[1]/h3/span
${TIMEOUT} =  30

*** Keywords ***
Verificar se o Popup Pesquisa Conta Abriu
    Wait Until Element Contains  ${TITULO}  Pesquisar Conta  timeout=${TIMEOUT}

Preencher Campo Nome Conta com
    [Arguments]  ${arg1}
    Input Text  ${PESQ_NOME_CONTA}  ${arg1}
    Sleep  ${SLEEP}

Colocar Tipo Pessoa com
    [Arguments]  ${arg1}
    Select From List By Label  ${TIPO_PESSOA}  ${arg1}
    Sleep  ${SLEEP}

Apertar Botão Pesquisar
    Click Button  ${BOTAO_PESQUISAR}

Apertar Botão Limpar
    Click Button  ${BOTAO_LIMPAR}

Verificar Resultado da Pesquisa Nome Conta com os dados   
    [Arguments]  @{arg1}
    Wait Until Element Contains  ${RESULTADO_NOME_CONTA}  ${arg1[1]}  timeout=${TIMEOUT}
    Wait Until Element Contains  ${RESULTADO_TIPO_PESSOA}  ${arg1[0]}  timeout=${TIMEOUT}

Clicar no Resultado de Pesquisa Nome Conta
    Click Link  ${RESULTADO_NOME_CONTA}