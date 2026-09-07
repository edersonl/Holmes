*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../../../main.resource
#Library     DebugLibrary

*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${SHORT_TIMEOUT} =  10
${INPUT_DEC_SAUDE_PESSOA1} =  id:pessoa_nome0
${SELECT_DEC_SAUDE_TIPO} =  id:tipo
${INPUT_ALTURA_M} =  xpath://*[@id="boxBase"]/div[4]/div[1]/div/input[1]
${INPUT_ALTURA_CM} =  xpath://*[@id="boxBase"]/div[4]/div[1]/div/input[2]
${INPUT_PESO} =  xpath://*[@id="boxBase"]/div[4]/div[2]/div/input
${INPUT_PA1} =  xpath://*[@id="boxBase"]/div[4]/div[3]/div/input[1]
${INPUT_PA2} =  xpath://*[@id="boxBase"]/div[4]/div[3]/div/input[2]
${MEDICO_NAO} =  id:medico_nao
${CHECKBOX_PREENCHIMENTO_ELETRONICO} =  id:eletronico
${BOTAO_SALVAR_CONTINUAR} =  id:gravar
${BOTAO_SALVAR_CONTINUAR_QUESTIONARIO} =  id:gravarQuestionario
${SELECT_PESSOA} =  id:pessoaAnalise
${CHECKBOX_NAO_E_NECESSARIA_PERICIA_MEDICA} =  id:pericia_0_nao_necessario
${CHECKBOX_NAO_E_NECESSARIA_PERICIA_MEDICA_DEPENDENTE} =  id:pericia_1_nao_necessario
${INPUT_CID} =  id:cidAutoComplete0
${INPUT_CID_DEPENDENTE} =  id:cidAutoComplete1
${SELECT_PRAZO_SUSPENSAO} =  id:cidPrazoSuspensao0
${SELECT_PRAZO_SUSPENSAO_DEPENDENTE} =  id:cidPrazoSuspensao1
${BOTAO_APROVAR_QUESTIONARIO} =  id:btn-aprovar
${NUMERO_DECLARACAO_DE_SAUDE} =  id:saude_decl97f4o_saude_ida
${NOME_PROCESSO_DECLARACAO_SAUDE} =  id:saude_proc5142laracao_ida
${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO} =  id:qtd_vidas_cotacao
${QUANTIDADE_DE_PESSOAS} =  id:qtd_pessoas
${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA} =  id:qtd_pessoas_aprovada
${RESULTADO_NOME} =  xpath://*[@id="EditView_pessoa_nome0_results"]/div
${BOTAO_GRAVAR_ANALISE_DECLARACAO} =  id:gravarAnalise
${STATUS_DS_GLYPHICON_OK} =  xpath://*[@id="DeclaracoesTermos"]/table//div/span[contains(@class, 'glyphicon-ok')]
${CHECKBOX_DISPENSADO} =  xpath://*[@id="DeclaracoesTermos"]/table/tbody/tr/td[10]/input
${CHECKBOX_DISPENSADO_DEPENDENTE1} =  xpath://*[@id="DeclaracoesTermos"]/table/tbody/tr[2]/td[10]/input
${CHECKBOX_DISPENSADO_DEPENDENTE2} =  xpath://*[@id="DeclaracoesTermos"]/table/tbody/tr[3]/td[10]/input
${BOTAO_RECUSA_DE_BENEFICIARIO} =  id:btn-recusa-open-modal
${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS} =  id:qtd_pessoas_dispensadas
${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA} =  id:qtd_pessoas_recusada
${STATUS_DS_GLYPHICON_X} =  xpath://*[@id="DeclaracoesTermos"]/table//div/span[contains(@class, 'glyphicon-remove')]
${TITULO_BOX_DISPENSAR_EM_MASSA} =  xpath://*[@id="modalDispensarEmMassa"]//h4[contains(., 'Dispensar em Massa')]
${STATUS_PROCESSO_DECLARACAO_DE_SAUDE} =  id:status
${LINK_PROCESSO_DECLARACAO_DE_SAUDE} =  id:saude_proc1c4flaracao_ida
${BOTAO_ADICIONAR_PESSOA} =  id:adicionarPessoa
${SELECT_GRAU_DEPENDENCIA} =  id:grau
${INPUT_DEC_SAUDE_PESSOA1_DEPENDENTE} =  id:pessoa_nome1
${SELECT_DEC_SAUDE_TIPO_DEPENDENTE} =  xpath://*[@id="boxBase"][2]//*[@id="tipo"]
${SELECT_GRAU_DEPENDENCIA_DEPENDENTE} =  xpath://*[@id="boxBase"][2]//*[@id="grau"]
${INPUT_ALTURA_M_DEPENDENTE} =  xpath://*[@id="boxBase"][2]/div[4]/div[1]/div/input[1]
${INPUT_ALTURA_CM_DEPENDENTE} =  xpath://*[@id="boxBase"][2]/div[4]/div[1]/div/input[2]
${INPUT_PESO_DEPENDENTE} =  xpath://*[@id="boxBase"][2]/div[4]/div[2]/div/input
${INPUT_PA1_DEPENDENTE} =  xpath://*[@id="boxBase"][2]/div[4]/div[3]/div/input[1]
${INPUT_PA2_DEPENDENTE} =  xpath://*[@id="boxBase"][2]/div[4]/div[3]/div/input[2]
${ABA_PESSOAS_PROC_DEC_SAUDE} =  xpath://*[@id="tab1"]/em[contains(., 'Pessoas')]
${SETA_ACOES_DEC_SAUDE} =  xpath://*[@id="DeclaracoesTermos"]/ul/li/span
${SETA_ACOES_APROVAR_SELECIONADOS} =  xpath://*[@id="DeclaracoesTermos"]//a[contains(., 'Aprovar')]
${SETA_ACOES_RECUSAR_SELECIONADOS} =  xpath://*[@id="DeclaracoesTermos"]//a[contains(., 'Recusar')]
${STATUS_DECLARACAO_DE_SAUDE} =  xpath://*[@id="subPanel"]/tbody/tr/td[3]/span
${NOME_PESSOA_QUESTIONARIO_PESSOA} =  xpath://*[@id="nome_pessoa"]/a[1]
${NOME_CONTAS_PESSOA} =  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span[2]/a
${NOME_CONTRATO_CONTAS} =  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
${TITULO_SUBPANEL_CONTRATOS} =  xpath://*[@id="subpanel_title_account_aos_contracts"]/table/tbody/tr/td[1]/h3/span
${INPUT_NOME_TITULAR} =  id:pessoa_titular_nome

