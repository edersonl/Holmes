*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${COT_BT_CRIAR} =  xpath://a[@id="create_link"]
${COT_TIT_PAG} =  css:#pagecontent > div.moduleTitle > h2
${COT_BOTAO_PESQUISAR} =  xpath://input[@value="Pesquisar"]
${COT_BOTAO_LIMPAR} =  xpath://input[@value="Limpar"]
${TIMEOUT} =  30

*** Keywords ***
Verificar se está na Página Pesquisar Cotações
    Wait Until Element Contains  ${COT_TIT_PAG}  Cotações » Pesquisar  timeout=${TIMEOUT}

Apertar Botão Criar Cotações
    Click Element  ${COT_BT_CRIAR}