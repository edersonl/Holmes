*** Settings ***
Library     SeleniumLibrary
Resource    ../../../main.resource
*** Variables ***
${SLEEP} =  0
${PESQ_CAMP_NOME_CONVENIO} =  xpath://*[@id="name_advanced"]
${PESQ_BT_PESQUSAR} =  xpath://*[@id="search_form_submit"]
${RESULT_PESQ_CONVENIO} =  xpath:/html/body/table[4]/tbody[2]/tr[1]/td[2]/a
${TITULO} =  xpath:/html/body/table[1]/tbody/tr/td[1]/h3/span
${TIMEOUT} =  30

*** Keywords ***
Verificar se o Popup Pesquisa Convênio Abriu
    Wait Until Element Contains  ${TITULO}  Pesquisar Convênio  timeout=${TIMEOUT}

Preencher Campo Nome Convênio com
    [Arguments]  ${arg1}
    Input Text  ${PESQ_CAMP_NOME_CONVENIO}  ${arg1}
    Sleep  ${SLEEP}

Apertar Botão Pesquisar
    Click Button  ${PESQ_BT_PESQUSAR}

Apertar Botão Limpar
    Click Button  ${BOTAO_LIMPAR}

Verificar Resultado da Pesquisa Nome Conta com os dados   
    [Arguments]  ${arg1}
    Wait Until Element Contains  ${RESULT_PESQ_CONVENIO}  ${arg1}  timeout=${TIMEOUT}

Clicar no Resultado de Pesquisa Nome Conta
    Click Link  ${RESULT_PESQ_CONVENIO}