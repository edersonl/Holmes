*** Settings ***
Library    SeleniumLibrary
Resource    ../../../main.resource
*** Variables ***
${TIMEOUT} =  30
${RESERVA_MERCADO} =  xpath://*[@id="reserva-mercado"]/a
${NOME_CONTA_RESERVA} =  xpath://*[@id="pagecontent"]/div[2]/a[2]

*** Keywords ***
Apresentar a Tela Detalhes do Potencial Cliente
    [Arguments]  ${arg1}
    ${mensagem} =  Catenate  Potencial Cliente » Sr.  ${arg1}
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains  ${mensagem}  timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Contains  Potencial Cliente »  timeout=${TIMEOUT}

Verificar Dados de Potencial Cliente
    [Arguments]  @{arg1}
    ${temp} =     Execute Javascript  return document.getElementById('tipo_pessoa_c').nextSibling.data
    ${tipopessoa} =    Get Line  ${temp}  1
    ${cpfcnpjcaepf} =   Get Text  xpath://*[@id="LBL_CONTACT_INFORMATION"]/tbody/tr[1]/td[4]
    ${fullname} =       Get Text  xpath://span[@id="full_name"]
    ${nome} =           Catenate  Sr.  ${arg1}[1]
    ${numvidas} =       Get Text  xpath://span[@id="poc_nro_vida_c"]
    ${email} =          Get Text  xpath://*[@id="email1_span"]/table/tbody/tr/td/b/a
    ${email}  Convert To Lower Case  ${email}
    Should Be Equal As Strings  ${arg1[0]}  ${tipopessoa}
    Should Be Equal As Strings  ${nome}     ${fullname}
    Should Be Equal As Strings  ${arg1[3]}  ${cpfcnpjcaepf}
    #Should Be Equal As Strings  ${arg1[4]}  ${numvidas}
    Should Be Equal As Strings  ${arg1[5]}  ${email}

Apertar no DropMenu do Botão Editar e Selecionar Solicitar Reserva de Mercado
    Element Should Contain  xpath=//a[@id="edit_button"]  EDITAR
    Click Element  xpath=//*[@id="detail_header_action_menu"]/li/span
    Click Element  xpath=//*[@id="detail_header_action_menu"]/li/ul/li[3]  

Apertar na Reserva de Mercado
    Wait Until Page Contains  Reserva de Mercado  timeout=${TIMEOUT}
    Click Element  ${RESERVA_MERCADO}
    
Apresentar a Mensagem de Sucesso com o Código de Reserva de Mercado
    Wait Until Page Contains  Solicitação feita com sucesso. Foi criada uma reserva de mercado   timeout=${TIMEOUT} 

Clicar no link "Nome da Conta"
    ${nometemp} =  Get Text  ${NOME_CONTA_RESERVA}
    Click Element  xpath://*[@id="pagecontent"]/div[2]/a[contains(text(), '${nometemp}')]
    
    