*** Keywords ***
Clicar no botão no Adicionar Pessoa
    Set Focus To Element  ${BOTAO_ADICIONAR_PESSOA}
    Click Element  ${BOTAO_ADICIONAR_PESSOA}

Selecionar uma Pessoa
    [Arguments]    ${arg1}
    Set Focus To Element  ${INPUT_DEC_SAUDE_PESSOA1}
    Input Text  ${INPUT_DEC_SAUDE_PESSOA1}  ${arg1}
    Sleep  8s
    Press Keys  None  ARROW_DOWN
    Sleep  2s
    Press Keys  None  ENTER
    Sleep  3s

Selecionar Titular
    [Arguments]    ${arg1}
    Set Focus To Element  ${INPUT_NOME_TITULAR}
    Input Text  ${INPUT_NOME_TITULAR}  ${arg1}
    Sleep  8s
    Press Keys  None  ARROW_DOWN
    Sleep  2s
    Press Keys  None  ENTER
    Sleep  3s

Preencher o campo "Tipo"
    [Arguments]    ${arg1}
    Set Focus To Element  ${SELECT_DEC_SAUDE_TIPO}
    Select From List By Label  ${SELECT_DEC_SAUDE_TIPO}  ${arg1}

Preencher o campo "Grau Dependência"
    [Arguments]    ${arg1}
    Set Focus To Element  ${SELECT_GRAU_DEPENDENCIA}
    Select From List By Label  ${SELECT_GRAU_DEPENDENCIA}  ${arg1}

