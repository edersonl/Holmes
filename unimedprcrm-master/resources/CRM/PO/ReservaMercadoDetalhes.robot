*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TIMEOUT} =  30
${RES_NOME_CONTA} =  xpath://*[@id="account_id_c"]

*** Keywords ***
Verificar se está na Tela Reserva de Mercado
    Wait Until Page Contains  Reserva de Mercado »  ${TIMEOUT}

Apertar no Nome da Conta na tela Detalhes de Reserva de Mercado
    Set Focus To Element  ${RES_NOME_CONTA}
    Click Element  ${RES_NOME_CONTA}