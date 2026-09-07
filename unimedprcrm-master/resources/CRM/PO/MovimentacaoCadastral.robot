*** Settings ***
Library     SeleniumLibrary
Library     String
Library     Collections
Library     ../../../libs/writecsv.py
Library     ../../../libs/CSVLibrary.py
Library     DebugLibrary
Resource    ../../../main.resource


*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${SHORT_TIMEOUT} =  10
${SUBMENU_INTEGRACAO_AUTOMATICA} =  id:integracao_automatica
${SITUACAO_AGUARDANDO_INTEGRACAO_AUTOMATICA} =  xpath://*[@id="situacao"]/span[contains(., 'Aguardando Integração Automática')]
${SITUACAO_INTEGRADA_AUTOMATICAMENTE} =  xpath://*[@id="situacao"]/span[contains(., 'Integrada Automaticamente')]
${REGISTRAR_CANCELAMENTO_CONTRATO} =  xpath://*[@id="detail_header_action_menu"]/li/ul/li[4]/a[contains(., 'Registrar')]
${MOTIVO_CANCELAMENTO_CONTRATO} =  id:cc_motivo
${INPUT_DATA_CANCELAMENTO_CONTRATO} =  id:cc_data_cancelamento
${INPUT_COMPLEMENTO_CANCELAMENTO} =  id:cc_complemento
${INPUT_HORA_CANCELAMENTO} =  id:cc_data_cancelamento_hora
${INPUT_MINUTO_CANCELAMENTO} =  id:cc_data_cancelamento_minuto
${BOTAO_SALVAR_CANCELAMENTO_CONTRATO} =  id:btn-salvar-registro
${INPUT_DATA_OBITO_CONTRATO} =  id:cc_data_obito

*** Keywords ***

Apresentar a tela Movimentação Cadastral »
    ${c}  Run Keyword And Ignore Error   Wait Until Page Contains  Movimentação Cadastral »   timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "FAIL"  Sleep  3s
    


Clicar no menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${SUBMENU_INTEGRACAO_AUTOMATICA}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60


Atualiza a tela da Movimentação Cadastral, alterou a "Situação" para AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    Wait Until Element Is Visible    ${SITUACAO_AGUARDANDO_INTEGRACAO_AUTOMATICA}    timeout=${TIMEOUT}
    

Atualiza a tela da Movimentação Cadastral após 3 minutos"
    Sleep  5 minutes
    Reload Page


CRM atualiza a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado automaticamente"
    Wait Until Element Is Visible    ${SITUACAO_INTEGRADA_AUTOMATICAMENTE}    timeout=${TIMEOUT}


Clicar no "Protocolo"
    Set Focus To Element  xpath://*[@id="proto"]/a
    Sleep  3s
    Click Element  xpath://*[@id="proto"]/a
    Wait Until Page Contains     Ocorrências » Protocolo aberto para atendimento da solicitação de mov. cadastral de exclusão de beneficiário    timeout=${TIMEOUT}
    Click Element  xpath://*[@id="case_updates"]/input[contains(., 'Salvar')]
    Wait Until Page Contains    Um momento por favor...    timeout=60
    Wait Until Page Does Not Contain    Um momento por favor...    timeout=60 
    Sleep  3s


Clicar no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    Set Focus To Element  ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Click Element  ${REGISTRAR_CANCELAMENTO_CONTRATO}


