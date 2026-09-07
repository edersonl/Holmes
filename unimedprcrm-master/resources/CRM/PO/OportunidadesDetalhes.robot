*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary
Resource    ../../../utils/Comum.robot

*** Variables ***
${TIMEOUT} =  30
${OPO_DET_BOTAO_CRIAR_COTACAO} =  xpath://*[@id="AOS_Quotes_criar_button"]
${SETA_EDITAR} =  xpath://*[@id="detail_header_action_menu"]/li/span
${CRIAR_PORTABILIDADE} =  xpath://*[@id="detail_header_action_menu"]/li/ul/..//a[contains(.,'Criar')]


*** Keywords ***
Apresentar a Tela Detalhes da Oportunidade
    [Arguments]  ${arg1}
    Log  ${arg1}
    ${temp}  Remover Caracteres Especiais  ${arg1}
    ${temp}  Convert To Uppercase  ${temp}
    ${mensagem} =  Catenate  Oportunidades »  ${temp}
    Wait Until Page Contains  ${mensagem}  timeout=${TIMEOUT}

Apertar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Sleep  3s
    Set Focus To Element  ${OPO_DET_BOTAO_CRIAR_COTACAO}
    Click Element  ${OPO_DET_BOTAO_CRIAR_COTACAO}

Clicar no submenu "Criar Portabilidade"
    Wait Until Page Contains    Oportunidades »     timeout=${TIMEOUT}
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${CRIAR_PORTABILIDADE}

Clicar no registro da Cotação
    [Arguments]  ${arg1}
    Wait Until Page Contains    Oportunidades »     timeout=${TIMEOUT}
    Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[2]/span/a[contains(.,'${arg1}')]
    Click Element    xpath://*[@id="subPanel"]/tbody/tr/td[2]/span/a[contains(.,'${arg1}')]
    