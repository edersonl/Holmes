*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary
Resource    ../../../main.resource
*** Variables ***
${TIMEOUT} =  30
${NOME_ARQUIVO} =  doc_fake.pdf
${NOME_ARQUIVO_PROPOSTA} =  proposta_adesao.pdf

${BOTAO_SALVAR} =  xpath://*[@id="SAVE_HEADER"]
${BOTAO_CRIAR_PESSOA_PORTABILIDADE} =  xpath://*[@id="saude_PTB_PESSOA_criar_button"]
${GRAU_DEPENDENCIA_TITULAR} =  xpath://*[@id="subPanel"]/tbody/tr/td[4]/span/span[contains(text(), '00 - Titular')]
${BOTAO_CRIAR_DOCUMENTOS} =  xpath://*[@id="saude_ptb_portabilidade_documents_criar_button"]
${BOTAO_ESCOLHER_ARQUIVOS} =  xpath://*[@id="filename_file"]
${INPUT_NOME_ARQUIVO_DOC} =  xpath://*[@id="document_name"]
${BOTAO_SALVAR_DOCUMENTO} =  xpath://*[@id="Documents_subpanel_save_button"]
${NOME_ARQUIVO} =  xpath://*[@id="subPanel"]/tbody/tr/td[3]/span/a[contains(text(), '${NOME_ARQUIVO}')]
${SETA_EDITAR} =  xpath://*[@id="detail_header_action_menu"]/li/span
${ENCAMINHAR_PARA_VALIDACAO} =  xpath://*[@id="detail_header_action_menu"]/li/ul/..//a[contains(.,'Encaminhar')]
${BOTAO_SIM_CONFIRMACAO} =  xpath://*[@id="yui-gen0-button"]
${BOTAO_VALIDAR_PESSOA} =  xpath://*[@id="saude_ptb_pessoa_saude_ptb_portabilidade_edit_1"]
${BOTAO_VALIDAR_PESSOA2} =  xpath://*[@id="saude_ptb_pessoa_saude_ptb_portabilidade_edit_2"]
${SOLICITAR_ASSINATURA_DE_PROPOSTA} =  xpath://*[@id="detail_header_action_menu"]/li/ul/..//a[contains(.,'Solicitar')]
${EMITIR_PROPOSTA_DE_ADESAO_PORTABILIDADE} =  xpath://*[@id="detail_header_action_menu"]/li/ul/..//a[contains(.,'Emitir')]
${ENCAMINHAR_PARA_ANALISE} =  xpath://*[@id="detail_header_action_menu"]/li/ul/..//a[contains(.,'Encaminhar')]
${BOTAO_ANALISAR} =  xpath://*[@id="saude_ptb_pessoa_saude_ptb_portabilidade_edit_1"]
${BOTAO_ANALISAR2} =  xpath://*[@id="saude_ptb_pessoa_saude_ptb_portabilidade_edit_2"]
${ABA_QUESTIONARIO_ELEGIBILIDADE} =  xpath://*[@id="tab2"]/em[contains(.,'Questionário Elegibilidade')]
${SIM_PERGUNTA_1} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[2]/span[1]/label
${NAO_PERGUNTA_1} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[2]/span[2]/label
${SIM_PERGUNTA_2} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[2]/span[1]
${NAO_PERGUNTA_2} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[2]/span[2]
${SIM_PERGUNTA_3} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[2]/span[1]
${NAO_PERGUNTA_3} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[2]/span[2]
${SIM_PERGUNTA_4} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[2]/span[1]
${SIM_PERGUNTA_5} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]
${SIM_PERGUNTA_6} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]
${NAO_PERGUNTA_7} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[2]
${SIM_PERGUNTA_8} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]
${SIM_PERGUNTA_9} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]
${NAO_PERGUNTA_10} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[2]
${SIM_PERGUNTA_10} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]/label
${NAO_PERGUNTA_11} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[2]
${NAO_PERGUNTA_12} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[2]
${SIM_PERGUNTA_12} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]
${SIM_PERGUNTA_13} =  xpath://*[@id="questionario_elegibilidade_span"]/div[1]/div/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[3]/div[2]/span[1]
${FINALIZAR_PROTOCOLO} =  xpath://*[@id="detail_header_action_menu"]/li/ul/li[2]/a[contains(.,'Finalizar')]
${BOTAO_SIM_FINALIZAR_PROTOCOLO} =  xpath://*[@id="yui-gen2-button"]
${PORTABILIDADE_PROTOCOLO} =  xpath://*[@id="pagecontent"]/div[1]/h2
${SITUACAO_APROVADA} =  xpath://*[@id="DEFAULT"]/tbody/tr[1]/td[contains(.,'Aprovada')]
${SITUACAO_NEGADA} =  xpath://*[@id="DEFAULT"]/tbody/tr[1]/td[contains(.,'Negada')]
${VALIDAR_EM_MASSA} =  xpath://*[@id="subPanel"]/thead/tr[1]/td/table/tbody/tr/td[1]/ul/li/a[contains(.,'Validar em Massa')]
${CHECKBOX_EM_MASSA} =  xpath://*[@id="validarmassa_select_all"]
${BOTAO_VALIDAR_EM_MASSA} =  xpath://*[@id="formValidarEmMassa"]/div/div/div[3]/button[contains(.,'Validar')]
${REALIZAR_UPLOAD_DE_PROPOSTA} =  xpath://*[@id="detail_header_action_menu"]/li/ul/li[4]/a[contains(.,'Realizar')]
${ESCOLHER_ARQUIVO_PROPOSTA} =  xpath://*[@id="proposta_adesao_file"]
${GRAVAR_UPLOAD_PROPOSTA} =  xpath://*[@id="upload_proposta_adesao"]/form/div/div/div[3]/input
${ANALISAR_EM_MASSA} =  xpath://*[@id="subPanel"]/thead/tr[1]/td/table/tbody/tr/td[1]/ul/li/a[contains(.,'Analisar em Massa')]
${CHECKBOX_ANALISAR_EM_MASSA} =  xpath://*[@id="analisarmassa_select_all"]
${BOTAO_ANALISAR_EM_MASSA} =  xpath://*[@id="formAnalisarEmMassa"]/div/div/div[3]/button[contains(.,'Analisar')]
${BOTAO_SALVAR_FOOTER} =  xpath://*[@id="SAVE_FOOTER"]
${NOME_PESSOA_PORTABILIDADE} =  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a

