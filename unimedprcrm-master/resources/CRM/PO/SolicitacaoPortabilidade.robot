*** Settings ***
Library    SeleniumLibrary
Resource    ../../../main.resource
*** Variables ***
${TIMEOUT} =  30
${BOTAO_CRIAR_SOLICITACAO_PORTABILIDADE} =  xpath://*[@id="create_link"]
${INPUT_CONTRATO_NOME} =  id:contrato_nome
${STATUS_SITUACAO} =  xpath://*[@id="DEFAULT"]/tbody/tr[1]/td[4]
${STATUS_TIPO} =  xpath://*[@id="DEFAULT"]/tbody/tr[5]/td[2]
${SETA_INPUT_CONTRATO} =  xpath://*[@id="contrato_custom_span"]/span/button[1]
${INPUT_NOME_BENEF} =  id:beneficiario_nome_advanced
${INPUT_TITULO_CONTRATO} =  id:name_advanced
${BOTAO_PESQUISAR_BENEF} =  id:search_form_submit
${RESULTADO_BENEF} =  xpath:/html/body/table[4]/tbody[2]/tr[1]/td[1]/a
${SUBMENU_EMITIR_PROPOSTA_DE_ADESAO_PORTABILIDADE} =  xpath://*[@id="detail_header_action_menu"]//a[contains(., 'Proposta de Adesão de Portabilidade')]
${DATA_EMISSAO_PROPOSTA_ADESAO} =  id:data_emissao_proposta_c
${PROTOCOLO_SOLICITACAO_PORTABILIDADE} =  id:protocolo
${DATA_SOLICITACAO} =  id:data_solicitacao
${PRAZO_RESPOSTA} =  id:prazo_resposta
${DATA_HORA_ENVIO_ANALISE} =  id:data_envio_analise
${RESPONSAVEL_ENVIO_ANALISE} =  id:user_id_c
${SITUACAO_SOLICITACAO_PORTABILIDADE} =  xpath://*[@id="subPanel"]/tbody/tr[1]/td[11]/span/b/u/a
${SITUACAO_SOLICITACAO_PORTABILIDADE2} =  xpath://*[@id="subPanel"]/tbody/tr[2]/td[11]/span/b/u/a
${DATA_ENCERRAMENTO_PROTOCOLO} =  id:data_encerramento_protocolo_c


*** Keywords ***
Verificar se está na Tela de Solicitação de Portabilidade
    Wait Until Page Contains  Solicitação de Portabilidade » Pesquisar  timeout=${TIMEOUT}


Clicar no menu "Criar Solicitação de Portabilidade"
    Set Focus To Element  ${BOTAO_CRIAR_SOLICITACAO_PORTABILIDADE}
    Click Element  ${BOTAO_CRIAR_SOLICITACAO_PORTABILIDADE}


Preencher o campo "Contrato" e clicou no botão "SALVAR"
    [Arguments]  ${arg1}
    Wait Until Page Contains  Solicitação de Portabilidade » Criar   timeout=${TIMEOUT}
    Set Focus To Element   ${SETA_INPUT_CONTRATO}
    Click Element   ${SETA_INPUT_CONTRATO}
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Maximize Browser Window
    Sleep  15s
    Wait Until Page Contains  Pesquisar Contratos   timeout=${TIMEOUT}
    Input Text  ${INPUT_TITULO_CONTRATO}  ${arg1}
    Set Focus To Element   ${BOTAO_PESQUISAR_BENEF}
    Click Element   ${BOTAO_PESQUISAR_BENEF}
    Sleep  10s
    Set Focus To Element   ${RESULTADO_BENEF}
    Click Element   ${RESULTADO_BENEF}
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '1'   Switch Window  ${excludes[0]}
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}

    Wait Until Page Contains  Solicitação de Portabilidade » Criar   timeout=${TIMEOUT}
    # Input Text  ${INPUT_CONTRATO_NOME}  ${arg1}
    Execute Javascript   document.getElementById("SAVE_HEADER").click()
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword If  "${f[0]}" == "PASS"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60


Apresentar a tela de Solicitação de Portabilidade » Solicitação - data e hora atual, campo "Situação" igual a RASCUNHO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y %H
    Wait Until Page Contains  Solicitação de Portabilidade » Solicitação - ${date}   timeout=${TIMEOUT}
    ${STATUS_SITUACAO}  Get Text  ${STATUS_SITUACAO}
    Should Be Equal  ${STATUS_SITUACAO}  Rascunho
    ${STATUS_TIPO}  Get Text  ${STATUS_TIPO}
    Should Be Equal  ${STATUS_TIPO}  Movimentação Cadastral


Apresentou mensagem "Portabilidade encaminhada para validação." e alterou a "Situação" para AGUARDANDO VALIDAÇÃO
    Wait Until Page Contains  Portabilidade encaminhada para validação.   timeout=${TIMEOUT}
    ${STATUS_SITUACAO}  Get Text  ${STATUS_SITUACAO}
    Should Be Equal  ${STATUS_SITUACAO}  Aguardando Validação


