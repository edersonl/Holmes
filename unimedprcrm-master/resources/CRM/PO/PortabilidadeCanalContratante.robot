*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary

Resource  ../PO/MenuSuperior.robot
Resource  ../CRMUnimedPR.robot
Resource  ../../../utils/Comum.robot

*** Variables ***
${TIMEOUT} =  120
${USER} =  prime1
${INPUT_LOGIN_PESQUISA} =  xpath://*[@id="name_basic"]
${BOTAO_PESQUISAR_CANAL} =  id:search_form_submit
${USER_LOGIN} =  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[4]/b/a
${USER_DESEJADO} =  xpath://*[@id="pagecontent"]/div[1]/h2
${CONTRATO_SELECIONAR} =  id:saude_portal_usuarios_aos_contracts_1_select_button
${SUB_PAINEL} =  id:subPanel
${VALIDAR_SELECT_ALL} =  id:validarmassa_select_all
${BTN_VALIDAR} =  xpath://*[@id="formValidarEmMassa"]/div/div/div[3]/button[1]
${OPERADORA_ORIGEM} =  id:num_reg_operadora_origem
${PLANO_ORIGEM} =  id:num_reg_plano_origem
${OPERADORA_ORIGEM_REG} =  xpath://div[2]/div/div/form/div/div[1]/div[1]/div[3]/table/tbody/tr[11]/td[2]/input
${PLANO_ORIGEM_REG} =  xpath://div[2]/div/div/form/div/div[1]/div[1]/div[3]/table/tbody/tr[11]/td[4]/input
${ABA_CHECKLIST} =  id:tab2
${LABEL_RESPOSTA_1} =  xpath://*[@id="checklist_span"]/table/tbody/tr[2]/td[2]/span[1]/label/input
${LABEL_RESPOSTA_2} =  xpath://*[@id="checklist_span"]/table/tbody/tr[3]/td[2]/span[1]/label/input
${BTN_SALVAR_CHECKLIST} =  id:SAVE_FOOTER
${BTN_EDITAR_SOLICITACAO} =  xpath://*[@id="detail_header_action_menu"]/li
${MENU_SUP_EDITAR} =  xpath://*[@id="detail_header_action_menu"]/li/span
${SOLICITAR_ASSINATURA} =  xpath://*[@id="detail_header_action_menu"]/li/ul/li[2]/a
${BTN_SIM} =  id:yui-gen0-button
${VALIDACAO_SITUACAO} =  xpath://*[@id="DEFAULT"]/tbody/tr[1]/td[4]
${SITUACAO_VALIDACAO_ASSINATURA} =  xpath://*[@id="situacao_basic"]/option[5][contains(.,'Aguardando validação de Assinatura da Proposta de Adesão')]
${SOLICITAÇAO_ASSINATURA} =  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]/b/a
${ENCAMINHAR_ANALISE} =  xpath://*[@id="detail_header_action_menu"]/li/ul/li[1]/a
${PROTOCOLO_NUM} =  id:protocolo
${SITUACAO_PROTOCOLO} =  xpath://*[@id="DEFAULT"]/tbody/tr[1]/td[4][contains(.,'Aprovada')]
${TITLE_SOLICITACAO_PROTOCOLO} =  xpath://*[@id="pagecontent"]/div[1]/h2
${DATA_SOLICITACAO} =  id:data_solicitacao
${PRAZO_RESPOSTA} =  id:prazo_resposta
${DATA_ENVIO_ANALISE} =  id:data_envio_analise
${RESPONSAVEL_ENVIO} =  id:user_id_c
${PORTABILIDADE_PESSOA} =  id:list_subpanel_saude_ptb_pessoa_saude_ptb_portabilidade
${ANALISAR_BTN} =  id:saude_ptb_pessoa_saude_ptb_portabilidade_edit_1
${QUESTIONARIO_ELEGIBILIDADE} =  id:tab2
${DETAIL_PAINEL} =  id:detailpanel_3
${PERGUNTA_1} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[2]/span[1]/label
${PERGUNTA_2} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[2]/span[1]/label
${PERGUNTA_3} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[2]/span[1]/label
${PERGUNTA_4} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[2]/span[1]/label
${PERGUNTA_5} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]/label
${PERGUNTA_6} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]/label
${PERGUNTA_7} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[2]/label
${PERGUNTA_8} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]/label
${PERGUNTA_9} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]/label
${PERGUNTA_10} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[2]/label
${PERGUNTA_10_2} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]/label
${PERGUNTA_11} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[2]/label
${PERGUNTA_12} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]/label
${PERGUNTA_13} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]/label
${SALVAR_QUESTIONARIO} =  id:SAVE_FOOTER
${SITUACAO_APROVADA_TITULAR} =  xpath://*[@id="subPanel"]/tbody/tr[1]/td[11]/span/b/u/a
${ANALISAR_BTN_2} =  id:saude_ptb_pessoa_saude_ptb_portabilidade_edit_2
${SITUACAO_APROVADA_DEP} =  xpath://*[@id="subPanel"]/tbody/tr[2]/td[11]/span/b/u/a
${FINALIZAR_PROTOCOLO_PORT} =  xpath://*[@id="detail_header_action_menu"]/li/ul/li[2]
${PROTOCOLO_FINALIZADO} =  xpath://*[@id="pagecontent"]/div[2]
${DATA_ENCERRAMENTO} =  id:data_encerramento_protocolo_c
${VALIDAR_EM_MASSA} =  xpath://*[@id="subPanel"]/thead/tr[1]/td/table/tbody/tr/td[1]/ul/li/a[contains(.,'Validar em Massa')]
${PESQUISAR_LIMPAR} =  id:search_form_clear
${SOLICITACAO_PORTABILIDADE_MENU} =  xpath://*[@id="bs-example-navbar-collapse-1"]/ul/li[2]/span[2]/ul/li[15][contains(.,'Solicitação de Portabilidade')]
${MENSAGEM_ANALISE} =  Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado.
${USER_NAME} =  id:usermenu
${STATUS_MENU} =  id:status_advanced
${INTEGRADO} =  xpath://*[@id="status_advanced"]/option[4][contains(.,'Integrado')]
${DATA_VIGENCIA} =  xpath://*[@id="start_date_advanced"]
${CHECKBOX} =  id:massall_top
${SELECIONAR} =  id:MassUpdate_select_button