*** Keywords ***
Apresentar a Tela Solicitação de Portabilidade » Solicitação
    Repeat Keyword  3 times  Press Keys  None  HOME
    ${date}    Get Current Date    UTC    -3 hours 1 minute   exclude_millis=yes
    ${date1}    Get Current Date    UTC    -3 hours    exclude_millis=yes

    ${convert} =      Convert Date      ${date}      result_format=%d/%m/%Y %H:%M
    ${convert1} =      Convert Date      ${date1}      result_format=%d/%m/%Y %H:%M

    ${mensagem} =  Catenate  Solicitação de Portabilidade » Solicitação - ${convert}
    ${mensagem1} =  Catenate  Solicitação de Portabilidade » Solicitação - ${convert1}
    
    ${menos1}  Run Keyword and Ignore Error    Wait Until Page Contains  ${mensagem}     timeout=${TIMEOUT}
    ${normal}  Run Keyword If    "${menos1[0]}"=="FAIL"    Run Keyword and Ignore Error  Wait Until Page Contains  ${mensagem1}     timeout=${TIMEOUT}
    Run Keyword If    "${menos1[0]}"=="FAIL"    Wait Until Page Contains   Solicitação de Portabilidade » Solicitação    timeout=${TIMEOUT}

Clicou no botão <Criar> painel Pessoa(Portabilidade)
    ${p}  Run Keyword and Ignore Error  Set Focus To Element      ${BOTAO_CRIAR_PESSOA_PORTABILIDADE}
    Run Keyword If    "${p[0]}" == "PASS"  Sleep  3s
    Run Keyword If    "${p[0]}" == "PASS"  Execute Javascript  document.getElementById("saude_PTB_PESSOA_criar_button").click()
    ${temp}  Run Keyword If    "${p[0]}" == "PASS"  Get Current Date    exclude_millis=yes
    Run Keyword If    "${p[0]}" == "PASS"  Log  ${temp}

    ${r}  Run Keyword and Ignore Error  Wait Until Page Contains  Pessoa (Portabilidade) » Criar     timeout=${TIMEOUT}
    Run Keyword If    "${r[0]}" == "FAIL"  Run Keyword and Ignore Error  Set Focus To Element    ${BOTAO_CRIAR_PESSOA_PORTABILIDADE}
    Run Keyword If    "${r[0]}" == "FAIL"  Sleep  3s
    Run Keyword If    "${r[0]}" == "FAIL"  Execute Javascript  document.getElementById("saude_PTB_PESSOA_criar_button").click()
    ${temp}  Run Keyword If    "${r[0]}" == "FAIL"  Get Current Date    exclude_millis=yes
    Run Keyword If    "${r[0]}" == "FAIL"  Wait Until Page Contains  Pessoa (Portabilidade) » Criar     timeout=${TIMEOUT}


