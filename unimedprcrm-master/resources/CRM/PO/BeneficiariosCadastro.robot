*** Settings ***
Library     SeleniumLibrary
Library     String
Library     ../../../libs/utilities.py
Library     DebugLibrary
Resource    ../../../main.resource

*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${SHORT_TIMEOUT} =  30
${INPUT_PESSOA_PORTABILIDADE} =  id:pessoa_portabilidade_c
${INPUT_CPF_BENEFICIARIO} =  id:cpf
${DATA_NASCIMENTO_BENEFICIARIO} =  id:data_nasc
${DATA_ADMISSAO_EMPRESA_BENEFICIARIO} =  id:data_adminissao_empresa
${NOME_BENEFICIARIO} =  id:name
${TIPO_BENEFICIARIO} =  id:tipo
${GRAU_DEPENDENCIA_BENEFICIARIO} =  id:grau_dependencia
${INPUT_TITULAR_BENEFICIARIO} =  id:titular
${INPUT_CNS} =  id:cns
${INPUT_SEXO} =  id:sexo
${INPUT_NOME_MAE} =  id:nome_mae
${ESTADO_CIVIL} =  id:estado_civil
${INPUT_NATURALIDADE} =  id:naturalidade_rel_c
${RACA} =  id:raca_c
${TIPO_ENDERECO} =  id:registro_endereco_end_tipo_aaaaa
${TIPO_ENDERECO_ALT} =  id:registro_endereco_end_tipo
${LABEL_CEP} =  id:registro_endereco_end_cep_aaaaa_label
${INPUT_CEP} =  id:registro_endereco_end_cep_aaaaa
${INPUT_NUMERO} =  id:registro_endereco_end_numero_aaaaa
${TIPO_TELEFONE} =  id:registro_telefone_tel_tipo_aaaaa
${NUMERO_TELEFONE} =  id:registro_telefone_name_aaaaa
${LOADING_CEP} =  xpath://*[@id="loadingPage"]/b[contains(text(), 'Carregando página, por favor aguarde...')]
${INPUT_EMAIL_BENEFICIARIO} =  id:registro_email_name_aaaaa
${BOTAO_SALVAR_BENEFICIARIO} =  id:SAVE_HEADER
${BOTAO_NOVO_DEPENDENTE} =  xpath://*[@id="modal-footer"]/p/button[contains(text(), 'Novo Dependende')]
${BOTAO_NOVO_TITULAR} =  xpath://*[@id="modal-footer"]/p/button[contains(text(), 'Novo Titular')]
${BOTAO_ENCERRAR_CADASTRO} =  xpath://*[@id="modal-footer"]/p/button[contains(text(), 'Encerrar cadastro')]
${VINCULO_FINANCEIRO} =  id:contrato_responsavel_grau_dependencia_c
${VINCULO_COMPANHEIRO} =  xpath://*[@id="contrato_responsavel_grau_dependencia_c"]/option[contains(text(), '02 - Companheiro(a)')]
${SALVAR_VINCULO} =  xpath://*[@id="modalResponsavelVinculoTitular"]/div/div/div[3]/button[contains(text(), 'Salvar')]
${MSG_VINCULO_FINANCEIRO} =  xpath://*[@id="modalResponsavelVinculoTitular"]/div/div/div[1]/h4[contains(text(), 'Notamos que o titular inserido neste contrato não é o responsável financeiro, por favor informe o vínculo do responsável financeiro com o titular:')]
${SELECIONAR_PRIMEIRO_PRODUTO} =  xpath://*[@id="produtosDisponiveisBeneficiariosList"]/a[1]
${LABEL_DATA_NASC} =  id:data_nasc_label
${LABEL_DATA_ADMISSAO} =  id:data_adminissao_empresa_label
${LABEL_DATA_INICIO_VIGENCIA} =  id:ben_data_vigencia_c_label
${BTN_CARREGAR_ENDERECO_DO_TITULAR} =  xpath://*[@id="LBL_EDITVIEW_PANEL_ENDERECOS"]/tbody/tr[1]/td[1]/button[contains(text(), 'Carregar Endereço(s) do Titular')]
${LABEL_IDADE} =  id:idade
${INPUT_DATA_CERTIDAO_CASAMENTO} =  id:data_vinculo_titular_c