*** Keywords ***
Preencheu o campo "Login" e clicou no botão "PESQUISAR"
   Wait Until Page Contains   Usuários Canal do Contratante » Pesquisar   timeout=${TIMEOUT}
   Input Text  ${INPUT_LOGIN_PESQUISA}  ${USER}
   Set Focus To Element   ${BOTAO_PESQUISAR_CANAL}
   Click Element  ${BOTAO_PESQUISAR_CANAL}

Acessou o usuário desejado
   Wait Until Page Contains  ${USER}  timeout=${TIMEOUT}
   Click Element  ${USER_LOGIN}
   
Vinculou o Contrato integrado no painel "Contrato"
   Wait Until Page Contains  Usuários Canal do Contratante » prime1  timeout=${TIMEOUT}
   Scroll Element Into View  ${CONTRATO_SELECIONAR}
   Click Element  ${CONTRATO_SELECIONAR}
   Switch Window  url:${CRM_URL}?module=AOS_Contracts&action=Popup&hide_clear_button=true&mode=MultiSelect&create=true
   Page Should Contain  Pesquisar Contratos
   Click Element  ${PESQUISAR_LIMPAR}
   Set Focus To Element  ${STATUS_MENU}
   Click Element  ${INTEGRADO}
   Click Element  id:start_date_advanced_trigger
   Click Element  id:callnav_today
   Click Element  ${BOTAO_PESQUISAR_CANAL}
   Sleep  10s
   ${ID_SISTEMA_GESTAO}  Get Text   xpath://*[@id="MassUpdate"]/table[2]/tbody[2]/tr[1]/td[5]
   Set Global Variable  ${ID_GESTAO}  ${ID_SISTEMA_GESTAO} 
   Click Element  ${CHECKBOX}
   Click Element  ${SELECIONAR}
   Switch Window  MAIN
   

Clicou no botão "VALIDAR EM MASSA"
   Set Focus To Element  ${SUB_PAINEL}
   Mouse Down  ${SUB_PAINEL}
   Sleep  60s
   Click Element  ${VALIDAR_EM_MASSA}

Selecionou as pessoas e clicou no botão "VALIDAR"
   Wait Until Page Contains  Validar em Massa  timeout=${TIMEOUT}
   Sleep  60s
   Click Element  ${VALIDAR_SELECT_ALL}
   Click Element  ${BTN_VALIDAR}