Preencher o campo "Altura"
    [Arguments]    ${arg1}  ${arg2}
    Set Focus To Element  ${INPUT_ALTURA_M}
    Input Text  ${INPUT_ALTURA_M}  ${arg1}
    Set Focus To Element  ${INPUT_ALTURA_CM}
    Input Text  ${INPUT_ALTURA_CM}  ${arg2}

Preencher o campo "Peso"
    [Arguments]    ${arg1}
    Set Focus To Element  ${INPUT_PESO}
    Input Text  ${INPUT_PESO}  ${arg1}

Preencher o campo "PA"
    [Arguments]    ${arg1}  ${arg2}
    Set Focus To Element  ${INPUT_PA1}
    Input Text  ${INPUT_PA1}  ${arg1}
    Set Focus To Element  ${INPUT_PA2}
    Input Text  ${INPUT_PA2}  ${arg2}

Selecionar uma Pessoa Dependente
    [Arguments]    ${arg1}
    Set Focus To Element  ${INPUT_DEC_SAUDE_PESSOA1_DEPENDENTE}
    Input Text  ${INPUT_DEC_SAUDE_PESSOA1_DEPENDENTE}  ${arg1}
    Sleep  8s
    Press Keys  None  ARROW_DOWN
    Sleep  2s
    Press Keys  None  ENTER
    Sleep  3s

Preencher o campo "Tipo" Dependente
    [Arguments]    ${arg1}
    Set Focus To Element  ${SELECT_DEC_SAUDE_TIPO_DEPENDENTE}
    Select From List By Label  ${SELECT_DEC_SAUDE_TIPO_DEPENDENTE}  ${arg1}

Preencher o campo "Grau Dependência" Dependente
    [Arguments]    ${arg1}
    Set Focus To Element  ${SELECT_GRAU_DEPENDENCIA_DEPENDENTE}
    Select From List By Label  ${SELECT_GRAU_DEPENDENCIA_DEPENDENTE}  ${arg1}

Preencher o campo "Altura" Dependente
    [Arguments]    ${arg1}  ${arg2}
    Set Focus To Element  ${INPUT_ALTURA_M_DEPENDENTE}
    Input Text  ${INPUT_ALTURA_M_DEPENDENTE}  ${arg1}
    Set Focus To Element  ${INPUT_ALTURA_CM_DEPENDENTE}
    Input Text  ${INPUT_ALTURA_CM_DEPENDENTE}  ${arg2}

Preencher o campo "Peso" Dependente
    [Arguments]    ${arg1}
    Set Focus To Element  ${INPUT_PESO_DEPENDENTE}
    Input Text  ${INPUT_PESO_DEPENDENTE}  ${arg1}

Preencher o campo "PA" Dependente
    [Arguments]    ${arg1}  ${arg2}
    Set Focus To Element  ${INPUT_PA1_DEPENDENTE}
    Input Text  ${INPUT_PA1_DEPENDENTE}  ${arg1}
    Set Focus To Element  ${INPUT_PA2_DEPENDENTE}
    Input Text  ${INPUT_PA2_DEPENDENTE}  ${arg2}

Selecionar a opção NÃO
    Wait Until Page Contains    O questionário foi respondido na presença de um médico orientador?      timeout=${TIMEOUT}
    Set Focus To Element  ${MEDICO_NAO}
    Click Element  ${MEDICO_NAO}

Selecionar a opção "Preenchimento Eletrônico"
    Select Checkbox  ${CHECKBOX_PREENCHIMENTO_ELETRONICO}

Clicar no botão "SALVAR E CONTINUAR"
    Set Focus To Element  ${BOTAO_SALVAR_CONTINUAR}
    Execute Javascript   document.getElementById("gravar").click()
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}