*** Keywords ***
Preencher o campo CPF
    [Arguments]  ${arg1}
    Set Focus To Element    ${INPUT_CPF_BENEFICIARIO}
    Execute Javascript  document.getElementById('cpf').value="${arg1}"
    Sleep  5s

Preencher o campo Nome do Beneficiário
    [Arguments]  ${arg1}
    Set Focus To Element    ${NOME_BENEFICIARIO}
    Click Element  ${NOME_BENEFICIARIO}
    Input Text  ${NOME_BENEFICIARIO}  ${arg1}    clear=True
    Sleep  5s 

Preencher o campo Data de Nascimento
    [Arguments]  ${arg1}
    Execute Javascript  document.getElementById('data_nasc').value="${arg1}"
    Click Element  ${LABEL_DATA_NASC}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Sleep  5s

Validar Preenchimento Data de Nascimento Titular
    [Arguments]  ${arg1}
    ${nmt}  Get Value    ${TIPO_BENEFICIARIO}

Validar Preenchimento Data de Nascimento Dependente
    [Arguments]  ${arg1}
    ${nmd}  Get Value    ${TIPO_BENEFICIARIO}


Preencher o campo Data Admissao Empresa
    [Arguments]  ${arg1}
    Execute Javascript  document.getElementById('data_adminissao_empresa').value="${arg1}"
    Click Element  ${LABEL_DATA_ADMISSAO}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Sleep  5s

Preencher o campo Data Inicio Vigencia
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Execute Javascript  document.getElementById('ben_data_vigencia_c').value="${date}"
    Click Element  ${LABEL_DATA_INICIO_VIGENCIA}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Sleep  5s

Verificar se o campo Nome do Beneficiário está preenchido com  
    [Arguments]  ${arg1}   
    ${nomebeneficiario} =  Get Value  ${NOME_BENEFICIARIO}
    ${arg1} =  Convert To Uppercase  ${arg1}
    Should Be Equal  ${nomebeneficiario}  ${arg1}

Selecionar o Tipo do Beneficiário
    [Arguments]  ${arg1}
    Sleep        10s
    Select From List By Label  ${TIPO_BENEFICIARIO}  ${arg1}
    Sleep  5s

Selecionar o Grau de Dependencia do Beneficiário
    [Arguments]  ${arg1}
    Sleep  5s
    Select From List By Label  ${GRAU_DEPENDENCIA_BENEFICIARIO}  ${arg1}
    Sleep  3s

Preencher o campo Data Certidao de Casamento
    [Arguments]  ${arg1}
    Input Text  ${INPUT_DATA_CERTIDAO_CASAMENTO}  ${arg1}
    Sleep  ${SLEEP}

Preencher o campo Titular
    [Arguments]  ${arg1}
    Input Text  ${INPUT_TITULAR_BENEFICIARIO}  ${arg1}
    Sleep  ${SLEEP}

Preencher o campo CNS
    [Arguments]  ${arg1}
    Input Text  ${INPUT_CNS}  ${arg1}
    Sleep  ${SLEEP}

Selecionar o Sexo
    [Arguments]  ${arg1}
    Select From List By Label  ${INPUT_SEXO}  ${arg1}
    Sleep  ${SLEEP}

Preencher o campo Nome da Mãe
    [Arguments]  ${arg1}
    Input Text  ${INPUT_NOME_MAE}  ${arg1}
    Sleep  3s

Selecionar o Estado Civil
    [Arguments]  ${arg1}
    Set Focus To Element    ${ESTADO_CIVIL}
    Select From List By Label  ${ESTADO_CIVIL}  ${arg1}
    Sleep  3s

Preencher o campo Naturalidade
    [Arguments]  ${arg1}
    Click Element    ${INPUT_NATURALIDADE}
    Input Text  ${INPUT_NATURALIDADE}  ${arg1}
    Sleep  5s

Selecionar a Raça
    [Arguments]  ${arg1}
    Select From List By Label  ${RACA}  ${arg1}
    Sleep  3s

