*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BOTAO_CRIAR_PONTENCIAL_CLIENTE} =  xpath://*[@id="create_link"]
${TITULO_OPORTUNIDADE_PESQUISA} =  css:#pagecontent > div.moduleTitle > h2
${TIMEOUT} =  30 

*** Keywords ***
Verificar Página Oportunidades Pesquisa
    Wait Until Element Contains  ${TITULO_OPORTUNIDADE_PESQUISA}  Oportunidades » Pesquisar  timeout=${TIMEOUT}

Aperta Botão Criar Oportunidades
    Click Link  ${BOTAO_CRIAR_PONTENCIAL_CLIENTE}