Apresentar a Tela Solicitação de Portabilidade » Solicitação, com pessoa cadastrada
    [Arguments]  ${arg1}
    ${date}    Get Current Date    UTC    -3 hours 1 minute   exclude_millis=yes
    ${date1}    Get Current Date    UTC    -3 hours    exclude_millis=yes

    ${convert} =      Convert Date      ${date}      result_format=%d/%m/%Y %H:%M
    ${convert1} =      Convert Date      ${date1}      result_format=%d/%m/%Y %H:%M

    ${mensagem} =  Catenate  Solicitação de Portabilidade » Solicitação - ${convert}
    ${mensagem1} =  Catenate  Solicitação de Portabilidade » Solicitação - ${convert1}
    
    ${menos1}  Run Keyword and Ignore Error    Wait Until Page Contains  ${mensagem}     timeout=${TIMEOUT}
    ${normal}  Run Keyword If    "${menos1[0]}"=="FAIL"    Run Keyword and Ignore Error    Wait Until Page Contains  ${mensagem1}     timeout=${TIMEOUT}
    Sleep  10s
    ${nometemp} =  Get Text  ${NOME_PESSOA_PORTABILIDADE}

    Set Focus To Element       xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(.,'${nometemp}')]
    Wait Until Element Is Visible     xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(.,'${nometemp}')]


Cadastrou uma Pessoa TITULAR
    Set Focus To Element          ${GRAU_DEPENDENCIA_TITULAR}
    Click Element                 ${GRAU_DEPENDENCIA_TITULAR}


Clicou no botão <Criar> Documentos
    Set Focus To Element              ${BOTAO_CRIAR_DOCUMENTOS}
    Click Element                     ${BOTAO_CRIAR_DOCUMENTOS}
    Wait Until Element Is Visible     ${BOTAO_ESCOLHER_ARQUIVOS}
    Choose File                       ${BOTAO_ESCOLHER_ARQUIVOS}    ${DOCUMENTS_FOLDER}\\${NOME_ARQUIVO}
    Sleep  3s
    Input Text  xpath://*[@id="document_name"]  doc_fake  clear= true
    Sleep  3s
    Click Element                     ${BOTAO_SALVAR_DOCUMENTO}
    Wait Until Page Contains          ${NOME_ARQUIVO}    timeout=${TIMEOUT}


Clicar no submenu "Encaminhar para Validação"
    Press Keys  None  HOME
    Sleep  10s
    Wait Until Element Is Visible    ${SETA_EDITAR}
    Set Focus To Element             ${SETA_EDITAR}
    Click Element                    ${SETA_EDITAR}
    Sleep  6s
    Click Element                    ${ENCAMINHAR_PARA_VALIDACAO}


Confirmar o encaminhamento
    Wait Until Page Contains    Deseja Encaminhar para Validação?
    Click Element               ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Portabilidade encaminhada para validação.

#    //*[@id="pagecontent"]/div[2]

Clicar no botão "Validar"
    Wait Until Element Is Visible    ${BOTAO_VALIDAR_PESSOA}
    Set Focus To Element    ${BOTAO_VALIDAR_PESSOA}
    Click Element           ${BOTAO_VALIDAR_PESSOA}
    