Selecionar a Tipo de Endereço
    [Arguments]  ${arg1}
    ${e}  Run Keyword And Ignore Error  Set Focus To Element    ${TIPO_ENDERECO}
    Run Keyword If  "${e[0]}" == "PASS"  Select From List By Label  ${TIPO_ENDERECO}  ${arg1}
    Run Keyword If  "${e[0]}" == "FAIL"  Set Focus To Element    ${TIPO_ENDERECO_ALT}
    Run Keyword If  "${e[0]}" == "FAIL"  Select From List By Label  ${TIPO_ENDERECO_ALT}  ${arg1}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png 
    Sleep  5s

Preencher o campo CEP
    [Arguments]  ${arg1}
    Set Focus To Element    ${INPUT_CEP}
    Execute Javascript  document.getElementById('registro_endereco_end_cep_aaaaa').value="${arg1}"
    Click Element  ${LABEL_CEP}
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${LOADING_CEP}  timeout=${TIMEOUT}
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${LOADING_CEP}  timeout=${TIMEOUT}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Sleep  5s

Preencher o campo Numero
    [Arguments]  ${arg1}
    Set Focus To Element   ${INPUT_NUMERO}
    Execute Javascript  document.getElementById('registro_endereco_end_numero_aaaaa').value="${arg1}"
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Sleep  ${SLEEP}

Carregar endereço do Titular
    Set Focus To Element    ${BTN_CARREGAR_ENDERECO_DO_TITULAR}
    Click Element    ${BTN_CARREGAR_ENDERECO_DO_TITULAR}
    Sleep  5s

Selecionar a Tipo Telefone
    [Arguments]  ${arg1}
    Set Focus To Element    ${TIPO_TELEFONE}
    Select From List By Label  ${TIPO_TELEFONE}  ${arg1}
    Sleep  ${SLEEP}

Preencher o campo Numero Telefone
    [Arguments]  ${arg1}
    Input Text  ${NUMERO_TELEFONE}  ${arg1}
    Capture Page Screenshot    filename=selenium-screenshot-{index}.png
    Sleep  ${SLEEP}

Preencher o campo Email
    [Arguments]  ${arg1}
    Input Text  ${INPUT_EMAIL_BENEFICIARIO}  ${arg1}
    Sleep  ${SLEEP}

Clicar em Salvar Beneficiários
    Sleep  3s
    Set Focus To Element  ${BOTAO_SALVAR_BENEFICIARIO}
    Click Element  ${BOTAO_SALVAR_BENEFICIARIO}
    

Validar mensagem Salvar Beneficiarios
    ${z}  Run Keyword And Ignore Error   Wait Until Page Contains    Favor selecionar o produto     timeout=${SHORT_TIMEOUT}
    Run Keyword If  "${z[0]}" == "PASS"  Set Focus To Element  ${SELECIONAR_PRIMEIRO_PRODUTO}
    Run Keyword If  "${z[0]}" == "PASS"  Click Element  ${SELECIONAR_PRIMEIRO_PRODUTO}
    Run Keyword If  "${z[0]}" == "PASS"  Set Focus To Element  ${BOTAO_SALVAR_BENEFICIARIO}
    Run Keyword If  "${z[0]}" == "PASS"  Click Element  ${BOTAO_SALVAR_BENEFICIARIO}

    # ${p}  Run Keyword And Ignore Error  Wait Until Page Contains  O estado civil esta diferente do titular, deseja manter a informação e atualizar o estado civil do titular?    timeout=${SHORT_TIMEOUT}
    # Run Keyword If  "${p[0]}" == "PASS"  Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    # Run Keyword If  "${p[0]}" == "PASS"  Click Element  ${BOTAO_SIM_CONFIRMACAO}

    # ${s}  Run Keyword And Ignore Error  Wait Until Page Contains  O nome do beneficiário informado está diferente do nome no sistema DATASUS para este CPF:    timeout=${SHORT_TIMEOUT}
    # Run Keyword If  "${s[0]}" == "PASS"  Wait Until Page Contains Element       ${BOTAO_SIM_CONFIRMACAO}        timeout=30
    # Run Keyword If  "${s[0]}" == "PASS"  Set Focus To Element  ${BOTAO_SIM_CONFIRMACAO}
    # Run Keyword If  "${s[0]}" == "PASS"  Click Element  ${BOTAO_SIM_CONFIRMACAO}

    ${v}  Run Keyword And Ignore Error  Wait Until Element Is Visible    ${MSG_VINCULO_FINANCEIRO}     timeout=${SHORT_TIMEOUT}
    Run Keyword If  "${v[0]}" == "PASS"  Set Focus To Element  ${VINCULO_FINANCEIRO}
    Run Keyword If  "${v[0]}" == "PASS"  Click Element  ${VINCULO_FINANCEIRO}
    Run Keyword If  "${v[0]}" == "PASS"  Click Element  ${VINCULO_COMPANHEIRO}
    Run Keyword If  "${v[0]}" == "PASS"  Click Element  ${SALVAR_VINCULO}


