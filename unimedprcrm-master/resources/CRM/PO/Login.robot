*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Verificar se estou na pagina de login
    Wait Until Page Contains Element  css:#user_name
    Wait Until Page Contains Element  css:#user_password
    Wait Until Page Contains Element  css:#bigbutton
    Wait Until Page Contains Element  css:#forgotpasslink

Logar com usuario
    [Arguments]     ${user_name}    ${user_password}
    Verificar se estou na pagina de login
    Input Text  css:#user_name  ${user_name}
    Input Text  css:#user_password  ${user_password}
    Click Button  css:#bigbutton