Clicar no botão "Validar" segundo Beneficiario
    Wait Until Element Is Visible    ${BOTAO_VALIDAR_PESSOA2}
    Set Focus To Element    ${BOTAO_VALIDAR_PESSOA2}
    Click Element    ${BOTAO_VALIDAR_PESSOA2}


Clicar no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    Wait Until Page Contains      Solicitação de Portabilidade » Solicitação
    Sleep  10s
    Wait Until Element Is Visible    ${SETA_EDITAR}
    Set Focus To Element             ${SETA_EDITAR}
    Click Element                    ${SETA_EDITAR}
    Set Focus To Element             ${SOLICITAR_ASSINATURA_DE_PROPOSTA}
    Click Element                    ${SOLICITAR_ASSINATURA_DE_PROPOSTA}


Confirmar a solicitação
    Wait Until Page Contains      Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?
    Click Element                 ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains      Situação alterada para: Assinatura da Proposta de Adesão Pendente.
    
Clicar no menu "Emitir Proposta de Adesão de Portabilidade"
    Wait Until Page Contains      Solicitação de Portabilidade » Solicitação
    Sleep  10s
    Wait Until Element Is Visible    ${SETA_EDITAR}
    Set Focus To Element             ${SETA_EDITAR}
    Click Element                    ${SETA_EDITAR}
    Set Focus To Element             ${EMITIR_PROPOSTA_DE_ADESAO_PORTABILIDADE}
    Click Element                    ${EMITIR_PROPOSTA_DE_ADESAO_PORTABILIDADE}

Voltar para a aba da "Portabilidade"
    Sleep  10s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[0]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[1]}
    #Wait Until Page Contains      Solicitação de Portabilidade » Solicitação

Clicar no menu "Encaminhar para Análise"
    Sleep  10s
    Wait Until Element Is Visible    ${SETA_EDITAR}
    Set Focus To Element             ${SETA_EDITAR}
    Click Element                    ${SETA_EDITAR}
    Click Element                    ${ENCAMINHAR_PARA_ANALISE}


Confirmar a validação do documento
    Wait Until Page Contains    Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado.
    Click Element               ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains    Portabilidade encaminhada para análise.

Clicar no botão "Analisar"
    Wait Until Element Is Visible    ${BOTAO_ANALISAR}
    Set Focus To Element             ${BOTAO_ANALISAR}
    Click Element                    ${BOTAO_ANALISAR}

Clicar no botão "Analisar" segundo beneficiario
    Wait Until Element Is Visible    ${BOTAO_ANALISAR2}
    Set Focus To Element             ${BOTAO_ANALISAR2}
    Click Element                    ${BOTAO_ANALISAR2}

Clicar na aba "Questionário Elegibilidade"
    Wait Until Element Is Visible    ${ABA_QUESTIONARIO_ELEGIBILIDADE}
    Set Focus To Element             ${ABA_QUESTIONARIO_ELEGIBILIDADE}
    Click Element                    ${ABA_QUESTIONARIO_ELEGIBILIDADE}

Preencher o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
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
    Click Element      ${NAO_PERGUNTA_12}
    Wait Until Page Contains    13) Para o exercício desta portabilidade, será necessária a assinatura de novo contrato individual/familiar?
    Click Element      ${SIM_PERGUNTA_13}

    Wait Until Page Contains         APTO(A) AO EXERCÍCIO DA PORTABILIDADE


Usuário clicar no menu Finalizar Protocolo
    Sleep  10s
    Wait Until Element Is Visible    ${SETA_EDITAR}
    Set Focus To Element             ${SETA_EDITAR}
    Click Element                    ${SETA_EDITAR}
    Set Focus To Element             ${FINALIZAR_PROTOCOLO}
    Click Element                    ${FINALIZAR_PROTOCOLO}

Clicar Confirmar a finalização
    Wait Until Page Contains         Deseja Finalizar Protocolo?
    Set Focus To Element             ${BOTAO_SIM_CONFIRMACAO}
    Click Element                    ${BOTAO_SIM_CONFIRMACAO}
    Wait Until Page Contains         Protocolo Finalizado.

O CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA
    ${protocolo}    Get Text         ${PORTABILIDADE_PROTOCOLO}
    Wait Until Page Contains         ${protocolo}
    Wait Until Element Is Visible    ${SITUACAO_APROVADA}

O CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a NEGADA
    ${protocolo}    Get Text         ${PORTABILIDADE_PROTOCOLO}
    Wait Until Page Contains         ${protocolo}
    Wait Until Element Is Visible    ${SITUACAO_NEGADA}

Clicar no botão "Validar em Massa"
    Set Focus To Element             ${VALIDAR_EM_MASSA}
    Click Element                    ${VALIDAR_EM_MASSA}

Selecinar as pessoas e clicou no botão "Validar"
    Wait Until Page Contains         Selecione as Pessoas da Portabilidade para Validar.   timeout=${TIMEOUT}
    Sleep  10s
    Click Element                    ${CHECKBOX_EM_MASSA}
    Click Element                    ${BOTAO_VALIDAR_EM_MASSA}

Clicar no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    Sleep  10s
    Wait Until Element Is Visible    ${SETA_EDITAR}
    Set Focus To Element             ${SETA_EDITAR}
    Click Element                    ${SETA_EDITAR}
    Set Focus To Element             ${REALIZAR_UPLOAD_DE_PROPOSTA}
    Click Element                    ${REALIZAR_UPLOAD_DE_PROPOSTA}

Anexar e gravar o upload
    Wait Until Page Contains          Realizar Upload da Proposta de Adesão de Portabilidade Assinada
    Wait Until Element Is Visible     ${ESCOLHER_ARQUIVO_PROPOSTA}
    Choose File                       ${ESCOLHER_ARQUIVO_PROPOSTA}    ${DOCUMENTS_FOLDER}\\${NOME_ARQUIVO_PROPOSTA}
    Click Element                     ${GRAVAR_UPLOAD_PROPOSTA}
    Sleep  10s
    Wait Until Page Contains          Arquivo gravado com sucesso.
    Wait Until Page Contains          ${NOME_ARQUIVO_PROPOSTA}    timeout=${TIMEOUT}

Clicar no botão "Analisar em Massa"
    Sleep  10s
    Wait Until Element Is Visible    ${ANALISAR_EM_MASSA}
    Set Focus To Element             ${ANALISAR_EM_MASSA}
    Click Element                    ${ANALISAR_EM_MASSA}

Selecionar as pessoas e clicou no botão "Analisar"
    Sleep  5s
    Wait Until Page Contains         Selecione as Pessoas da Portabilidade para Analisar.
    Sleep  10s
    Click Element                    ${CHECKBOX_ANALISAR_EM_MASSA}
    Click Element                    ${BOTAO_ANALISAR_EM_MASSA}

Preencher o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
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


Preencher o formulario com as opções NÃO, NÃO, NÃO
    Wait Until Page Contains    1) Trata-se de portabilidade especial ou extraordinária?
    Click Element      ${NAO_PERGUNTA_1}
    Wait Until Page Contains    2) O beneficiário está ativo na operadora de origem?
    Click Element      ${NAO_PERGUNTA_2}
    Wait Until Page Contains    3) O beneficiário está com vínculo extinto no plano de origem, em virtude de (1) falecimento do titular
    Click Element      ${NAO_PERGUNTA_3}

    Wait Until Page Contains         INAPTO(A) AO EXERCÍCIO DA PORTABILIDADE

Clicar botão "Salvar"
    Sleep  5s
    Set Focus To Element  ${BOTAO_SALVAR_FOOTER}
    Sleep  10s
    Click Element  ${BOTAO_SALVAR_FOOTER}


O CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade
    Wait Until Page Contains         Solicitação de Portabilidade
    ${protocolo}    Get Text         ${PORTABILIDADE_PROTOCOLO}
    Wait Until Page Contains         ${protocolo}


Clicar no link "Nome Oportunidade" na tela Solicitação de Portabilidade
    [Arguments]  ${arg1}
    ${e}  Run Keyword And Ignore Error  Click Element  xpath://*[@id="opportunity_id_c"]/../span[contains(.,'${arg1}')]
    Run Keyword If  "${e[0]}" == "FAIL"  Click Element  xpath://*[@id="opportunity_id"]/../span[contains(.,'${arg1}')]