Selecionar "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual
    Wait Until Page Contains    Registro de Cancelamento de Contrato    timeout=60
    Sleep  6s
    Select From List By Label  ${MOTIVO_CANCELAMENTO_CONTRATO}   41 - Rompimento do contrato por iniciativa do beneficiário
    Set Focus To Element  ${INPUT_DATA_CANCELAMENTO_CONTRATO}
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    ${hora_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%H
    ${minuto_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%M
    Set Test Variables   ${data_cancelamento_contrato}
    Input Text  ${INPUT_DATA_CANCELAMENTO_CONTRATO}    ${data_cancelamento_contrato}
    Select From List By Label  ${INPUT_HORA_CANCELAMENTO}    ${hora_cancelamento_contrato}
    Select From List By Label  ${INPUT_MINUTO_CANCELAMENTO}    ${minuto_cancelamento_contrato}
    Execute Javascript  document.getElementById('cc_complemento').value="Teste Automação - Prime"
    Sleep  5s
    Set Focus To Element  ${BOTAO_SALVAR_CANCELAMENTO_CONTRATO} 
    Sleep  3s
    Execute Javascript   document.getElementById("btn-salvar-registro").click()
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60


Selecionar "Motivo" 44 - ÓBITO, informou "Data de Cancelamento" com data e hora de amanha, "Data de Obito" igual a DATA DE ONTEM
    Wait Until Page Contains    Registro de Cancelamento de Contrato    timeout=60
    Sleep  6s
    Select From List By Label  ${MOTIVO_CANCELAMENTO_CONTRATO}   44 - Óbito
    Set Focus To Element  ${INPUT_DATA_CANCELAMENTO_CONTRATO}
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     1 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    ${hora_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%H
    ${minuto_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%M
    Set Test Variables   ${data_cancelamento_contrato}
    Input Text  ${INPUT_DATA_CANCELAMENTO_CONTRATO}    ${data_cancelamento_contrato}
    Select From List By Label  ${INPUT_HORA_CANCELAMENTO}    ${hora_cancelamento_contrato}
    Select From List By Label  ${INPUT_MINUTO_CANCELAMENTO}    ${minuto_cancelamento_contrato}
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     -1 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_obito_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Set Test Variables   ${data_obito_contrato}
    Input Text  ${INPUT_DATA_OBITO_CONTRATO}    ${data_obito_contrato}
    Execute Javascript  document.getElementById('cc_complemento').value="Teste Automação - Prime"
    Sleep  5s
    Set Focus To Element  ${BOTAO_SALVAR_CANCELAMENTO_CONTRATO} 
    Sleep  3s
    Execute Javascript   document.getElementById("btn-salvar-registro").click()
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60


Selecionar "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual
    Wait Until Page Contains    Registro de Cancelamento de Contrato    timeout=60
    Sleep  6s
    Select From List By Label  ${MOTIVO_CANCELAMENTO_CONTRATO}   46 - Inclusão indevida de beneficiários
    Set Focus To Element  ${INPUT_DATA_CANCELAMENTO_CONTRATO}
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     5 minutes
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    ${hora_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%H
    ${minuto_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%M
    Set Test Variables   ${data_cancelamento_contrato}
    Input Text  ${INPUT_DATA_CANCELAMENTO_CONTRATO}    ${data_cancelamento_contrato}
    Select From List By Label  ${INPUT_HORA_CANCELAMENTO}    ${hora_cancelamento_contrato}
    Select From List By Label  ${INPUT_MINUTO_CANCELAMENTO}    ${minuto_cancelamento_contrato}
    Execute Javascript  document.getElementById('cc_complemento').value="Teste Automação - Prime"
    Sleep  5s
    Set Focus To Element  ${BOTAO_SALVAR_CANCELAMENTO_CONTRATO} 
    Sleep  3s
    Execute Javascript   document.getElementById("btn-salvar-registro").click()
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60


Selecionar "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), informou "Data de Cancelamento" com data e hora atual
    Wait Until Page Contains    Registro de Cancelamento de Contrato    timeout=60
    Sleep  6s
    Select From List By Label  ${MOTIVO_CANCELAMENTO_CONTRATO}   47 - Fraude (art. 13 da Lei 9.656/98)
    Set Focus To Element  ${INPUT_DATA_CANCELAMENTO_CONTRATO}
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    ${hora_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%H
    ${minuto_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%M
    Set Test Variables   ${data_cancelamento_contrato}
    Input Text  ${INPUT_DATA_CANCELAMENTO_CONTRATO}    ${data_cancelamento_contrato}
    Select From List By Label  ${INPUT_HORA_CANCELAMENTO}    ${hora_cancelamento_contrato}
    Select From List By Label  ${INPUT_MINUTO_CANCELAMENTO}    ${minuto_cancelamento_contrato}
    Execute Javascript  document.getElementById('cc_complemento').value="Teste Automação - Prime"
    Sleep  5s
    Set Focus To Element  ${BOTAO_SALVAR_CANCELAMENTO_CONTRATO} 
    Sleep  3s
    Execute Javascript   document.getElementById("btn-salvar-registro").click()
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60


Selecionar "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, informou "Data de Cancelamento" com data e hora atual
    Wait Until Page Contains    Registro de Cancelamento de Contrato    timeout=60
    Sleep  6s
    Select From List By Label  ${MOTIVO_CANCELAMENTO_CONTRATO}   48 - Por portabilidade de carência
    Set Focus To Element  ${INPUT_DATA_CANCELAMENTO_CONTRATO}
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${data_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    ${hora_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%H
    ${minuto_cancelamento_contrato}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%M
    Set Test Variables   ${data_cancelamento_contrato}
    Input Text  ${INPUT_DATA_CANCELAMENTO_CONTRATO}    ${data_cancelamento_contrato}
    Select From List By Label  ${INPUT_HORA_CANCELAMENTO}    ${hora_cancelamento_contrato}
    Select From List By Label  ${INPUT_MINUTO_CANCELAMENTO}    ${minuto_cancelamento_contrato}
    Execute Javascript  document.getElementById('cc_complemento').value="Teste Automação - Prime"
    Sleep  5s
    Set Focus To Element  ${BOTAO_SALVAR_CANCELAMENTO_CONTRATO} 
    Sleep  3s
    Execute Javascript   document.getElementById("btn-salvar-registro").click()
    Run Keyword And Ignore Error   Execute Javascript   document.getElementById("btn-salvar-registro").click()
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60


Validar que coluna "Data Base Carência" foi preenchido
    [Arguments]    ${arg1}
    Run Keyword If  '${arg1}' == 'Cliente (PF)'   Validar que coluna "Data Base Carência" foi preenchido (PF)
    Run Keyword If  '${arg1}' == 'Cliente (PJ)'   Validar que coluna "Data Base Carência" foi preenchido (PJ e CAEPF)
    Run Keyword If  '${arg1}' == 'Cliente (CAEPF)'   Validar que coluna "Data Base Carência" foi preenchido (PJ e CAEPF)


Validar que coluna "Data Base Carência" foi preenchido (PF)
    ${data_base_carencia1}  Get Value  xpath://*[@id="subPanel"]/tbody/tr[1]/td[3]/span
    ${data_base_carencia2}  Get Value  xpath://*[@id="subPanel"]/tbody/tr[2]/td[3]/span
    ${data_base_carencia3}  Get Value  xpath://*[@id="subPanel"]/tbody/tr[3]/td[3]/span

    Run Keyword If  '${data_base_carencia1}' == 'None'  Fail  Data Base Carência não está preenchido!
    Run Keyword If  '${data_base_carencia2}' == 'None'  Fail  Data Base Carência não está preenchido!
    Run Keyword If  '${data_base_carencia3}' == 'None'  Fail  Data Base Carência não está preenchido!


Validar que coluna "Data Base Carência" foi preenchido (PJ e CAEPF)
    # Pegar valores da table
    ${nome_beneficiario1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  3    1
    ${data_base_carencia1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  3    3
    
    ${nome_beneficiario2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  4    1
    ${data_base_carencia2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  4    3
    
    ${nome_beneficiario3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  5    1
    ${data_base_carencia3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  5    3
    
    ${nome_beneficiario4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  6    1
    ${data_base_carencia4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  6    3
    
    ${nome_beneficiario5}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  7    1
    ${data_base_carencia5}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  7    3
    
    ${nome_beneficiario6}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  8    1
    ${data_base_carencia6}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  8    3
    
    ${nome_beneficiario7}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  9    1
    ${data_base_carencia7}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  9    3
    
    ${nome_beneficiario8}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  10   1
    ${data_base_carencia8}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  10   3
    
    ${nome_beneficiario9}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  11   1
    ${data_base_carencia9}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  11   3
    
    ${nome_beneficiario10}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  12   1
    ${data_base_carencia10}  Get Table Cell  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts"]/table  12   3
    
    # Validação se a carência está preenchida
    Run Keyword If  '${data_base_carencia1}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario1} não está preenchido!
    Run Keyword If  '${data_base_carencia2}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario2} não está preenchido!
    Run Keyword If  '${data_base_carencia3}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario3} não está preenchido!
    Run Keyword If  '${data_base_carencia4}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario4} não está preenchido!
    Run Keyword If  '${data_base_carencia5}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario5} não está preenchido!
    Run Keyword If  '${data_base_carencia6}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario6} não está preenchido!
    Run Keyword If  '${data_base_carencia7}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario7} não está preenchido!
    Run Keyword If  '${data_base_carencia8}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario8} não está preenchido!
    Run Keyword If  '${data_base_carencia9}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario9} não está preenchido!
    Run Keyword If  '${data_base_carencia10}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario10} não está preenchido!

    # Log para mostrar no html
    Log  O Beneficiario ${nome_beneficiario1} possui a Data Base Carência igual a: ${data_base_carencia1}.  INFO
    Log  O Beneficiario ${nome_beneficiario2} possui a Data Base Carência igual a: ${data_base_carencia2}.  INFO   
    Log  O Beneficiario ${nome_beneficiario3} possui a Data Base Carência igual a: ${data_base_carencia3}.  INFO
    Log  O Beneficiario ${nome_beneficiario4} possui a Data Base Carência igual a: ${data_base_carencia4}.  INFO
    Log  O Beneficiario ${nome_beneficiario5} possui a Data Base Carência igual a: ${data_base_carencia5}.  INFO
    Log  O Beneficiario ${nome_beneficiario6} possui a Data Base Carência igual a: ${data_base_carencia6}.  INFO
    Log  O Beneficiario ${nome_beneficiario7} possui a Data Base Carência igual a: ${data_base_carencia7}.  INFO
    Log  O Beneficiario ${nome_beneficiario8} possui a Data Base Carência igual a: ${data_base_carencia8}.  INFO
    Log  O Beneficiario ${nome_beneficiario9} possui a Data Base Carência igual a: ${data_base_carencia9}.  INFO
    Log  O Beneficiario ${nome_beneficiario10} possui a Data Base Carência igual a: ${data_base_carencia10}.  INFO


Validar que coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)
    [Arguments]  @{arg1}
    # Pegar valores da table
    ${grau_dependencia1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  3    11
    ${grau_dependencia2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  4    11
    ${grau_dependencia3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  5    11
    ${grau_dependencia4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  6    11
    
    Run Keyword If  '${grau_dependencia1}' == '00 - Titular'  Validar "Data Base Carência" - 00 - Titular  3
    Run Keyword If  '${grau_dependencia2}' == '00 - Titular'  Validar "Data Base Carência" - 00 - Titular  4
    Run Keyword If  '${grau_dependencia3}' == '00 - Titular'  Validar "Data Base Carência" - 00 - Titular  5
    Run Keyword If  '${grau_dependencia4}' == '00 - Titular'  Validar "Data Base Carência" - 00 - Titular  6

    Run Keyword If  '${grau_dependencia1}' == '01 - Cônjuge'  Validar "Data Base Carência" - 01 - Cônjuge  3
    Run Keyword If  '${grau_dependencia2}' == '01 - Cônjuge'  Validar "Data Base Carência" - 01 - Cônjuge  4
    Run Keyword If  '${grau_dependencia3}' == '01 - Cônjuge'  Validar "Data Base Carência" - 01 - Cônjuge  5
    Run Keyword If  '${grau_dependencia4}' == '01 - Cônjuge'  Validar "Data Base Carência" - 01 - Cônjuge  6

    Run Keyword If  '${grau_dependencia1}' == '10 - Filhos(as)'  Validar "Data Base Carência" - 10 - Filhos(as)  3
    Run Keyword If  '${grau_dependencia2}' == '10 - Filhos(as)'  Validar "Data Base Carência" - 10 - Filhos(as)  4
    Run Keyword If  '${grau_dependencia3}' == '10 - Filhos(as)'  Validar "Data Base Carência" - 10 - Filhos(as)  5
    Run Keyword If  '${grau_dependencia4}' == '10 - Filhos(as)'  Validar "Data Base Carência" - 10 - Filhos(as)  6
    
    Run Keyword If  '${grau_dependencia1}' == '70 - Filho(as) adotivos'  Validar "Data Base Carência" - 70 - Filho(as) adotivos  3
    Run Keyword If  '${grau_dependencia2}' == '70 - Filho(as) adotivos'  Validar "Data Base Carência" - 70 - Filho(as) adotivos  4
    Run Keyword If  '${grau_dependencia3}' == '70 - Filho(as) adotivos'  Validar "Data Base Carência" - 70 - Filho(as) adotivos  5
    Run Keyword If  '${grau_dependencia4}' == '70 - Filho(as) adotivos'  Validar "Data Base Carência" - 70 - Filho(as) adotivos  6
    

Validar "Data Base Carência" - 00 - Titular
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    Run Keyword If  '${data_base_carencia}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência igual a: ${data_base_carencia}.  INFO

Validar "Data Base Carência" - 01 - Cônjuge
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    Run Keyword If  '${data_base_carencia}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 01 - Cônjuge ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência igual a: ${data_base_carencia}.  INFO

Validar "Data Base Carência" - 10 - Filhos(as)
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3

    Should Be Equal  ${data_base_carencia}  ${data_base_vigencia}  O valor da  ${data_base_carencia} é diferente da ${data_base_vigencia}!
    Run Keyword If  '${data_base_carencia}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência igual a: ${data_base_carencia}.  INFO

Validar "Data Base Carência" - 70 - Filho(as) adotivos
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    Run Keyword If  '${data_base_carencia}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario} não está preenchido!
    Should Be Equal  ${data_base_carencia}  ${data_base_vigencia}  O valor da  ${data_base_carencia} é diferente da ${data_base_vigencia}!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência igual a: ${data_base_carencia}.  INFO


Validar a coluna "Data Base Carência" foi preenchida da seguinte forma:
    [Arguments]  @{arg1}
    # Pegar valores da table
    ${grau_dependencia1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  3    11
    ${grau_dependencia2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  4    11
    ${grau_dependencia3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  5    11
    ${grau_dependencia4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  6    11
    
    Run Keyword If  '${grau_dependencia1}' == '00 - Titular'  O Titular foi preenchido com a "Data Inicio Vigência" - 301 dias  3
    Run Keyword If  '${grau_dependencia2}' == '00 - Titular'  O Titular foi preenchido com a "Data Inicio Vigência" - 301 dias  4
    Run Keyword If  '${grau_dependencia3}' == '00 - Titular'  O Titular foi preenchido com a "Data Inicio Vigência" - 301 dias  5
    Run Keyword If  '${grau_dependencia4}' == '00 - Titular'  O Titular foi preenchido com a "Data Inicio Vigência" - 301 dias  6

    Run Keyword If  '${grau_dependencia1}' == '01 - Cônjuge'  O Conjuge com a coluna "Data Base Carência" vazia  3
    Run Keyword If  '${grau_dependencia2}' == '01 - Cônjuge'  O Conjuge com a coluna "Data Base Carência" vazia  4
    Run Keyword If  '${grau_dependencia3}' == '01 - Cônjuge'  O Conjuge com a coluna "Data Base Carência" vazia  5
    Run Keyword If  '${grau_dependencia4}' == '01 - Cônjuge'  O Conjuge com a coluna "Data Base Carência" vazia  6

    Run Keyword If  '${grau_dependencia1}' == '10 - Filhos(as)'  O Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  3
    Run Keyword If  '${grau_dependencia2}' == '10 - Filhos(as)'  O Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  4
    Run Keyword If  '${grau_dependencia3}' == '10 - Filhos(as)'  O Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  5
    Run Keyword If  '${grau_dependencia4}' == '10 - Filhos(as)'  O Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  6
    
    Run Keyword If  '${grau_dependencia1}' == '70 - Filho(as) adotivos'  O Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  3
    Run Keyword If  '${grau_dependencia2}' == '70 - Filho(as) adotivos'  O Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  4
    Run Keyword If  '${grau_dependencia3}' == '70 - Filho(as) adotivos'  O Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  5
    Run Keyword If  '${grau_dependencia4}' == '70 - Filho(as) adotivos'  O Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  6


O Titular foi preenchido com a "Data Inicio Vigência" - 301 dias
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     301 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    Run Keyword If  '${data_base_vigencia}' == '${date}'  Pass Execution  Data Base Vigência do Beneficiario: 00 - Titular ${nome_beneficiario} é igual a 301 dias!
    Run Keyword If  '${data_base_carencia}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia} e ${data_base_vigencia}.  INFO

O Conjuge com a coluna "Data Base Carência" vazia
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    Run Keyword If  '${data_base_carencia}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 01 - Cônjuge ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência igual a: ${data_base_carencia}.  INFO

O Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3

    Should Be Equal  ${data_base_carencia}  ${data_base_vigencia}  O valor da  ${data_base_carencia} é diferente da ${data_base_vigencia}!
    Run Keyword If  '${data_base_carencia}' == 'None'  Fail  Data Base Carência do Beneficiario ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência igual a: ${data_base_carencia}.  INFO


Validar que coluna "Data Base Carência" foi preenchida da seguinte forma
    Log    Validação da coluna "Data Base Carência" ainda não foi implementada na automação.  WARN
    No Operation

Validar Beneficiário com Portabilidade Total deve gravar DATA DE VIGENCIA - 301 dias
    [Arguments]    @{arg1}
    Log    Validação de beneficiário com portabilidade total ainda não foi implementada.  WARN
    No Operation

Validar Beneficiário sem Portabilidade Total deve validar
    Log    Validação de beneficiário sem portabilidade total ainda não foi implementada.  WARN
    No Operation

Validar Se DataMovimentação - DataAdmissão for menor ou igual a DiasParamTitular deve gravar DATA DE VIGENCIA - 301 dias
    [Arguments]    @{arg1}
    Log    Validação da regra de admissão menor ou igual a DiasParamTitular ainda não foi implementada.  WARN
    No Operation

Validar Se DataMovimentação - DataAdmissão for maior que DiasParamTitular deve gravar DATA DE VIGENCIA
    [Arguments]    @{arg1}
    Log    Validação da regra de admissão maior que DiasParamTitular ainda não foi implementada.  WARN
    No Operation


Titular com a "Data Admissão Empresa" menor que 10 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     6 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_9vidas.csv
    Log To Console  ${lines}

    ${titular1}  Create List   ${arg1[1]}  ${arg1[39]}  ${DATA_ADMISSAO}  ${arg1[43]}  ${arg1[45]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_INICIO_VIGENCIA}

    ${slots_titular}  Create List   0  1  7  8  14  30  31  48

    Edit Line  0  ${titular1}   ${slots_titular}


Dependente Conjuge e Filho com a "Data Admissão Empresa" do Titular menor que 10 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     6 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente1}  Create List   ${arg1[48]}  ${arg1[47]}  01  ${arg1[39]}  ${DATA_ADMISSAO}  ${arg1[51]}  ${arg1[53]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}
    ${dependente2}  Create List   ${arg1[56]}  ${arg1[55]}  10  ${arg1[39]}  ${DATA_ADMISSAO}  ${arg1[59]}  ${arg1[61]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  47  48

    Edit Line  1  ${dependente1}   ${slots_dependente}
    Edit Line  2  ${dependente2}   ${slots_dependente}


Titular com a "Data Admissão Empresa" igual a 10 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     10 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${titular1}  Create List   ${arg1[64]}  ${arg1[63]}  ${DATA_ADMISSAO}  ${arg1[67]}  ${arg1[69]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_INICIO_VIGENCIA}

    ${slots_titular}  Create List   0  1  7  8  14  30  31  48

    Edit Line  3  ${titular1}   ${slots_titular}


Dependente Conjuge e Filho com a "Data Admissão Empresa" do Titular igual a 10 dias da data atual "Data Base de Carência" igual a Data Início Vigência – 301 Dias
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_BASE_CARENCIA}  Get Current Date
    ${DATA_BASE_CARENCIA}  Subtract Time From Date   ${DATA_BASE_CARENCIA}     301 days
    ${DATA_BASE_CARENCIA}  Convert Date       ${DATA_BASE_CARENCIA}     exclude_millis=yes
    ${DATA_BASE_CARENCIA}  Convert Date       ${DATA_BASE_CARENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     10 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y


    ${dependente1}  Create List   ${arg1[72]}  ${arg1[71]}  01  ${arg1[63]}  ${DATA_ADMISSAO}  ${arg1[75]}  ${arg1[77]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_BASE_CARENCIA}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}
    ${dependente2}  Create List   ${arg1[80]}  ${arg1[79]}  10  ${arg1[63]}  ${DATA_ADMISSAO}  ${arg1[83]}  ${arg1[85]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_BASE_CARENCIA}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  46  47  48

    Edit Line  4  ${dependente1}   ${slots_dependente}
    Edit Line  5  ${dependente2}   ${slots_dependente}


Titular com a "Data Admissão Empresa" maior que 10 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     12 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${titular1}  Create List   ${arg1[88]}  ${arg1[87]}  ${DATA_ADMISSAO}  ${arg1[91]}  ${arg1[93]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_INICIO_VIGENCIA}

    ${slots_titular}  Create List   0  1  7  8  14  30  31  48

    Edit Line  6  ${titular1}   ${slots_titular}


Dependente Conjuge e Filho com a "Data Admissão Empresa" do Titular maior que 10 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     12 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente1}  Create List   ${arg1[96]}  ${arg1[95]}  01  ${arg1[87]}  ${DATA_ADMISSAO}  ${arg1[99]}  ${arg1[101]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}
    ${dependente2}  Create List   ${arg1[104]}  ${arg1[103]}  10  ${arg1[87]}  ${DATA_ADMISSAO}  ${arg1[107]}  ${arg1[109]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ATUAL}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  47  48

    Edit Line  7  ${dependente1}   ${slots_dependente}
    Edit Line  8  ${dependente2}   ${slots_dependente}


Dependente Conjuge com a "Data Certidão de Casamento" maior que 10 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_CERTIDAO_CASAMENTO}  Get Current Date
    ${DATA_CERTIDAO_CASAMENTO}  Subtract Time From Date   ${DATA_CERTIDAO_CASAMENTO}     12 days
    ${DATA_CERTIDAO_CASAMENTO}  Convert Date       ${DATA_CERTIDAO_CASAMENTO}     exclude_millis=yes
    ${DATA_CERTIDAO_CASAMENTO}  Convert Date       ${DATA_CERTIDAO_CASAMENTO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_3vidas.csv
    Log To Console  ${lines}
    
    ${dependente1}  Create List   ${arg1[48]}  ${arg1[47]}  01  ${arg1[39]}  ${arg1[51]}  ${arg1[53]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_CERTIDAO_CASAMENTO}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  0  ${dependente1}   ${slots_dependente}


Dependente Filho com a "Data de Nascimento" igual a 10 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_NASC}  Get Current Date
    ${DATA_NASC}  Subtract Time From Date   ${DATA_NASC}     10 days
    ${DATA_NASC}  Convert Date       ${DATA_NASC}     exclude_millis=yes
    ${DATA_NASC}  Convert Date       ${DATA_NASC}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente1}  Create List   ${arg1[55]}  ${arg1[54]}  10  ${arg1[38]}  ${DATA_NASC}  ${arg1[60]}  S  ${arg1[59]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_NASC}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  16  17  30  31  47  48

    Edit Line  1  ${dependente1}   ${slots_dependente}


Dependente Filho Adotivo com a "Data da Adoção" menor que 10 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADOCAO}  Get Current Date
    ${DATA_ADOCAO}  Subtract Time From Date   ${DATA_ADOCAO}     6 days
    ${DATA_ADOCAO}  Convert Date       ${DATA_ADOCAO}     exclude_millis=yes
    ${DATA_ADOCAO}  Convert Date       ${DATA_ADOCAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente1}  Create List   ${arg1[64]}  ${arg1[63]}  70  ${arg1[39]}  ${arg1[67]}  ${arg1[69]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_ADOCAO}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  8  14  30  31  47  48

    Edit Line  2  ${dependente1}   ${slots_dependente}


Validar que coluna "Data Base Carência" foi preenchido da seguinte forma: (9 Vidas)
    # Pegar valores da table
    ${nome_beneficiario1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  3    1
    Set Test Variables  ${nome_beneficiario1} 

    ${nome_beneficiario2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  4    1
    Set Test Variables  ${nome_beneficiario2} 

    ${nome_beneficiario3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  5    1
    Set Test Variables  ${nome_beneficiario3} 

    ${nome_beneficiario4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  6    1
    Set Test Variables  ${nome_beneficiario4} 

    ${nome_beneficiario5}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  7    1
    Set Test Variables  ${nome_beneficiario5} 

    ${nome_beneficiario6}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  8    1
    Set Test Variables  ${nome_beneficiario6} 

    ${nome_beneficiario7}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  9    1
    Set Test Variables  ${nome_beneficiario7} 

    ${nome_beneficiario8}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  10   1
    Set Test Variables  ${nome_beneficiario8} 

    ${nome_beneficiario9}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  11   1
    Set Test Variables  ${nome_beneficiario9} 


Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[1]}' or '${nome_beneficiario1}' == '${arg1[64]}'   Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[1]}' or '${nome_beneficiario2}' == '${arg1[64]}'   Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[1]}' or '${nome_beneficiario3}' == '${arg1[64]}'   Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[1]}' or '${nome_beneficiario4}' == '${arg1[64]}'   Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[1]}' or '${nome_beneficiario5}' == '${arg1[64]}'   Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[1]}' or '${nome_beneficiario6}' == '${arg1[64]}'   Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[1]}' or '${nome_beneficiario7}' == '${arg1[64]}'   Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[1]}' or '${nome_beneficiario8}' == '${arg1[64]}'   Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[1]}' or '${nome_beneficiario9}' == '${arg1[64]}'   Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  11


Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA
    [Arguments]  @{arg1}   
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[48]}' or '${nome_beneficiario1}' == '${arg1[56]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[48]}' or '${nome_beneficiario2}' == '${arg1[56]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[48]}' or '${nome_beneficiario3}' == '${arg1[56]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[48]}' or '${nome_beneficiario4}' == '${arg1[56]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[48]}' or '${nome_beneficiario5}' == '${arg1[56]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[48]}' or '${nome_beneficiario6}' == '${arg1[56]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[48]}' or '${nome_beneficiario7}' == '${arg1[56]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[48]}' or '${nome_beneficiario8}' == '${arg1[56]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[48]}' or '${nome_beneficiario9}' == '${arg1[56]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  11

    Run Keyword If  '${nome_beneficiario1}' == '${arg1[72]}' or '${nome_beneficiario1}' == '${arg1[80]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[72]}' or '${nome_beneficiario2}' == '${arg1[80]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[72]}' or '${nome_beneficiario3}' == '${arg1[80]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[72]}' or '${nome_beneficiario4}' == '${arg1[80]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[72]}' or '${nome_beneficiario5}' == '${arg1[80]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[72]}' or '${nome_beneficiario6}' == '${arg1[80]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[72]}' or '${nome_beneficiario7}' == '${arg1[80]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[72]}' or '${nome_beneficiario8}' == '${arg1[80]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[72]}' or '${nome_beneficiario9}' == '${arg1[80]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  11
  

Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[87]}'  Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[87]}'  Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[87]}'  Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[87]}'  Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[87]}'  Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[87]}'  Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[87]}'  Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[87]}'  Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[87]}'  Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  11


Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[96]}' or '${nome_beneficiario1}' == '${arg1[104]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[96]}' or '${nome_beneficiario2}' == '${arg1[104]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[96]}' or '${nome_beneficiario3}' == '${arg1[104]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[96]}' or '${nome_beneficiario4}' == '${arg1[104]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[96]}' or '${nome_beneficiario5}' == '${arg1[104]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[96]}' or '${nome_beneficiario6}' == '${arg1[104]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[96]}' or '${nome_beneficiario7}' == '${arg1[104]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[96]}' or '${nome_beneficiario8}' == '${arg1[104]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  10
    Run Keyword If  '${nome_beneficiario9}' == '${arg1[96]}' or '${nome_beneficiario9}' == '${arg1[104]}'   Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  11


Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    Run Keyword If  '${data_base_carencia}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia} e ${data_base_vigencia}.  INFO


Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    Run Keyword If  '${data_base_carencia}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia} e ${data_base_vigencia}.  INFO


Validar Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    Run Keyword If  '${data_base_carencia}' == 'None'  Fail  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia} e ${data_base_vigencia}.  INFO


Validar Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA
    [Arguments]    ${i}
    ${nome_beneficiario}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    Run Keyword If  '${data_base_carencia}' == 'None'  Fail  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia} e ${data_base_vigencia}.  INFO


Validar que coluna "Data Base Carência" foi preenchido da seguinte forma: (3 Vidas)
    # Pegar valores da table
    ${nome_beneficiario1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  3    1
    Set Test Variables  ${nome_beneficiario1} 
    ${nome_beneficiario2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  4    1
    Set Test Variables  ${nome_beneficiario2} 
    ${nome_beneficiario3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  5    1
    Set Test Variables  ${nome_beneficiario3}


Se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[56]}' or '${nome_beneficiario1}' == '${arg1[64]}'  Validar se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[56]}' or '${nome_beneficiario1}' == '${arg1[64]}'  Validar se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[56]}' or '${nome_beneficiario1}' == '${arg1[64]}'  Validar se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias  5


Se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[48]}'   Validar se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[48]}'   Validar se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[48]}'   Validar se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência  5


Validar se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias
    [Arguments]   ${i}
    ${nome_beneficiario_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    ${CALCULO_DATA_BASE_CARENCIA}  Get Current Date
    ${CALCULO_DATA_BASE_CARENCIA}  Subtract Time From Date   ${CALCULO_DATA_BASE_CARENCIA}     301 days
    ${CALCULO_DATA_BASE_CARENCIA}  Convert Date       ${CALCULO_DATA_BASE_CARENCIA}     exclude_millis=yes
    ${CALCULO_DATA_BASE_CARENCIA}  Convert Date       ${CALCULO_DATA_BASE_CARENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    
    Should Be Equal  ${CALCULO_DATA_BASE_CARENCIA}  ${data_base_carencia_tela}
    Run Keyword If  '${data_base_carencia_tela}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia_tela} e ${data_base_vigencia_tela}.  INFO


Validar se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência
    [Arguments]    ${i}
    ${nome_beneficiario_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    Should Be Equal  ${data_base_carencia_tela}  ${data_base_vigencia_tela}
    Run Keyword If  '${data_base_carencia_tela}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia_tela} e ${data_base_vigencia_tela}.  INFO


Realizou integração de uma Movimentação Cadastral de Inclusão de Beneficiário, com um Titular
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ATUAL}  Get Current Date
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     exclude_millis=yes
    ${DATA_ATUAL}  Convert Date       ${DATA_ATUAL}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_titular.csv
    Log To Console  ${lines}

    ${titular1}  Create List   ${arg1[1]}  ${arg1[39]}  ${DATA_ADMISSAO}  ${arg1[43]}  ${arg1[45]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_INICIO_VIGENCIA}

    ${slots_titular}  Create List   0  1  7  8  14  30  31  48

    Edit Line  0  ${titular1}   ${slots_titular}

    Save CSV  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_titular.csv
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVO}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVO}    ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_titular.csv
    Click Element                     ${BOTAO_SALVAR_CONTRATO}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains    Validando    timeout=${TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  DBCRMUnimed.Query - Limpar Fila de Agendadores
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  260s
    Run Keyword If  "${v[0]}" == "PASS"  Reload Page
    Wait Until Page Contains    Aguardando Liberação    timeout=${TIMEOUT}
    Click Element    ${BOTAO_CONFIRMAR_IMPORTACAO}
    Wait Until Page Contains    Deseja realmente executar esta ação?    timeout=${TIMEOUT}
    Click Element    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Importado com Sucesso    timeout=${TIMEOUT}
    Wait Until Page Contains    Importação » beneficiario_import_inclusao_benef_titular    timeout=${TIMEOUT}

    
Pegar ID da url de movimentação e do Titular
    [Arguments]    ${arg1}
    # Pegar o ID na url de Movimentação Cadastral
    Wait Until Page Contains    Movimentação Cadastral »     timeout=${TIMEOUT}
    ${url} =   Get Location
    ${ID_MOVIMENTACAO_CADASTRAL}    Split String    ${url}    record=
    ${ID_MOVIMENTACAO_CADASTRAL}  Create List  ${ID_MOVIMENTACAO_CADASTRAL[1]}
    Set Test Variables  ${ID_MOVIMENTACAO_CADASTRAL}

    # Pegar o ID na url do Titular cadastrado na movimentação
    Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(., '${arg1}')]
    Click Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
    Wait Until Page Contains    Beneficiários »     timeout=${TIMEOUT}
    ${url_titular} =   Get Location
    ${ID_TITULAR}    Split String    ${url_titular}    record=
    ${ID_TITULAR}  Create List  ${ID_TITULAR[1]}
    Set Test Variables  ${ID_TITULAR}

    Go Back
    Wait Until Page Contains    Movimentação Cadastral »     timeout=${TIMEOUT}
    

Dependente Filho com a "Data Admissão Empresa" a menos 9 dias da data atual e "Data de Vinculo" igual a menos 31 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_VINCULO}  Get Current Date
    ${DATA_VINCULO}  Subtract Time From Date   ${DATA_VINCULO}     31 days
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     exclude_millis=yes
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     9 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${header}  ${lines}  Read CSV File  ${DOCUMENTS_FOLDER}${/}beneficiario_import_inclusao_benef_8dependentes.csv
    Log To Console  ${lines}

    ${dependente1}  Create List   ${arg1[48]}  ${arg1[47]}  10  ${arg1[39]}  ${DATA_ADMISSAO}  ${arg1[51]}  ${arg1[53]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_VINCULO}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  47  48

    Edit Line  0  ${dependente1}   ${slots_dependente}


Dependente Filho Adotivo com a "Data Admissão Empresa" a menos 10 dias da data atual e "Data de Vinculo" igual a menos 30 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_VINCULO}  Get Current Date
    ${DATA_VINCULO}  Subtract Time From Date   ${DATA_VINCULO}     30 days
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     exclude_millis=yes
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     10 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente2}  Create List   ${arg1[55]}  ${arg1[54]}  70  ${arg1[38]}  ${DATA_ADMISSAO}  ${arg1[58]}  ${arg1[60]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_VINCULO}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  47  48

    Edit Line  1  ${dependente2}   ${slots_dependente}


Dependente Conjuge com a "Data Admissão Empresa" a menos 11 dias da data atual e "Data de Vinculo" igual a menos 30 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_VINCULO}  Get Current Date
    ${DATA_VINCULO}  Subtract Time From Date   ${DATA_VINCULO}     30 days
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     exclude_millis=yes
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     11 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente3}  Create List  ${arg1[64]}  ${arg1[63]}  01  ${arg1[39]}  ${DATA_ADMISSAO}  ${arg1[67]}  ${arg1[69]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_VINCULO}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  47  48

    Edit Line  2  ${dependente3}   ${slots_dependente}


Dependente Filho com a "Data Admissão Empresa" a menos 10 dias da data atual e "Data de Vinculo" igual a menos 29 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_VINCULO}  Get Current Date
    ${DATA_VINCULO}  Subtract Time From Date   ${DATA_VINCULO}     29 days
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     exclude_millis=yes
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     10 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente4}  Create List   ${arg1[71]}  ${arg1[70]}  10  ${arg1[38]}  ${DATA_ADMISSAO}  ${arg1[74]}  ${arg1[76]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_VINCULO}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  47  48

    Edit Line  3  ${dependente4}   ${slots_dependente}


Dependente Conjuge com a "Data Admissão Empresa" a menos 20 dias da data atual e "Data de Vinculo" igual a menos 29 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_VINCULO}  Get Current Date
    ${DATA_VINCULO}  Subtract Time From Date   ${DATA_VINCULO}     29 days
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     exclude_millis=yes
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     20 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
 
    ${dependente5}  Create List   ${arg1[80]}  ${arg1[79]}  01  ${arg1[39]}  ${DATA_ADMISSAO}  ${arg1[83]}  ${arg1[85]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_VINCULO}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  47  48

    Edit Line  4  ${dependente5}   ${slots_dependente}


Dependente Filho com a "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 19 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_VINCULO}  Get Current Date
    ${DATA_VINCULO}  Subtract Time From Date   ${DATA_VINCULO}     19 days
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     exclude_millis=yes
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     21 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente6}  Create List   ${arg1[88]}  ${arg1[87]}  10  ${arg1[39]}  ${DATA_ADMISSAO}  ${arg1[91]}  ${arg1[93]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_VINCULO}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  47  48

    Edit Line  5  ${dependente6}   ${slots_dependente}


Dependente Filho Adotivo com a "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 20 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_VINCULO}  Get Current Date
    ${DATA_VINCULO}  Subtract Time From Date   ${DATA_VINCULO}     20 days
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     exclude_millis=yes
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     21 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${dependente7}  Create List   ${arg1[95]}  ${arg1[94]}  70  ${arg1[38]}  ${DATA_ADMISSAO}  ${arg1[98]}  ${arg1[100]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_VINCULO}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  47  48

    Edit Line  6  ${dependente7}   ${slots_dependente}


Dependente Conjuge com a "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 21 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains    Importação » Criar    timeout=${TIMEOUT}
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Cliente (PF)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Cliente (PJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Cliente (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    #Edit Line  <linha>  <novo conteudo () linha inteira>
    ${DATA_INICIO_VIGENCIA}  Get Current Date
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     exclude_millis=yes
    ${DATA_INICIO_VIGENCIA}  Convert Date       ${DATA_INICIO_VIGENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_VINCULO}  Get Current Date
    ${DATA_VINCULO}  Subtract Time From Date   ${DATA_VINCULO}     21 days
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     exclude_millis=yes
    ${DATA_VINCULO}  Convert Date       ${DATA_VINCULO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${DATA_ADMISSAO}  Get Current Date
    ${DATA_ADMISSAO}  Subtract Time From Date   ${DATA_ADMISSAO}     21 days
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     exclude_millis=yes
    ${DATA_ADMISSAO}  Convert Date       ${DATA_ADMISSAO}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    
    ${dependente8}  Create List   ${arg1[104]}  ${arg1[103]}  01  ${arg1[39]}  ${DATA_ADMISSAO}  ${arg1[107]}  ${arg1[109]}  ${PROD_ACESSORIO}  ${PROD_ASSIST}  ${DATA_VINCULO}  ${DATA_INICIO_VIGENCIA}

    ${slots_dependente}  Create List   0  1  4  5  7  8  14  30  31  47  48

    Edit Line  7  ${dependente8}   ${slots_dependente}


Validar que coluna "Data Base Carência" foi preenchido da seguinte forma: (8 Vidas)
    # Pegar valores da table
    ${nome_beneficiario1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  3    1
    Set Test Variables  ${nome_beneficiario1} 

    ${nome_beneficiario2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  4    1
    Set Test Variables  ${nome_beneficiario2} 

    ${nome_beneficiario3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  5    1
    Set Test Variables  ${nome_beneficiario3} 

    ${nome_beneficiario4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  6    1
    Set Test Variables  ${nome_beneficiario4} 

    ${nome_beneficiario5}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  7    1
    Set Test Variables  ${nome_beneficiario5} 

    ${nome_beneficiario6}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  8    1
    Set Test Variables  ${nome_beneficiario6} 

    ${nome_beneficiario7}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  9    1
    Set Test Variables  ${nome_beneficiario7} 

    ${nome_beneficiario8}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  10   1
    Set Test Variables  ${nome_beneficiario8} 


Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[48]}' or '${nome_beneficiario1}' == '${arg1[88]}'   Validar Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[48]}' or '${nome_beneficiario2}' == '${arg1[88]}'   Validar Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[48]}' or '${nome_beneficiario3}' == '${arg1[88]}'   Validar Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[48]}' or '${nome_beneficiario4}' == '${arg1[88]}'   Validar Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[48]}' or '${nome_beneficiario5}' == '${arg1[88]}'   Validar Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[48]}' or '${nome_beneficiario6}' == '${arg1[88]}'   Validar Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[48]}' or '${nome_beneficiario7}' == '${arg1[88]}'   Validar Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[48]}' or '${nome_beneficiario8}' == '${arg1[88]}'   Validar Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias  10


Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[56]}' or '${nome_beneficiario1}' == '${arg1[72]}' or '${nome_beneficiario1}' == '${arg1[96]}'  Validar Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[56]}' or '${nome_beneficiario2}' == '${arg1[72]}' or '${nome_beneficiario2}' == '${arg1[96]}'  Validar Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[56]}' or '${nome_beneficiario3}' == '${arg1[72]}' or '${nome_beneficiario3}' == '${arg1[96]}'  Validar Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[56]}' or '${nome_beneficiario4}' == '${arg1[72]}' or '${nome_beneficiario4}' == '${arg1[96]}'  Validar Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[56]}' or '${nome_beneficiario5}' == '${arg1[72]}' or '${nome_beneficiario5}' == '${arg1[96]}'  Validar Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[56]}' or '${nome_beneficiario6}' == '${arg1[72]}' or '${nome_beneficiario6}' == '${arg1[96]}'  Validar Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[56]}' or '${nome_beneficiario7}' == '${arg1[72]}' or '${nome_beneficiario7}' == '${arg1[96]}'  Validar Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[56]}' or '${nome_beneficiario8}' == '${arg1[72]}' or '${nome_beneficiario8}' == '${arg1[96]}'  Validar Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias  10


Dependente Conjuge com a Data Base Carencia igual a Data de vigência
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[64]}' or '${nome_beneficiario1}' == '${arg1[104]}'   Validar Dependente Conjuge com a Data Base Carencia igual a Data de vigência  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[64]}' or '${nome_beneficiario2}' == '${arg1[104]}'   Validar Dependente Conjuge com a Data Base Carencia igual a Data de vigência  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[64]}' or '${nome_beneficiario3}' == '${arg1[104]}'   Validar Dependente Conjuge com a Data Base Carencia igual a Data de vigência  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[64]}' or '${nome_beneficiario4}' == '${arg1[104]}'   Validar Dependente Conjuge com a Data Base Carencia igual a Data de vigência  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[64]}' or '${nome_beneficiario5}' == '${arg1[104]}'   Validar Dependente Conjuge com a Data Base Carencia igual a Data de vigência  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[64]}' or '${nome_beneficiario6}' == '${arg1[104]}'   Validar Dependente Conjuge com a Data Base Carencia igual a Data de vigência  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[64]}' or '${nome_beneficiario7}' == '${arg1[104]}'   Validar Dependente Conjuge com a Data Base Carencia igual a Data de vigência  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[64]}' or '${nome_beneficiario8}' == '${arg1[104]}'   Validar Dependente Conjuge com a Data Base Carencia igual a Data de vigência  10

Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias
    [Arguments]  @{arg1}
    Run Keyword If  '${nome_beneficiario1}' == '${arg1[80]}'   Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias  3
    Run Keyword If  '${nome_beneficiario2}' == '${arg1[80]}'   Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias  4
    Run Keyword If  '${nome_beneficiario3}' == '${arg1[80]}'   Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias  5
    Run Keyword If  '${nome_beneficiario4}' == '${arg1[80]}'   Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias  6
    Run Keyword If  '${nome_beneficiario5}' == '${arg1[80]}'   Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias  7
    Run Keyword If  '${nome_beneficiario6}' == '${arg1[80]}'   Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias  8
    Run Keyword If  '${nome_beneficiario7}' == '${arg1[80]}'   Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias  9
    Run Keyword If  '${nome_beneficiario8}' == '${arg1[80]}'   Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias  10