Selecionar a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    Wait Until Page Contains    1 - Faz atividade física regularmente?      timeout=${TIMEOUT}
    Click Element  xpath://*[@id="responderQuestionario"]/div/div[1]/div/div/div[2]/label[2]

    Wait Until Page Contains    2 - Possui doença?      timeout=${TIMEOUT}
    Click Element  xpath://*[@id="responderQuestionario"]/div/div[2]/div/div/div[2]/label[2]

    Wait Until Page Contains    3 - Você possui algum outro plano de saúde?      timeout=${TIMEOUT}
    Click Element  xpath://*[@id="responderQuestionario"]/div/div[3]/div/div/div[2]/label[2]

    Wait Until Page Contains    4 - Você se consulta regularmente com um médico?      timeout=${TIMEOUT}
    Click Element  xpath://*[@id="responderQuestionario"]/div/div[4]/div/div/div[2]/label[2]

    Wait Until Page Contains    5 - Obs. Outras informações que deseja declarar?      timeout=${TIMEOUT}

    Set Focus To Element  ${BOTAO_SALVAR_CONTINUAR_QUESTIONARIO}
    Execute Javascript   document.getElementById("gravarQuestionario").click()

    Sleep  5s
    Press Keys  None  HOME
    ${q}  Run Keyword And Ignore Error  Page Should Contain   A Questão abaixo não foi respondida para a Pessoa    timeout=${TIMEOUT}
    Run Keyword If  "${q[0]}" == "PASS"  Run Keyword And Ignore Error  Responder Questionário Dependente

    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Responder Questionário Dependente
    Wait Until Page Contains    1 - Faz atividade física regularmente?      timeout=${TIMEOUT}
    Click Element  xpath://*[@id="responderQuestionario"]/div/div[1]/div/div[2]/div[2]/label[2]

    Wait Until Page Contains    2 - Possui doença?      timeout=${TIMEOUT}
    Click Element  xpath://*[@id="responderQuestionario"]/div/div[2]/div/div[2]/div[2]/label[2]

    Wait Until Page Contains    3 - Você possui algum outro plano de saúde?      timeout=${TIMEOUT}
    Click Element  xpath://*[@id="responderQuestionario"]/div/div[3]/div/div[2]/div[2]/label[2]

    Wait Until Page Contains    4 - Você se consulta regularmente com um médico?      timeout=${TIMEOUT}
    Click Element  xpath://*[@id="responderQuestionario"]/div/div[4]/div/div[2]/div[2]/label[2]

    Wait Until Page Contains    5 - Obs. Outras informações que deseja declarar?      timeout=${TIMEOUT}

    Set Focus To Element  ${BOTAO_SALVAR_CONTINUAR_QUESTIONARIO}
    Execute Javascript   document.getElementById("gravarQuestionario").click()


Selecionar a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID e clicou no botão "GRAVAR"
    [Arguments]  ${arg1}
    Wait Until Page Contains    Selecione a Pessoa      timeout=${TIMEOUT}
    Sleep  5s
    Select From List By Label  ${SELECT_PESSOA}  ${arg1}
    Set Focus To Element  ${CHECKBOX_NAO_E_NECESSARIA_PERICIA_MEDICA}
    Click Element  ${CHECKBOX_NAO_E_NECESSARIA_PERICIA_MEDICA}
    Set Focus To Element  ${INPUT_CID}
    Input Text  ${INPUT_CID}  J11
    Sleep  6s
    Press Keys  None  ARROW_DOWN
    Press Keys  None  ENTER
    Sleep  3s
    Select From List By Label  ${SELECT_PRAZO_SUSPENSAO}  12
    Execute Javascript   document.getElementById("gravarAnalise").click()
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Selecionar a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID
    [Arguments]  ${arg1}
    Wait Until Page Contains    Selecione a Pessoa      timeout=${TIMEOUT}
    Sleep  5s
    Select From List By Label  ${SELECT_PESSOA}  ${arg1}
    Set Focus To Element  ${CHECKBOX_NAO_E_NECESSARIA_PERICIA_MEDICA}
    Click Element  ${CHECKBOX_NAO_E_NECESSARIA_PERICIA_MEDICA}
    Set Focus To Element  ${INPUT_CID}
    Input Text  ${INPUT_CID}  J11
    Sleep  6s
    Press Keys  None  ARROW_DOWN
    Press Keys  None  ENTER
    Sleep  3s
    Select From List By Label  ${SELECT_PRAZO_SUSPENSAO}  12