Clicar no botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    Wait Until Page Contains  Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?   timeout=${TIMEOUT}
    Click Element                 ${BOTAO_SIM_CONFIRMACAO}


Apresentar a mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente." e alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
    Wait Until Page Contains      Situação alterada para: Assinatura da Proposta de Adesão Pendente.
    ${STATUS_SITUACAO}  Get Text  ${STATUS_SITUACAO}
    Should Be Equal  ${STATUS_SITUACAO}  Assinatura da Proposta de Adesão Pendente


Clicar no menu "Emitir Proposta de Adesão de Portabilidade"
    Set Focus To Element   ${SETA_EDITAR}
    Click Element  ${SETA_EDITAR}
    Set Focus To Element   ${SUBMENU_EMITIR_PROPOSTA_DE_ADESAO_PORTABILIDADE}
    Click Element  ${SUBMENU_EMITIR_PROPOSTA_DE_ADESAO_PORTABILIDADE}
    Sleep  5s


# Voltar para a aba da Portabilidade
#     ${excludes} =    Get Window Handles
#     ${tam} =  Get Length    ${excludes}
#     #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
#     Run Keyword If  '${tam}' == '1'   Switch Window  ${excludes[0]}
#     Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[0]}
#     Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[1]}


Apresentar o campo "Data Emissão Proposta de Adesão de Portabilidade" preenchido a data e hora atual
    Wait Until Page Contains  Solicitação de Portabilidade » Solicitação   timeout=${TIMEOUT}
    Sleep  5s
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y %H
    ${DATA_EMISSAO_PROPOSTA}  Get Text  ${DATA_EMISSAO_PROPOSTA_ADESAO}
    Should Contain	  ${DATA_EMISSAO_PROPOSTA}  ${date}


Clicar no botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    Wait Until Page Contains  Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado.   timeout=${TIMEOUT}
    Execute Javascript   document.getElementById("yui-gen0-button").click()


Atualizar o titulo da tela para Solicitação de Portabilidade » Protocolo
    Wait Until Page Contains  Solicitação de Portabilidade »   timeout=${TIMEOUT}


Apresentar a mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    Wait Until Page Contains  Portabilidade encaminhada para análise.   timeout=${TIMEOUT}
    ${PROTOCOLO_SOLICITACAO_PORTABILIDADE}  Get Text  ${PROTOCOLO_SOLICITACAO_PORTABILIDADE}
    ${PROTOCOLO_SOLICITACAO_PORTABILIDADE}  Set Variables  ${PROTOCOLO_SOLICITACAO_PORTABILIDADE}

    ${STATUS_SITUACAO}  Get Text  ${STATUS_SITUACAO}
    Should Contain	${STATUS_SITUACAO}  Aguardando Análise

    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y %H

    ${DATA_SOLICITACAO}  Get Text  ${DATA_SOLICITACAO}
    Should Contain	${DATA_SOLICITACAO}  ${date}

    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     20 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y

    ${PRAZO_RESPOSTA}  Get Text  ${PRAZO_RESPOSTA}
    Should Contain	${PRAZO_RESPOSTA}  ${date}


Apresentar o painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y %H

    ${DATA_HORA_ENVIO_ANALISE}  Get Text  ${DATA_HORA_ENVIO_ANALISE}
    Should Contain	${DATA_HORA_ENVIO_ANALISE}  ${date}

    ${RESPONSAVEL_ENVIO_ANALISE}  Get Text  ${RESPONSAVEL_ENVIO_ANALISE}
    Should Be Equal  ${RESPONSAVEL_ENVIO_ANALISE}  	Prime Automação


Preencher o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
    Wait Until Page Contains    1) Trata-se de portabilidade especial ou extraordinária?
    Click Element      ${SIM_PERGUNTA_1}
    Wait Until Page Contains    2) O beneficiário está ativo na operadora de origem?
    Click Element      ${SIM_PERGUNTA_2}
    Wait Until Page Contains    3) O beneficiário deu entrada no pedido de portabilidade dentro do prazo da RO (Resolução Operacional)?
    Click Element      ${SIM_PERGUNTA_3}
    Wait Until Page Contains    4) O beneficiário comprovou o adimplemento das 03 últimas mensalidades?
    Click Element      ${SIM_PERGUNTA_4}
    Wait Until Page Contains    5) O plano de destino está com status de “ativo com comercialização suspensa”?
    Click Element      ${SIM_PERGUNTA_5}
    Wait Until Page Contains    6) O(A) beneficiário(a) será titular no plano de destino?
    Click Element      ${SIM_PERGUNTA_6}
    Wait Until Page Contains    7) O plano de destino é do tipo individual/familiar?
    Click Element      ${NAO_PERGUNTA_7}
    Wait Until Page Contains    8) O plano coletivo de destino está com status de “ativo com comercialização suspensa” por solicitação da operadora?
    Click Element      ${SIM_PERGUNTA_8}
    Wait Until Page Contains    9) O beneficiário titular comprovou o vínculo com a pessoa jurídica contratante do plano de destino (elegibilidade)?
    Click Element      ${SIM_PERGUNTA_9}
    Wait Until Page Contains    10) O plano de destino possui segmentação assistencial superior ao plano de origem, sendo tal ampliação de cobertura passível de aplicação de carências?
    Click Element      ${NAO_PERGUNTA_10}
    Wait Until Page Contains    11) Beneficiário possui menos de 24 meses na operadora de origem?
    Click Element      ${NAO_PERGUNTA_11}
    Wait Until Page Contains    12) O plano de destino é coletivo?
    Click Element      ${SIM_PERGUNTA_12}
    Wait Until Page Contains    13) Houve aceite total de portabilidade para todos os demais membros do mesmo grupo familiar?
    Click Element      ${SIM_PERGUNTA_13}
    
    Wait Until Page Contains         APTO(A) AO EXERCÍCIO DA PORTABILIDADE