Validar Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias
    [Arguments]    ${i}
    ${nome_beneficiario_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    ${CALCULO_DATA_BASE_CARENCIA}  Get Current Date
    ${CALCULO_DATA_BASE_CARENCIA}  Subtract Time From Date   ${CALCULO_DATA_BASE_CARENCIA}     301 days
    ${CALCULO_DATA_BASE_CARENCIA}  Convert Date       ${CALCULO_DATA_BASE_CARENCIA}     exclude_millis=yes
    ${CALCULO_DATA_BASE_CARENCIA}  Convert Date       ${CALCULO_DATA_BASE_CARENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    
    Should Be Equal  ${CALCULO_DATA_BASE_CARENCIA}  ${data_base_carencia_tela}
    Run Keyword If  '${data_base_carencia_tela}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia_tela} e ${data_base_vigencia}.  INFO


Validar Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias
    [Arguments]    ${i}
    ${nome_beneficiario_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    ${CALCULO_DATA_BASE_CARENCIA}  Get Current Date
    ${CALCULO_DATA_BASE_CARENCIA}  Subtract Time From Date   ${CALCULO_DATA_BASE_CARENCIA}     301 days
    ${CALCULO_DATA_BASE_CARENCIA}  Convert Date       ${CALCULO_DATA_BASE_CARENCIA}     exclude_millis=yes
    ${CALCULO_DATA_BASE_CARENCIA}  Convert Date       ${CALCULO_DATA_BASE_CARENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    
    Should Be Equal  ${CALCULO_DATA_BASE_CARENCIA}  ${data_base_carencia_tela}
    Run Keyword If  '${data_base_carencia_tela}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia_tela} e ${data_base_vigencia}.  INFO


Validar Dependente Conjuge com a Data Base Carencia igual a Data de vigência
    [Arguments]    ${i}
    ${nome_beneficiario_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    Should Be Equal  ${data_base_vigencia_tela}  ${data_base_carencia_tela}
    Run Keyword If  '${data_base_carencia_tela}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia_tela} e ${data_base_vigencia}.  INFO


Validar Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias
    [Arguments]    ${i}
    ${nome_beneficiario_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    1
    ${data_base_vigencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    2
    ${data_base_carencia_tela}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_beneficiarios"]/table  ${i}    3
    
    ${CALCULO_DATA_BASE_CARENCIA}  Get Current Date
    ${CALCULO_DATA_BASE_CARENCIA}  Subtract Time From Date   ${CALCULO_DATA_BASE_CARENCIA}     301 days
    ${CALCULO_DATA_BASE_CARENCIA}  Convert Date       ${CALCULO_DATA_BASE_CARENCIA}     exclude_millis=yes
    ${CALCULO_DATA_BASE_CARENCIA}  Convert Date       ${CALCULO_DATA_BASE_CARENCIA}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    
    Should Be Equal  ${CALCULO_DATA_BASE_CARENCIA}  ${data_base_carencia_tela}
    Run Keyword If  '${data_base_carencia_tela}' == 'None'  Pass Execution  Data Base Carência do Beneficiario: 00 - Titular ${nome_beneficiario} não está preenchido!
    Log  O Beneficiario ${nome_beneficiario} possui a Data Base Carência e Data Vigencia igual a: ${data_base_carencia_tela} e ${data_base_vigencia}.  INFO


Validar o preenchimento automaticamente do campo "Processo de Declaração de Saúde" com o ID da Movimentação
    ${NUMERO_DECLARACAO_DE_SAUDE}  Get Text  xpath://*[@id="LBL_DETAILVIEW_PANEL1"]/tbody/tr[6]/td[2]/a
    Set Test Variables  ${NUMERO_DECLARACAO_DE_SAUDE}
    
    Should Not Be Empty  ${NUMERO_DECLARACAO_DE_SAUDE}


    