Validar Mensagens de obrigatoriedade endereço
    [Arguments]  @{arg1}
    ${c}  Run Keyword And Ignore Error   Wait Until Page Contains   Campo obrigatório não preenchido: Cidade    timeout=${SHORT_TIMEOUT}
    ${n}  Run Keyword And Ignore Error   Wait Until Page Contains   Campo obrigatório não preenchido: Número       timeout=${SHORT_TIMEOUT}
    
    Run Keyword If  "${c[0]}" == "PASS"  Set Focus To Element    ${INPUT_CEP}
    Run Keyword If  "${c[0]}" == "PASS"  Input Text  ${INPUT_CEP}  ${arg1[23]}
    Run Keyword If  "${c[0]}" == "PASS"  Click Element  ${LABEL_CEP}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Element Is Visible   ${LOADING_CEP}  timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Element Is Not Visible   ${LOADING_CEP}  timeout=${TIMEOUT}
    
    Run Keyword If  "${n[0]}" == "PASS"  Set Focus To Element   ${INPUT_NUMERO}
    Run Keyword If  "${n[0]}" == "PASS"  Input Text  ${INPUT_NUMERO}  ${arg1[24]}
    Run Keyword If  "${n[0]}" == "PASS"  Click Element  ${LABEL_CEP}
   
    Sleep  3s
    Run Keyword If  "${c[0]}" == "PASS"  Set Focus To Element  ${BOTAO_SALVAR_BENEFICIARIO}
    Run Keyword If  "${c[0]}" == "PASS"  Click Element  ${BOTAO_SALVAR_BENEFICIARIO}


Salvar Beneficiário desejando incluir dependentes
    Wait Until Page Contains  Selecione uma das opções?
    Wait Until Element Is Visible    ${BOTAO_NOVO_DEPENDENTE}    timeout=${TIMEOUT}
    Set Focus To Element  ${BOTAO_NOVO_DEPENDENTE}
    Click Element  ${BOTAO_NOVO_DEPENDENTE}


Salvar Beneficiário desejando incluir novo titular
    Wait Until Page Contains  Selecione uma das opções?
    Wait Until Element Is Visible    ${BOTAO_NOVO_TITULAR}    timeout=${TIMEOUT}
    Set Focus To Element  ${BOTAO_NOVO_TITULAR}
    Click Element  ${BOTAO_NOVO_TITULAR}


Salvar Beneficiário não desejando incluir dependentes
    Wait Until Page Contains  Selecione uma das opções?    timeout=${TIMEOUT}
    Set Focus To Element  ${BOTAO_ENCERRAR_CADASTRO}
    Sleep  30s
    Wait Until Element Is Visible    ${BOTAO_ENCERRAR_CADASTRO}    timeout=${TIMEOUT}
    Click Element  ${BOTAO_ENCERRAR_CADASTRO}


Usuário selecionar beneficiário no campo "Pessoa da Portabilidade"
    Set Focus To Element  ${INPUT_PESSOA_PORTABILIDADE}
    Click Element    ${INPUT_PESSOA_PORTABILIDADE}
    Input Text  ${INPUT_PESSOA_PORTABILIDADE}  ${fakename}
    Click Element  xpath://*[@id="pessoa_portabilidade_c_label"]
    Sleep  10s