Clicou aba "${CHECKLIST_DOCUMENTACAO}"
   Wait Until Page Contains   Pessoa (Portabilidade) » Editar   timeout=${TIMEOUT}
   Input Text  ${OPERADORA_ORIGEM}  123
   Input Text  ${PLANO_ORIGEM}  123
   Mouse Over  ${OPERADORA_ORIGEM_REG}
   Input Text  ${OPERADORA_ORIGEM_REG}  456
   Input Text  ${PLANO_ORIGEM_REG}  456
   Mouse Up  ${ABA_CHECKLIST}
   Click Element  ${ABA_CHECKLIST}

Selecionou opção "Presente" e clicou no botão "SALVAR"
   Wait Until Page Contains   RG e CNH   timeout=${TIMEOUT}
   Click Element  ${LABEL_RESPOSTA_1}
   Click Element  ${LABEL_RESPOSTA_2}
   Click Element  ${BTN_SALVAR_CHECKLIST}

Clicou o menu "SOLICITAR ASSINATURA DE PROPOSTA DE ADESÃO DE PORTABILIDADE"
   Set Focus To Element  ${BTN_EDITAR_SOLICITACAO}
   Click Element  ${MENU_SUP_EDITAR}
   Set Focus To Element  ${SOLICITAR_ASSINATURA}
   Click Element  ${SOLICITAR_ASSINATURA}

Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
   Wait Until Page Contains  Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?  timeout=${TIMEOUT}
   Click Element  ${BTN_SIM}

Apresentou mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente."
   Wait Until Page Contains  Situação alterada para: Assinatura da Proposta de Adesão Pendente.

Alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
   Wait Until Page Contains  Básica  timeout=${TIMEOUT}
   Element Text Should Be  ${VALIDACAO_SITUACAO}  Assinatura da Proposta de Adesão Pendente
   Close Browser

Acessou Solicitação de Portabilidade pelo CRM
   Comum.Abrir Nav
   CRMUnimedPR.Usuário logou no sistema
   MenuSuperior.Colocar o mouse no Parametros
   MenuSuperior.Clicar no submenu Parametros Comerciais
   Set Focus To Element  id:tab1
   Click Element  id:tab1
   ${RESPOSTA_PORTABILIDADE}  Get Text  id:prazo_resposta_portabilidade_c
   Set Global Variable  ${RESPOSTA_PORTABILIDADE}
   MenuSuperior.Colocar o mouse no Comercial
   Click Element  ${SOLICITACAO_PORTABILIDADE_MENU}
   Click Element  ${PESQUISAR_LIMPAR}
   Click Element  ${SITUACAO_VALIDACAO_ASSINATURA}
   Click Element  ${BOTAO_PESQUISAR_CANAL}
   Sleep  30s
   Mouse Down  ${SOLICITAÇAO_ASSINATURA}
   Click Element  ${SOLICITAÇAO_ASSINATURA}

Clicou o menu "ENCAMINHAR PARA ANÁLISE"
   Set Focus To Element  ${MENU_SUP_EDITAR}
   Click Element  ${MENU_SUP_EDITAR}
   Click Element  ${ENCAMINHAR_ANALISE}

Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
   Wait Until Page Contains  ${MENSAGEM_ANALISE}  timeout=${TIMEOUT}
   Click Element   ${BTN_SIM}

Atualizou titulo da tela para Solicitação de Portabilidade » Protocolo
   Wait Until Page Contains  Solicitação de Portabilidade  timeout=${TIMEOUT}
   ${PROTOCOLO_NUMERO}  Get Text  ${PROTOCOLO_NUM}
   Set Global Variable  ${PROTOCOLO}  ${PROTOCOLO_NUMERO}
   ${TITULO_PORTABILIDADE} =  Catenate  Solicitação de Portabilidade » ${PROTOCOLO_NUMERO}
   ${TITLE_SOLICITACAO_PROTOCOLO}  Get Text  ${TITLE_SOLICITACAO_PROTOCOLO}
   Should Be Equal  ${TITLE_SOLICITACAO_PROTOCOLO}  ${TITULO_PORTABILIDADE}


