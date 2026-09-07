*** Settings ***
Library    SeleniumLibrary

Resource   ../../../utils/Comum.robot

*** Variables ***
${Forget} =  xpath://a[text()[contains(.,'Esqueci minha senha')]]
${login} =  xpath://*[@id="login"]
${pwd} =  xpath://*[@id="password"]
${btn_Entrar} =  xpath://input[@value = "ENTRAR" and @type = "submit"]

*** Keywords ***
Verificar se estou na pagina de login do Canal do Contratante
    Wait Until Page Contains            Canal do Contratante
    Wait Until Page Contains Element    ${Forget}

Logar no Canal do Contratante
    [Arguments]     ${user_name}    ${user_password}
    Verificar se estou na pagina de login do Canal do Contratante
    Input Text  ${login}  ${user_name}
    Input Text  ${pwd}  ${user_password}
    Click Button  ${btn_Entrar}