Gerar arquivo com 3 vidas
    [Arguments]  @{arg1}
    Clear Files In Path  ${DOWNLOADS_FOLDER}  .csv  gerador
    Run Keyword If  '${arg1[0]}' == 'Pessoa Física'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Pessoa Física'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Pessoa Jurídica (CNPJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Pessoa Jurídica (CNPJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Pessoa Jurídica (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Pessoa Jurídica (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    Execute Javascript    window.open('')
    Get Window Titles
    Switch Window    title=undefined
    Go To   ${GERADOR_URL}
    Input Text  xpath=//form[8]/input[1]  3
    Input Text  xpath=//form[8]/input[2]  ${PROD_ASSIST}
    Input Text  xpath=//form[8]/input[3]  ${PROD_ACESSORIO}
    Click Button  xpath=//form[8]/input[6]
    Click Button  xpath=//form[8]/input[7]
    Close Window
    Sleep  5s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}


Gerar arquivo com 10 vidas
    [Arguments]  @{arg1}
    Clear Files In Path  ${DOWNLOADS_FOLDER}  .csv  gerador
    Run Keyword If  '${arg1[0]}' == 'Pessoa Física'   Set Test Variables  ${PROD_ASSIST}  5033
    Run Keyword If  '${arg1[0]}' == 'Pessoa Física'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Pessoa Jurídica (CNPJ)'   Set Test Variables  ${PROD_ASSIST}  5045
    Run Keyword If  '${arg1[0]}' == 'Pessoa Jurídica (CNPJ)'   Set Test Variables  ${PROD_ACESSORIO}  1020

    Run Keyword If  '${arg1[0]}' == 'Pessoa Jurídica (CAEPF)'   Set Test Variables  ${PROD_ASSIST}  5046
    Run Keyword If  '${arg1[0]}' == 'Pessoa Jurídica (CAEPF)'   Set Test Variables  ${PROD_ACESSORIO}  1020
    Execute Javascript    window.open('')
    Get Window Titles
    Switch Window    title=undefined
    Go To   ${GERADOR_URL}
    Input Text  xpath=//form[8]/input[1]  10
    Input Text  xpath=//form[8]/input[2]  ${PROD_ASSIST}
    Input Text  xpath=//form[8]/input[3]  ${PROD_ACESSORIO}
    Click Button  xpath=//form[8]/input[6]
    Click Button  xpath=//form[8]/input[7]
    Close Window
    Sleep  5s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}


Apresentou mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    Wait Until Page Contains    Beneficiário não possui uma Declaração de Saúde    timeout=${TIMEOUT}


Não apresentou mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    Wait Until Page Does Not Contain    Beneficiário não possui uma Declaração de Saúde    timeout=${TIMEOUT}

Nome diferente do sistema DATASUS
    ${p}  Run Keyword And Ignore Error  Wait Until Page Contains  O estado civil esta diferente do titular, deseja manter a informação e atualizar o estado civil do titular?    timeout=${SHORT_TIMEOUT}
    Run Keyword If  "${p[0]}" == "PASS"  Set Focus To Element  id:yui-gen0-button
    Run Keyword If  "${p[0]}" == "PASS"  Click Element  id:yui-gen0-button
    Run Keyword If  "${p[0]}" == "PASS"  Sleep  10s

    ${s}  Run Keyword And Ignore Error  Wait Until Page Contains  O nome do beneficiário informado está diferente do nome no sistema DATASUS para este CPF:    timeout=${SHORT_TIMEOUT}
    Run Keyword If  "${s[0]}" == "PASS"  Wait Until Page Contains Element       id:yui-gen0-button        timeout=30
    Run Keyword If  "${s[0]}" == "PASS"  Set Focus To Element  id:yui-gen0-button
    Run Keyword If  "${s[0]}" == "PASS"  Click Element  id:yui-gen0-button
    Run Keyword If  "${s[0]}" == "PASS"  Sleep  10s