Validar o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    Wait Until Page Contains  Solicitação de Portabilidade »   timeout=${TIMEOUT}
    ${SITUACAO_SOLICITACAO_PORTABILIDADE}  Get Text  ${SITUACAO_SOLICITACAO_PORTABILIDADE}
    Should Be Equal  ${SITUACAO_SOLICITACAO_PORTABILIDADE}  	Portabilidade Aprovada


Preencher o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    Wait Until Page Contains    1) Trata-se de portabilidade especial ou extraordinária?
    Click Element      ${SIM_PERGUNTA_1}
    Wait Until Page Contains    2) O beneficiário está ativo na operadora de origem?
    Click Element      ${SIM_PERGUNTA_2}
    Wait Until Page Contains    3) O beneficiário deu entrada no pedido de portabilidade dentro do prazo da RO (Resolução Operacional)?
    Click Element      ${SIM_PERGUNTA_3}
    Wait Until Page Contains    4) O beneficiário comprovou o adimplemento das 03 últimas mensalidades?
    Click Element      ${SIM_PERGUNTA_4}
    Wait Until Page Contains    5) O plano de destino está com status de “ativo com comercialização suspensa”?
    Click Element      ${SIM_PERGUNTA_5}
    Wait Until Page Contains    6) O(A) beneficiário(a) será titular no plano de destino?
    Click Element      ${SIM_PERGUNTA_6}
    Wait Until Page Contains    7) O plano de destino é do tipo individual/familiar?
    Click Element      ${NAO_PERGUNTA_7}
    Wait Until Page Contains    8) O plano coletivo de destino está com status de “ativo com comercialização suspensa” por solicitação da operadora?
    Click Element      ${SIM_PERGUNTA_8}
    Wait Until Page Contains    9) O beneficiário titular comprovou o vínculo com a pessoa jurídica contratante do plano de destino (elegibilidade)?
    Click Element      ${SIM_PERGUNTA_9}
    Wait Until Page Contains    10) O plano de destino possui segmentação assistencial superior ao plano de origem, sendo tal ampliação de cobertura passível de aplicação de carências?
    Click Element      ${SIM_PERGUNTA_10}

    
    Wait Until Page Contains         APTO(A) PARCIAL AO EXERCÍCIO DA PORTABILIDADE


Validar o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Wait Until Page Contains  Solicitação de Portabilidade »   timeout=${TIMEOUT}
    ${SITUACAO_SOLICITACAO_PORTABILIDADE2}  Get Text  ${SITUACAO_SOLICITACAO_PORTABILIDADE2}
    Should Be Equal  ${SITUACAO_SOLICITACAO_PORTABILIDADE2}  	Portabilidade Aprovada Parcial


Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    Wait Until Page Contains  Deseja Finalizar Protocolo?   timeout=${TIMEOUT}
    Execute Javascript   document.getElementById("yui-gen0-button").click()
    

Validou a apresentação da mensagem "Protocolo Finalizado.", a "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual
    Wait Until Page Contains  Protocolo Finalizado.   timeout=${TIMEOUT}
    ${STATUS_SITUACAO}  Get Text  ${STATUS_SITUACAO}
    Should Be Equal  ${STATUS_SITUACAO}  Aprovada

    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y %H

    ${DATA_ENCERRAMENTO_PROTOCOLO}  Get Text  ${DATA_ENCERRAMENTO_PROTOCOLO}
    Should Contain	${DATA_ENCERRAMENTO_PROTOCOLO}  ${date}


O CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade, com situação igual a APROVADA	
    Wait Until Page Contains  Solicitação de Portabilidade »   timeout=${TIMEOUT}    
    ${STATUS_SITUACAO}  Get Text  ${STATUS_SITUACAO}
    Should Be Equal  ${STATUS_SITUACAO}  Aprovada