Apresentou mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
   Page Should Contain   Portabilidade encaminhada para análise.
   ${PROTOCOLO_NUM}  Get Text  ${PROTOCOLO_NUM}
   Page Should Contain  ${PROTOCOLO_NUM}
   Page Should Contain  Aguardando Análise
   ${date}  Get Current Date
   ${date}  Convert Date  ${date}  exclude_millis=yes
   ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y %H:
   Element Should Contain  ${DATA_SOLICITACAO}  ${data_formatada}
   ${date}  Get Current Date
   ${date}  Add Time To Date  ${date}     ${RESPOSTA_PORTABILIDADE} days
   ${date}  Convert Date  ${date}  exclude_millis=yes
   ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
   ${PRAZO_RESPOSTA}  Get Text  ${PRAZO_RESPOSTA}
   Should Be Equal  ${PRAZO_RESPOSTA}  ${data_formatada}

Apresentou painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado
   Wait Until Page Contains  Dados Envio Análise  timeout=${TIMEOUT}
   ${date}  Get Current Date
   ${date}  Convert Date  ${date}  exclude_millis=yes
   ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y %H:
   Element Should Contain  ${DATA_ENVIO_ANALISE}  ${data_formatada}
   ${USER_LOGADO}  Get Text  ${USER_NAME}
   ${RESPONSAVEL_ENVIAR}  Get Text  ${RESPONSAVEL_ENVIO}
   Should Be Equal  ${USER_LOGADO}  ${RESPONSAVEL_ENVIAR}

Clicou o botão "ANALISAR" da primeira pessoa
   Set Focus To Element   ${PORTABILIDADE_PESSOA}
   Mouse Down  ${PORTABILIDADE_PESSOA}
   Click Element  ${ANALISAR_BTN}

Clicou a aba "Questionário Elegibilidade"
   Wait Until Page Contains   Questionário Elegibilidade  timeout=${TIMEOUT}
   Click Element  ${QUESTIONARIO_ELEGIBILIDADE}

Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
   Wait Until Page Contains   1) Trata-se de portabilidade especial ou extraordinária?
   Click Element  ${PERGUNTA_1}
   Wait Until Page Contains  2) O beneficiário está ativo na operadora de origem?
   Click Element  ${PERGUNTA_2}
   Wait Until Page Contains  3) O beneficiário deu entrada no pedido de portabilidade dentro do prazo da RO (Resolução Operacional)?
   Click Element  ${PERGUNTA_3}
   Wait Until Page Contains  4) O beneficiário comprovou o adimplemento das 03 últimas mensalidades?
   Click Element  ${PERGUNTA_4}
   Wait Until Page Contains  5) O plano de destino está com status de “ativo com comercialização suspensa”?
   Click Element  ${PERGUNTA_5}
   Wait Until Page Contains  6) O(A) beneficiário(a) será titular no plano de destino?
   Click Element  ${PERGUNTA_6}
   Wait Until Page Contains  7) O plano de destino é do tipo individual/familiar?
   Click Element  ${PERGUNTA_7}
   Wait Until Page Contains  8) O plano coletivo de destino está com status de “ativo com comercialização suspensa” por solicitação da operadora?
   Click Element  ${PERGUNTA_8}
   Wait Until Page Contains  9) O beneficiário titular comprovou o vínculo com a pessoa jurídica contratante do plano de destino (elegibilidade)?
   Click Element  ${PERGUNTA_9}
   Wait Until Page Contains  10) O plano de destino possui segmentação assistencial superior ao plano de origem, sendo tal ampliação de cobertura passível de aplicação de carências?
   Click Element  ${PERGUNTA_10}
   Wait Until Page Contains  11) Beneficiário possui menos de 24 meses na operadora de origem?
   Click Element  ${PERGUNTA_11}
   Wait Until Page Contains  12) O plano de destino é coletivo?
   Click Element  ${PERGUNTA_12}
   Wait Until Page Contains  13) Houve aceite total de portabilidade para todos os demais membros do mesmo grupo familiar?
   Click Element  ${PERGUNTA_13}
   Wait Until Page Contains  APTO(A) AO EXERCÍCIO DA PORTABILIDADE
   Click Element  ${SALVAR_QUESTIONARIO}

Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
   Set Focus To Element   ${PORTABILIDADE_PESSOA}
   Element Text Should Be  ${SITUACAO_APROVADA_TITULAR}  Portabilidade Aprovada