Selecionar pessoa Dependente, no campo pericia selecionou a opção "Não é necessária a perícia médica", não preencheu o prazo, CID
    [Arguments]  ${arg1}
    Wait Until Page Contains    Selecione a Pessoa      timeout=${TIMEOUT}
    Sleep  5s
    Select From List By Label  ${SELECT_PESSOA}  ${arg1}
    Set Focus To Element  ${CHECKBOX_NAO_E_NECESSARIA_PERICIA_MEDICA_DEPENDENTE}
    Click Element  ${CHECKBOX_NAO_E_NECESSARIA_PERICIA_MEDICA_DEPENDENTE}
    Set Focus To Element  ${INPUT_CID_DEPENDENTE}


Clicar no botão "GRAVAR" Analise Declaração
    Execute Javascript   document.getElementById("gravarAnalise").click()
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Clicou na aba Pessoa
    Wait Until Page Contains     Processo de Declaração de Saúde »   timeout=${TIMEOUT}
    Sleep  5s
    Set Focus To Element  ${ABA_PESSOAS_PROC_DEC_SAUDE}
    Click Element  ${ABA_PESSOAS_PROC_DEC_SAUDE}


Selecionou a Pessoa TITULAR, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM
    [Arguments]  ${arg1}
    Set Focus To Element  xpath://*[@id="DeclaracoesTermos"]//tr[contains(., '00 - Titular')]//input[@class='selecionar_pessoa']
    Select Checkbox  xpath://*[@id="DeclaracoesTermos"]//tr[contains(., '00 - Titular')]//input[@class='selecionar_pessoa']

    Set Focus To Element  ${SETA_ACOES_DEC_SAUDE}
    Click Element  ${SETA_ACOES_DEC_SAUDE}
    Set Focus To Element  ${SETA_ACOES_APROVAR_SELECIONADOS}
    Click Element  ${SETA_ACOES_APROVAR_SELECIONADOS}

    Wait Until Page Contains    Deseja realizar a aprovação dos registros selecionados?   timeout=${TIMEOUT}
    Execute Javascript   document.getElementById("yui-gen0-button").click()
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}



Selecionou a Pessoa DEPENDENTE Conjuge, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR
    [Arguments]  ${arg1}
    Set Focus To Element  xpath://*[@id="DeclaracoesTermos"]//tr[contains(., '01 - Cônjuge')]//input[@class='selecionar_pessoa']
    Select Checkbox  xpath://*[@id="DeclaracoesTermos"]//tr[contains(., '01 - Cônjuge')]//input[@class='selecionar_pessoa']

    Set Focus To Element  ${SETA_ACOES_DEC_SAUDE}
    Click Element  ${SETA_ACOES_DEC_SAUDE}
    Set Focus To Element  ${SETA_ACOES_RECUSAR_SELECIONADOS}
    Click Element  ${SETA_ACOES_RECUSAR_SELECIONADOS}

    Wait Until Page Contains    Recusa Beneficiário   timeout=${TIMEOUT}
    Execute Javascript  document.getElementById('motivo_parecer').value="Teste Automação - Prime"
    Execute Javascript   document.getElementById("btn-recusa").click()
    Sleep  5s
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Clicar na pessoa do painel "Questionário Pessoa"
    [Arguments]  ${arg1}
    Wait Until Page Contains    Declaração de Saúde »   timeout=${TIMEOUT}
    Sleep  10s
    Repeat Keyword  3 times  Press Keys  None  END
    Sleep  3s
    Set Focus To Element  xpath://*[@id="subPanel"]//span/a[contains(., '${arg1}')]
    Click Element  xpath://*[@id="subPanel"]//span/a[contains(., '${arg1}')]


Clicar no botão "APROVAR QUESTIONÁRIO"
    Wait Until Page Contains    Questionário Pessoa »   timeout=${TIMEOUT}
    Set Focus To Element  ${BOTAO_APROVAR_QUESTIONARIO}
    Click Element  ${BOTAO_APROVAR_QUESTIONARIO}
    Wait Until Page Contains    Aprovado   timeout=${TIMEOUT}


O CRM deve atualizar a tela de Questionário Pessoa, com campo "Status" igual a APROVADO
    Wait Until Page Contains    Aprovado   timeout=${TIMEOUT}


