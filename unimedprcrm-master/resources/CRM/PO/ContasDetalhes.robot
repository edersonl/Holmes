*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TIMEOUT} =  30
${CONTA_DET_BOTAO_CRIAR_OPO} =  xpath://*[@id="Opportunities_criar_button"]

*** Keywords ***
Apresentar a Tela Detalhes da Conta
    [Arguments]  ${arg1}
    ${temp}  Convert To Uppercase  ${arg1}
    ${mensagem} =  Catenate  Contas »  ${temp}
    Wait Until Page Contains  ${mensagem}  timeout=${TIMEOUT}

Apertar Botão Criar Oportunidade do Detalhes de Conta
    Set Focus To Element  ${CONTA_DET_BOTAO_CRIAR_OPO}
    Click Element  ${CONTA_DET_BOTAO_CRIAR_OPO}