Clicou o botão "ANALISAR" da segunda pessoa
   Set Focus To Element   ${PORTABILIDADE_PESSOA}
   Mouse Down  ${PORTABILIDADE_PESSOA}
   Click Element  ${ANALISAR_BTN_2}

Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
   Clicou a aba "Questionário Elegibilidade"
   Wait Until Page Contains   1) Trata-se de portabilidade especial ou extraordinária?
   Click Element  ${PERGUNTA_1}
   Wait Until Page Contains  2) O beneficiário está ativo na operadora de origem?
   Click Element  ${PERGUNTA_2}
   Wait Until Page Contains  3) O beneficiário deu entrada no pedido de portabilidade dentro do prazo da RO (Resolução Operacional)?
   Click Element  ${PERGUNTA_3}
   Wait Until Page Contains  4) O beneficiário comprovou o adimplemento das 03 últimas mensalidades?
   Click Element  ${PERGUNTA_4}
   Wait Until Page Contains  5) O plano de destino está com status de “ativo com comercialização suspensa”?
   Click Element  ${PERGUNTA_5}
   Wait Until Page Contains  6) O(A) beneficiário(a) será titular no plano de destino?
   Click Element  ${PERGUNTA_6}
   Wait Until Page Contains  7) O plano de destino é do tipo individual/familiar?
   Click Element  ${PERGUNTA_7}
   Wait Until Page Contains  8) O plano coletivo de destino está com status de “ativo com comercialização suspensa” por solicitação da operadora?
   Click Element  ${PERGUNTA_8}
   Wait Until Page Contains  9) O beneficiário titular comprovou o vínculo com a pessoa jurídica contratante do plano de destino (elegibilidade)?
   Click Element  ${PERGUNTA_9}
   Wait Until Page Contains  10) O plano de destino possui segmentação assistencial superior ao plano de origem, sendo tal ampliação de cobertura passível de aplicação de carências?
   Click Element  ${PERGUNTA_10_2}
   Wait Until Page Contains  APTO(A) PARCIAL AO EXERCÍCIO DA PORTABILIDADE
   Click Element  ${SALVAR_QUESTIONARIO}

Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
   Set Focus To Element   ${PORTABILIDADE_PESSOA}
   Element Text Should Be  ${SITUACAO_APROVADA_DEP}  Portabilidade Aprovada Parcial
    
Clicar o menu "FINALIZAR PROTOCOLO"
   Set Focus To Element  ${MENU_SUP_EDITAR}
   Click Element  ${MENU_SUP_EDITAR}
   Click Element  ${FINALIZAR_PROTOCOLO_PORT}

Clicar botão "SIM" da modal Confirmação com a mensagem "Deseja Finalizar Protocolo?"
   Wait Until Page Contains  Deseja Finalizar Protocolo?  timeout=${TIMEOUT}
   Click Element  ${BTN_SIM}

Validar apresentação da mensagem "Protocolo Finalizado.", a "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual
   Set Focus To Element  ${PROTOCOLO_FINALIZADO}
   ${SITUACAO_PROT}  Get Text  ${SITUACAO_PROTOCOLO}
   Element Should Contain  ${SITUACAO_PROTOCOLO}  ${SITUACAO_PROT}
   ${date}  Get Current Date
   ${date}  Convert Date  ${date}  exclude_millis=yes
   ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y %H:
   Element Should Contain  ${DATA_ENCERRAMENTO}  ${data_formatada}

Selecionou no campo "Funções Permitidas" a opção "Portabilidade"
   Wait Until Page Contains  Usuários Canal do Contratante » prime1  timeout=${TIMEOUT}
   Mouse Up    ${EDIT_BUTTON}
   Set Focus To Element  ${EDIT_BUTTON}
   Click Element    ${EDIT_BUTTON}
   Page Should Contain  Funções Permitidas:

   ${c}  Run Keyword And Ignore Error   Checkbox Should Be Selected  id:_funcoes_permitidas7
   Run Keyword If  "${c[0]}" == "PASS"   Set Focus To Element  ${SAVE_FOOTER_BUTTON}
   Run Keyword If  "${c[0]}" == "PASS"   Click Element  ${SAVE_FOOTER_BUTTON}
   Run Keyword If  "${c[0]}" == "FAIL"   Click Element  id:_funcoes_permitidas7
   Run Keyword If  "${c[0]}" == "FAIL"   Click Element  ${SAVE_FOOTER_BUTTON}


    