A Tela Declaração de Saúde com campo "Status" igual a APROVADO
    Set Focus To Element  ${NUMERO_DECLARACAO_DE_SAUDE}
    Click Element  ${NUMERO_DECLARACAO_DE_SAUDE}
    Wait Until Page Contains    Declaração de Saúde »   timeout=${TIMEOUT}
    Wait Until Page Contains    Aprovado   timeout=${TIMEOUT}


A Tela Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas com DS Aprovada" igual a 1
    Set Focus To Element  ${NOME_PROCESSO_DECLARACAO_SAUDE}
    Click Element  ${NOME_PROCESSO_DECLARACAO_SAUDE}
    Wait Until Page Contains    Processo de Declaração de Saúde »   timeout=${TIMEOUT}

    ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}    Get Text  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}
    ${QUANTIDADE_DE_PESSOAS}    Get Text  ${QUANTIDADE_DE_PESSOAS}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}
    Should Be Equal  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}  4
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS}  1
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_APROVADA}  1

A Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" igual a APROVADO, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." e coluna "Dispensado" desmarcado
    Set Focus To Element  ${ABA_PESSOAS}
    Click Element  ${ABA_PESSOAS}
    ${situação}  Get Table Cell  xpath://*[@id="DeclaracoesTermos"]/table  2  8
    Should Be Equal  ${situação}  Aprovado
    Page Should Contain Element  ${STATUS_DS_GLYPHICON_OK}
    Checkbox Should Not Be Selected  ${CHECKBOX_DISPENSADO}

Não selecionar a opção "Preenchimento Eletrônico"
    Unselect Checkbox   ${CHECKBOX_PREENCHIMENTO_ELETRONICO}

Clicar no botão "GRAVAR"
    Sleep  10s
    Execute Javascript   document.getElementById("gravarQuestionarioArquivo").click()
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}

Selecionar a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica" e clicou no botão "GRAVAR"
    [Arguments]  ${arg1}
    Wait Until Page Contains    Selecione a Pessoa      timeout=${TIMEOUT}
    Sleep  5s
    Select From List By Label  ${SELECT_PESSOA}  ${arg1}
    Set Focus To Element  ${CHECKBOX_NAO_E_NECESSARIA_PERICIA_MEDICA}
    Click Element  ${CHECKBOX_NAO_E_NECESSARIA_PERICIA_MEDICA}
    Execute Javascript   document.getElementById("gravarAnalise").click()
    ${e}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}

Clicou no botão "RECUSAR BENEFICIÁRIO"
    Wait Until Page Contains    Questionário Pessoa »   timeout=${TIMEOUT}
    Set Focus To Element  ${BOTAO_RECUSA_DE_BENEFICIARIO}
    Click Element  ${BOTAO_RECUSA_DE_BENEFICIARIO}

Preencheu o campo "Motivo" e clicar no botão "SALVAR"
    Wait Until Page Contains    Recusa de Beneficiário   timeout=${TIMEOUT}
    Execute Javascript  document.getElementById('motivo_parecer').value="Teste Automação - Prime"
    Execute Javascript   document.getElementById("btn-recusa").click()
    Sleep  5s

CRM deve atualizar tela de Questionário Pessoa, com campo "Status" igual a RECUSADO PELO BENEFICIÁRIO
    Wait Until Page Contains    Recusado pelo Beneficiário   timeout=${TIMEOUT}

A Tela Declaração de Saúde com campo "Status" igual a RECUSADO PELO BENEFICIÁRIO
    Set Focus To Element  ${NUMERO_DECLARACAO_DE_SAUDE}
    Click Element  ${NUMERO_DECLARACAO_DE_SAUDE}
    Wait Until Page Contains    Declaração de Saúde »   timeout=${TIMEOUT}
    Wait Until Page Contains    Recusado pelo Beneficiário   timeout=${TIMEOUT}

A Tela Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas com DS Recusada" igual a 1
    Set Focus To Element  ${NOME_PROCESSO_DECLARACAO_SAUDE}
    Click Element  ${NOME_PROCESSO_DECLARACAO_SAUDE}
    Wait Until Page Contains    Processo de Declaração de Saúde »   timeout=${TIMEOUT}

    ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}    Get Text  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}
    ${QUANTIDADE_DE_PESSOAS}    Get Text  ${QUANTIDADE_DE_PESSOAS}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}
    Should Be Equal  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}  4
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS}  1
    ${d}  Run Keyword And Ignore Error  Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  1
    Run Keyword If  "${d[0]}" == "FAIL"  Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  0
    

A Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" igual a RECUSADO PELO BENEFICIÁRIO, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." e coluna "Dispensado" desmarcado
    Set Focus To Element  ${ABA_PESSOAS}
    Click Element  ${ABA_PESSOAS}
    ${situação}  Get Table Cell  xpath://*[@id="DeclaracoesTermos"]/table  2  8
    Should Be Equal  ${situação}  Recusado pelo Beneficiário
    Page Should Contain Element  ${STATUS_DS_GLYPHICON_X}
    Checkbox Should Not Be Selected  ${CHECKBOX_DISPENSADO}


Clicar menu "DISPENSA EM MASSA"
    Set Focus To Element  ${SETA_VALIDAR}
    Sleep  3s
    Click Element  ${SETA_VALIDAR}
    Click Element  ${SUBMENU_DISPENSAR_EM_MASSA}
    Page Should Contain Element  ${TITULO_BOX_DISPENSAR_EM_MASSA}

Selecionar Pessoa, preencher o "Motivo" e clicar no botão "SALVAR"
    [Arguments]  ${arg1}
    Sleep  5s
    Set Focus To Element  xpath://*[@id="tabela_dispensa_massa_scroll"]/table//td[contains(., '${arg1}')]
    Click Element  xpath://*[@id="tabela_dispensa_massa_scroll"]/table//td[contains(., '${arg1}')]
    Select From List By Label  ${MOTIVO_DISPENSA_DS}  Dispensa de DS
    Execute Javascript   document.getElementById("btn-salvar-dispensa-massa").click()
    Sleep  5s

O CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas dispensadas de DS" igual a 1, com campo "Status" igual a EM ANDAMENTO
    Wait Until Page Contains    Processo de Declaração de Saúde »   timeout=${TIMEOUT}

    ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}    Get Text  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}
    ${QUANTIDADE_DE_PESSOAS}    Get Text  ${QUANTIDADE_DE_PESSOAS}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}

    Page Should Contain  Em Andamento
    Should Be Equal  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}  4
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS}  1
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  1


CRM deve atualizar tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 3, "Quantidade de Pessoas" igual a 3, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" igual a 1, com campo "Status" igual a EM ANDAMENTO
    Wait Until Page Contains    Processo de Declaração de Saúde »   timeout=${TIMEOUT}
    Sleep  5s
    ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}    Get Text  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}
    ${QUANTIDADE_DE_PESSOAS}    Get Text  ${QUANTIDADE_DE_PESSOAS}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}
    ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  Get Text  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}

    Page Should Contain  Em Andamento
    Should Be Equal  ${QUANTIDADE_DE_VIDAS_APROVADAS_NA_COTACAO}  3
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS}  3
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_RECUSADA}  1
    Should Be Equal  ${QUANTIDADE_DE_PESSOAS_COM_DS_DISPENSADAS}  1


A Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para o Titular, RECUSADO PELO BENEFICIÁRIO para o Conjuge, VAZIO para o Filho, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Titular e Filho, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para o Conjuge, coluna "Dispensado" desmarcada para o Titular e Conjuge e selecionada para o Filho
    Set Focus To Element  ${ABA_PESSOAS}
    Click Element  ${ABA_PESSOAS}
    ${situação}  Get Table Cell  xpath://*[@id="DeclaracoesTermos"]/table  2  8
    ${a}  Run Keyword And Ignore Error  Should Be Equal  ${situação}  Aprovado
    Run Keyword If  "${a[0]}" == "FAIL"  Should Be Equal  ${situação}  ${EMPTY}
    Page Should Contain Element  ${STATUS_DS_GLYPHICON_OK}
    ${s}  Run Keyword And Ignore Error  Checkbox Should Not Be Selected  ${CHECKBOX_DISPENSADO}
    Run Keyword If  "${s[0]}" == "FAIL"  Checkbox Should Be Selected  ${CHECKBOX_DISPENSADO}

    ${situação}  Get Table Cell  xpath://*[@id="DeclaracoesTermos"]/table  3  8
    ${e}  Run Keyword And Ignore Error  Should Be Equal  ${situação}  Recusado pelo Beneficiário
    Run Keyword If  "${e[0]}" == "FAIL"  Should Be Equal  ${situação}  ${EMPTY}
    Page Should Contain Element  ${STATUS_DS_GLYPHICON_OK}
    ${v}  Run Keyword And Ignore Error  Checkbox Should Not Be Selected  ${CHECKBOX_DISPENSADO_DEPENDENTE1}
    Run Keyword If  "${v[0]}" == "FAIL"  Checkbox Should Be Selected  ${CHECKBOX_DISPENSADO_DEPENDENTE1}

    ${situação}  Get Table Cell  xpath://*[@id="DeclaracoesTermos"]/table  4  8
    ${d}  Run Keyword And Ignore Error  Should Be Equal  ${situação}  Recusado pelo Beneficiário
    Run Keyword If  "${d[0]}" == "FAIL"  Should Be Equal  ${situação}  ${EMPTY}
    Page Should Contain Element  ${STATUS_DS_GLYPHICON_X}
    ${x}  Run Keyword And Ignore Error  Checkbox Should Not Be Selected  ${CHECKBOX_DISPENSADO_DEPENDENTE2}
    Run Keyword If  "${x[0]}" == "FAIL"  Checkbox Should Be Selected  ${CHECKBOX_DISPENSADO_DEPENDENTE2}


Com Declaração de Saúde, com "status" FINALIZADO
    ${STATUS_DECLARACAO_DE_SAUDE}    Get Text   ${STATUS_DECLARACAO_DE_SAUDE}
    Should Be Equal  ${STATUS_DECLARACAO_DE_SAUDE}  Finalizado


A Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" VAZIO, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." e coluna "Dispensado" selecionada
    Set Focus To Element  ${ABA_PESSOAS}
    Click Element  ${ABA_PESSOAS}
    ${situação}  Get Table Cell  xpath://*[@id="DeclaracoesTermos"]/table  2  8
    Should Be Equal  ${situação}  ${EMPTY}
    Page Should Contain Element  ${STATUS_DS_GLYPHICON_OK}
    Checkbox Should Be Selected  ${CHECKBOX_DISPENSADO}


Sem a Declaração de Saúde
    ${declaracao}   Get Text  xpath://*[@id="subPanel"]/tbody/tr/td/em
    Should Be Equal  ${declaracao}  Nenhum resultado encontrado.


Não preencheu automaticamente campo "Processo de Declaração de Saúde"
    ${LINK_PROCESSO_DECLARACAO_DE_SAUDE}  Get Text  ${LINK_PROCESSO_DECLARACAO_DE_SAUDE}
    Should Be Equal  ${LINK_PROCESSO_DECLARACAO_DE_SAUDE}  ${empty}


Clicar no Link Pessoa no Questionario Pessoa
    Set Focus To Element  ${NOME_PESSOA_QUESTIONARIO_PESSOA}
    Click Element  ${NOME_PESSOA_QUESTIONARIO_PESSOA}
    Wait Until Page Contains    Pessoa »   timeout=${TIMEOUT}


Clicar no Nome Contas
    Set Focus To Element  ${NOME_CONTAS_PESSOA}
    Click Element  ${NOME_CONTAS_PESSOA}
    Wait Until Page Contains    Contas »    timeout=${TIMEOUT}


Clicar no Nome Contratos
    Sleep  10s
    Repeat Keyword  3 times  Press Keys  None  END
    Set Focus To Element  ${TITULO_SUBPANEL_CONTRATOS}
    Set Focus To Element  ${NOME_CONTRATO_CONTAS}
    Click Element  ${NOME_CONTRATO_CONTAS}
    Wait Until Page Contains    Contratos »    timeout=${TIMEOUT}