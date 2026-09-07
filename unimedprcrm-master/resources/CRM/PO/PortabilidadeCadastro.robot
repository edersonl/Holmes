*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary        locale=pt-BR
Resource    ../../../main.resource
*** Variables ***
${TIMEOUT} =  30
${BOTAO_SALVAR} =  xpath://*[@id="SAVE_HEADER"]
${INPUT_PESSOA} =  xpath://*[@id="pessoa"]
${INPUT_TIPO} =  xpath://*[@id="tipo"]
${TIPO_TITULAR} =  xpath://*[@id="tipo"]/option[contains(text(), 'Titular')]
${TIPO_DEPENTENTE} =  xpath://*[@id="tipo"]/option[contains(text(), 'Dependente')]
${INPUT_TELEFONE} =  xpath://*[@id="pessoa_celular_c"]
${INPUT_EMAIL} =  xpath://*[@id="pessoa_email_c"]/../input
${INPUT_REG_OPERADORA} =  xpath://*[@id="num_reg_operadora_origem"]
${INPUT_REG_PLANO_ORIGEM} =  xpath://*[@id="num_reg_plano_origem"]
${ABA_CHECKLIST_DOCUMENTACAO} =  xpath://*[@id="tab2"]/em[contains(text(), 'Checklist da Documentação')]
${OPCAO_PRESENTE} =  xpath://*[@id="checklist_span"]/table/tbody/tr[2]/td[2]/span[1]/label
${OPCAO_PRESENTE2} =  xpath://*[@id="checklist_span"]/table/tbody/tr[3]/td[2]/span[1]/label
${SETA_PESSOA} =  xpath://*[@id="btn_pessoa"]
${CRIAR_PESSOA} =  xpath://*[@id="addformlink"]/input
${INPUT_NOME_PESSOA} =  xpath://*[@id="name"]
${INPUT_DATA_NASCIMENTO} =  xpath://*[@id="pes_data_nasc"]
${INPUT_TIPO_PESSOA} =  xpath://*[@id="pessoa_tipo"]
${TIPO_PESSOA_TITULAR} =  xpath://*[@id="pessoa_tipo"]/option[contains(text(), 'Titular')]
${TIPO_PESSOA_DEPENDENTE} =  xpath://*[@id="pessoa_tipo"]/option[contains(text(), 'Dependente')]
${CPF_PESSOA} =  xpath://*[@id="pes_cpf_cnpj"]
${BOTAO_SALVAR_PESSOA} =  xpath://*[@id="saude_PESSOA_popupcreate_save_button"]
${TIPO_PESSOA_PORTABILIDADE} =  id:tipo
${TIPO_PORTABILIDADE} =  xpath://*[@id="tipo"]/option[contains(text(), 'Dependente')]
${GRAU_DEPENDENCIA} =  xpath://*[@id="grau_dependencia"]
${GRAU_COMPANHEIRO} =  xpath://*[@id="grau_dependencia"]/option[contains(text(), '02 - Companheiro(a)')]
${GRAU_DEPENDENCIA_COMPANHEIROA} =  xpath://*[@id="subPanel"]//span[contains(text(), '02 - Companheiro(a)')]
${GRAU_DEPENDENCIA_CONJUGE} =  xpath://*[@id="subPanel"]//span[contains(text(), '01 - Cônjuge')]
${PRODUTO_ASSISTENCIAL} =  id:aos_products_id_c
${INPUT_TITULAR} =  id:titular

*** Keywords ***
Apresentar a Tela Solicitação de Portabilidade » Criar
    ${mensagem} =  Catenate  Solicitação de Portabilidade »  Criar
    Wait Until Page Contains  ${mensagem}  timeout=${TIMEOUT}

Clicar no botão <Salvar> portabilidade
    Set Focus To Element  ${BOTAO_SALVAR}
    Click Element  ${BOTAO_SALVAR}

Preencher os campos obrigatórios "Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem"
    Wait Until Page Contains    Pessoa (Portabilidade) » Criar    timeout=${TIMEOUT}

Preencher o campo Pessoa com
    [Arguments]     ${arg1}
    ${arg1}  Convert To Upper Case  ${arg1}
    Input Text  ${INPUT_PESSOA}  ${arg1}
    Sleep  10s

Preencher o campo Pessoa (PJ/CAEPF) com
    [Arguments]     ${arg1}
    ${arg1}  Convert To Upper Case  ${arg1}
    Click Element  id:btn_pessoa
    Sleep  10s

    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}

    Input Text  id:name_advanced  ${arg1}
    Click Element  id:search_form_submit
    Sleep  5s
    
    ${p}  Run Keyword And Ignore Error  Click Element  xpath://table[4]/tbody[2]/tr[1]/td[1]/a
    Run Keyword If  "${p[0]}" == "FAIL"  Click Element  id:search_form_clear
    Run Keyword If  "${p[0]}" == "FAIL"  Click Element  id:search_form_submit
    Run Keyword If  "${p[0]}" == "FAIL"  Sleep  5s
    Run Keyword If  "${p[0]}" == "FAIL"  Click Element  xpath://table[4]/tbody[2]/tr[1]/td[1]/a

    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    Run Keyword If  '${tam}' == '1'   Switch Window  ${excludes[0]}
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}

    Sleep  10s

Selecionar o tipo Titular
    Set Focus To Element  ${INPUT_TIPO}
    Click Element  ${INPUT_TIPO}
    Click Element  ${TIPO_TITULAR}
    Sleep  10s

Preencher o campo Telefone Celular (PJ/CAEPF) com
    Input Text  ${INPUT_TELEFONE}  (99)9999-9999    clear=True


Preencher o campo Telefone Celular com
    [Arguments]  ${arg1}
    Input Text  ${INPUT_TELEFONE}  ${arg1}    clear=True

Preencher Email com
    Input Text  ${INPUT_EMAIL}  prime@automacao.com

Preencher Nº Reg. Operadora Origem
    Input Text  ${INPUT_REG_OPERADORA}  123    clear=True

Preencher Nº Reg. Plano Origem
    Input Text  ${INPUT_REG_PLANO_ORIGEM}  456    clear=True

Clicar em Salvar a Portabilidade
    Set Focus To Element  ${BOTAO_SALVAR}
    Click Element  ${BOTAO_SALVAR}
    ${temp}    Get Current Date    exclude_millis=yes
    ${convertglobal} =      Convert Date      ${temp}      result_format=%d/%m/%Y %H:
    Set Global Variable  ${convertglobal}

Clicar na aba "Checklist da Documentação"
    Set Focus To Element  ${ABA_CHECKLIST_DOCUMENTACAO}
    Click Element  ${ABA_CHECKLIST_DOCUMENTACAO}

Selecionar a opção "Presente" e clicar no botão "Salvar"
    Set Focus To Element  ${OPCAO_PRESENTE}
    Click Element  ${OPCAO_PRESENTE}
    Set Focus To Element  ${OPCAO_PRESENTE}

    ${rg}  Run Keyword And Ignore Error  Wait Until Page Contains    RG e CNH    timeout=${TIMEOUT}
    Run Keyword If  "${rg[0]}" == "PASS"  Set Focus To Element  ${OPCAO_PRESENTE2}
    Run Keyword If  "${rg[0]}" == "PASS"  Click Element  ${OPCAO_PRESENTE2}

    Click Element  ${BOTAO_SALVAR}

Cadastrar uma Pessoa "Dependente"
    Set Focus To Element             ${SETA_PESSOA}
    Click Element                    ${SETA_PESSOA}
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Maximize Browser Window
    Sleep  10s
    Wait Until Element Is Visible    ${CRIAR_PESSOA}
    Set Focus To Element             ${CRIAR_PESSOA}
    Click Element                    ${CRIAR_PESSOA}
    ${temp}        FakerLibrary.Name
    ${nome}        Remover Caracteres Especiais      ${temp}
    ${fakename}    Convert To Uppercase              ${nome}
    Set Test Variables    ${fakename}
    Input Text                       ${INPUT_NOME_PESSOA}           ${fakename}
    Sleep  5s
    ${data}        FakerLibrary.Date Of Birth      minimum_age=18  maximum_age=70
    ${temp}        Comum.Colocar Data Formato Brasileiro      ${data}
    Input Text                       ${INPUT_DATA_NASCIMENTO}       ${temp}
    Click Element                    ${INPUT_TIPO_PESSOA}
    Set Focus To Element             ${TIPO_PESSOA_DEPENDENTE}
    Click Element                    ${TIPO_PESSOA_DEPENDENTE}
    ${temp}        FakerLibrary.Cpf
    Input Text                       ${CPF_PESSOA}      ${temp}
    Click Element                    ${BOTAO_SALVAR_PESSOA}
    Click Element                    xpath://html/body/table[4]/tbody[2]/tr[1]/td[1]/a[contains(text(), '${fakename}')]
    Sleep  10s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '1'   Switch Window  ${excludes[0]}
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Set Focus To Element             ${INPUT_TIPO}
    Click Element                    ${INPUT_TIPO}
    # Click Element                    ${TIPO_DEPENTENTE}
    # Input Text  xp//*[@id="titular"] ${}
    Click Element                    ${GRAU_DEPENDENCIA}
    Click Element                    ${GRAU_COMPANHEIRO}
    ${temp}         FakerLibrary.Email
    Input Text                       ${INPUT_EMAIL}    ${temp}
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}
    Input Text                       ${INPUT_TELEFONE}    ${tel}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_OPERADORA}    ${temp}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_PLANO_ORIGEM}      ${temp}
    Set Focus To Element             ${BOTAO_SALVAR}
    Click Element                    ${BOTAO_SALVAR}
    Wait Until Page Contains      Solicitação de Portabilidade » Solicitação
    Set Focus To Element             ${GRAU_DEPENDENCIA_COMPANHEIROA}
    Wait Until Element Is Visible    ${GRAU_DEPENDENCIA_COMPANHEIROA}
    

Cadastrar uma Pessoa "Titular"
    Set Focus To Element             ${SETA_PESSOA}
    Click Element                    ${SETA_PESSOA}
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Run Keyword If  '${tam}' == '4'   Switch Window  ${excludes[3]}
    Maximize Browser Window
    Sleep  10s
    Wait Until Element Is Visible    ${CRIAR_PESSOA}
    Set Focus To Element             ${CRIAR_PESSOA}
    Click Element                    ${CRIAR_PESSOA}
    ${temp}        FakerLibrary.Name
    ${nome}        Remover Caracteres Especiais      ${temp}
    ${fakename}    Convert To Uppercase              ${nome}
    Set Global Variable    ${fakename}
    Input Text                       ${INPUT_NOME_PESSOA}           ${fakename}
    Sleep  5s
    ${data}        FakerLibrary.Date Of Birth      minimum_age=18  maximum_age=70
    ${temp}        Comum.Colocar Data Formato Brasileiro      ${data}
    Input Text                       ${INPUT_DATA_NASCIMENTO}       ${temp}
    Click Element                    ${INPUT_TIPO_PESSOA}
    Set Focus To Element             ${TIPO_PESSOA_TITULAR}
    Click Element                    ${TIPO_PESSOA_TITULAR}
    ${temp}        FakerLibrary.Cpf
    Input Text                       ${CPF_PESSOA}      ${temp}
    Click Element                    ${BOTAO_SALVAR_PESSOA}
    Click Element                    xpath://html/body/table[4]/tbody[2]/tr[1]/td[1]/a[contains(text(), '${fakename}')]
    Sleep  10s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '1'   Switch Window  ${excludes[0]}
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Sleep  3s
    ${temp}         FakerLibrary.Email
    Input Text                       ${INPUT_EMAIL}    ${temp}
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}
    Input Text                       ${INPUT_TELEFONE}    ${tel}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_OPERADORA}    ${temp}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_PLANO_ORIGEM}      ${temp}
    Set Focus To Element             ${INPUT_TIPO}
    Click Element                    ${INPUT_TIPO}
    Click Element                    ${TIPO_TITULAR}
    Set Focus To Element             ${BOTAO_SALVAR}
    Click Element                    ${BOTAO_SALVAR}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains      Campo obrigatório não preenchido: Produto Assistencial
    Run Keyword If  "${v[0]}" == "PASS"  Set Focus To Element             ${PRODUTO_ASSISTENCIAL}
    Run Keyword If  "${v[0]}" == "PASS"  Click Element                    ${PRODUTO_ASSISTENCIAL}
    Run Keyword If  "${v[0]}" == "PASS"  Click Element                    xpath://*[@id="aos_products_id_c"]/option[2]
    Run Keyword If  "${v[0]}" == "PASS"  Set Focus To Element             ${BOTAO_SALVAR}
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  5s
    Run Keyword If  "${v[0]}" == "PASS"  Click Element                    ${BOTAO_SALVAR}
    Wait Until Page Contains      Solicitação de Portabilidade » Solicitação


Cadastrar uma Pessoa
    [Arguments]  ${arg1}
    Set Focus To Element             ${SETA_PESSOA}
    Click Element                    ${SETA_PESSOA}
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Maximize Browser Window
    Sleep  10s
    Wait Until Element Is Visible    ${CRIAR_PESSOA}
    Set Focus To Element             ${CRIAR_PESSOA}
    Click Element                    ${CRIAR_PESSOA}
    ${temp}        FakerLibrary.Name
    ${nome}        Remover Caracteres Especiais      ${temp}
    ${fakename}    Convert To Uppercase              ${nome}
    Set Global Variable    ${fakename}
    Input Text                       ${INPUT_NOME_PESSOA}           ${fakename}
    Sleep  5s
    ${data}        FakerLibrary.Date Of Birth      minimum_age=18  maximum_age=70
    ${temp}        Comum.Colocar Data Formato Brasileiro      ${data}
    Input Text                       ${INPUT_DATA_NASCIMENTO}       ${temp}
    Sleep  5s
    Set Focus To Element             ${INPUT_TIPO_PESSOA}
    Click Element                    ${INPUT_TIPO_PESSOA}
    Set Focus To Element             ${TIPO_PESSOA_DEPENDENTE}
    Click Element                    ${TIPO_PESSOA_DEPENDENTE}
    ${temp}        FakerLibrary.Cpf
    Input Text                       ${CPF_PESSOA}      ${temp}
    Click Element                    ${BOTAO_SALVAR_PESSOA}
    Click Element                    xpath://html/body/table[4]/tbody[2]/tr[1]/td[1]/a[contains(text(), '${fakename}')]
    Sleep  10s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '1'   Switch Window  ${excludes[0]}
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}

    Wait Until Element Is Visible     ${TIPO_PESSOA_PORTABILIDADE}
    Set Focus To Element    ${TIPO_PESSOA_PORTABILIDADE}
    Click Element     ${TIPO_PESSOA_PORTABILIDADE}
    Click Element     xpath://*[@id="tipo"]/option[contains(text(), '${arg1}')]
    Sleep  5s
    # Click Element                    ${GRAU_DEPENDENCIA}
    # Click Element                    ${GRAU_COMPANHEIRO}
    ${temp}         FakerLibrary.Email
    Input Text                       ${INPUT_EMAIL}    ${temp}
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}
    Input Text                       ${INPUT_TELEFONE}    ${tel}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_OPERADORA}    ${temp}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_PLANO_ORIGEM}      ${temp}
    Set Focus To Element             ${BOTAO_SALVAR}
    Click Element                    ${BOTAO_SALVAR}
    Wait Until Page Contains      Solicitação de Portabilidade » Solicitação
    #${NOME_PESSOA_CADASTRADA}    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${fakename}')]
    Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${fakename}')]
    Wait Until Element Is Visible    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), '${fakename}')]


Cadastrar uma Pessoa "Titular" (INTEG MOV INCLUSÃO CRM)
    [Arguments]  @{arg1}
    Set Focus To Element             ${SETA_PESSOA}
    Click Element                    ${SETA_PESSOA}
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Maximize Browser Window
    Sleep  10s
    Wait Until Element Is Visible    ${CRIAR_PESSOA}
    Set Focus To Element             ${CRIAR_PESSOA}
    Click Element                    ${CRIAR_PESSOA}
    Input Text                       ${INPUT_NOME_PESSOA}           ${arg1[40]}
    Sleep  5s
    ${data}        FakerLibrary.Date Of Birth      minimum_age=18  maximum_age=70
    ${temp}        Comum.Colocar Data Formato Brasileiro      ${data}
    Input Text                       ${INPUT_DATA_NASCIMENTO}       ${temp}
    Click Element                    ${INPUT_TIPO_PESSOA}
    Set Focus To Element             ${TIPO_PESSOA_TITULAR}
    Click Element                    ${TIPO_PESSOA_TITULAR}
    ${temp}        FakerLibrary.Cpf
    Input Text                       ${CPF_PESSOA}      ${temp}
    Click Element                    ${BOTAO_SALVAR_PESSOA}
    Click Element                    xpath://html/body/table[4]/tbody[2]/tr[1]/td[1]/a[contains(text(), '${arg1[40]}')]
    Sleep  10s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '1'   Switch Window  ${excludes[0]}
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Sleep  3s
    ${temp}         FakerLibrary.Email
    Input Text                       ${INPUT_EMAIL}    ${temp}
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}
    Input Text                       ${INPUT_TELEFONE}    ${tel}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_OPERADORA}    ${temp}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_PLANO_ORIGEM}      ${temp}
    Set Focus To Element             ${INPUT_TIPO}
    Click Element                    ${INPUT_TIPO}
    Click Element                    ${TIPO_TITULAR}
    Set Focus To Element             ${BOTAO_SALVAR}
    Click Element                    ${BOTAO_SALVAR}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains      Campo obrigatório não preenchido: Produto Assistencial
    Run Keyword If  "${v[0]}" == "PASS"  Set Focus To Element             ${PRODUTO_ASSISTENCIAL}
    Run Keyword If  "${v[0]}" == "PASS"  Click Element                    ${PRODUTO_ASSISTENCIAL}
    Run Keyword If  "${v[0]}" == "PASS"  Click Element                    xpath://*[@id="aos_products_id_c"]/option[2]
    Run Keyword If  "${v[0]}" == "PASS"  Set Focus To Element             ${BOTAO_SALVAR}
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  5s
    Run Keyword If  "${v[0]}" == "PASS"  Execute Javascript   document.getElementById("SAVE_HEADER").click()
    Wait Until Page Contains      Solicitação de Portabilidade » Solicitação


Cadastrar uma Pessoa "Dependente" (INTEG MOV INCLUSÃO CRM)
    [Arguments]  @{arg1}
    Set Focus To Element             ${SETA_PESSOA}
    Click Element                    ${SETA_PESSOA}
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Maximize Browser Window
    Sleep  10s
    Wait Until Element Is Visible    ${CRIAR_PESSOA}
    Set Focus To Element             ${CRIAR_PESSOA}
    Click Element                    ${CRIAR_PESSOA}
    Input Text                       ${INPUT_NOME_PESSOA}           ${arg1[48]}
    Sleep  5s
    ${data}        FakerLibrary.Date Of Birth      minimum_age=18  maximum_age=70
    ${temp}        Comum.Colocar Data Formato Brasileiro      ${data}
    Input Text                       ${INPUT_DATA_NASCIMENTO}       ${temp}
    Click Element                    ${INPUT_TIPO_PESSOA}
    Run Keyword And Ignore Error   Set Focus To Element             ${TIPO_PESSOA_DEPENDENTE}
    Run Keyword And Ignore Error   Click Element                    ${TIPO_PESSOA_DEPENDENTE}
    ${temp}        FakerLibrary.Cpf
    Input Text                       ${CPF_PESSOA}      ${temp}
    Click Element                    ${BOTAO_SALVAR_PESSOA}
    Click Element                    xpath://html/body/table[4]/tbody[2]/tr[1]/td[1]/a[contains(text(), '${arg1[48]}')]
    Sleep  10s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '1'   Switch Window  ${excludes[0]}
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword And Ignore Error   Set Focus To Element             ${INPUT_TIPO}
    Run Keyword And Ignore Error   Click Element                    ${INPUT_TIPO}
    Run Keyword And Ignore Error   Click Element                    ${TIPO_DEPENTENTE}
    Set Focus To Element       ${GRAU_DEPENDENCIA}
    Select From List By Label  ${GRAU_DEPENDENCIA}  01 - Cônjuge
    ${temp}         FakerLibrary.Email
    Input Text                       ${INPUT_EMAIL}    ${temp}
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}
    Input Text                       ${INPUT_TELEFONE}    ${tel}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_OPERADORA}    ${temp}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_PLANO_ORIGEM}      ${temp}
    Set Focus To Element             ${BOTAO_SALVAR}
    Click Element                    ${BOTAO_SALVAR}
    ${v}  Run Keyword And Ignore Error   Wait Until Page Contains      Campo obrigatório não preenchido: Produto Assistencial
    Run Keyword If  "${v[0]}" == "PASS"  Set Focus To Element             ${PRODUTO_ASSISTENCIAL}
    Run Keyword If  "${v[0]}" == "PASS"  Click Element                    ${PRODUTO_ASSISTENCIAL}
    Run Keyword If  "${v[0]}" == "PASS"  Click Element                    xpath://*[@id="aos_products_id_c"]/option[2]
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  3s
    Run Keyword If  "${v[0]}" == "PASS"  Set Focus To Element             ${BOTAO_SALVAR}
    Run Keyword If  "${v[0]}" == "PASS"  Sleep  5s
    Run Keyword If  "${v[0]}" == "PASS"  Click Element                    ${BOTAO_SALVAR}

    ${s}  Run Keyword And Ignore Error   Wait Until Page Contains      Solicitação de Portabilidade » Solicitação
    Run Keyword If  "${s[0]}" == "FAIL"  Set Focus To Element             ${BOTAO_SALVAR}
    Run Keyword If  "${s[0]}" == "FAIL"  Sleep  5s
    Run Keyword If  "${s[0]}" == "FAIL"  Execute Javascript   document.getElementById("SAVE_HEADER").click()
    Run Keyword If  "${s[0]}" == "FAIL"  Wait Until Page Contains      Solicitação de Portabilidade » Solicitação
    Set Focus To Element             ${GRAU_DEPENDENCIA_CONJUGE}
    Wait Until Element Is Visible    ${GRAU_DEPENDENCIA_CONJUGE}


Cadastrou primeiro DEPENDENTE
    [Arguments]  @{arg1}
    Wait Until Page Contains  Pessoa (Portabilidade) » Criar     timeout=${TIMEOUT}
    Set Focus To Element             ${SETA_PESSOA}
    Click Element                    ${SETA_PESSOA}
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Maximize Browser Window
    Sleep  10s
    Wait Until Element Is Visible    ${CRIAR_PESSOA}
    Set Focus To Element             ${CRIAR_PESSOA}
    Click Element                    ${CRIAR_PESSOA}
    Input Text                       ${INPUT_NOME_PESSOA}           ${arg1[48]}
    Sleep  5s
    Input Text                       ${INPUT_DATA_NASCIMENTO}       ${arg1[51]}
    Click Element                    ${INPUT_TIPO_PESSOA}
    Set Focus To Element             ${TIPO_PESSOA_DEPENDENTE}
    Click Element                    ${TIPO_PESSOA_DEPENDENTE}

    Input Text                       ${CPF_PESSOA}      ${arg1[47]}
    Click Element                    ${BOTAO_SALVAR_PESSOA}
    Click Element                    xpath://html/body/table[4]/tbody[2]/tr[1]/td[1]/a[contains(text(), '${arg1[48]}')]
    Sleep  10s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '1'   Switch Window  ${excludes[0]}
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Set Focus To Element             ${INPUT_TIPO}
    Click Element                    ${INPUT_TIPO}
    Click Element                    ${TIPO_DEPENTENTE}
    Click Element                    ${GRAU_DEPENDENCIA}
    Click Element                    ${GRAU_COMPANHEIRO}
    Input Text                       ${INPUT_TITULAR}    ${arg1[1]}
    Sleep  5s
    Press Keys  None  ARROW_DOWN
    Press Keys  None  ENTER
    Input Text                       ${INPUT_EMAIL}    ${arg1[52]}
    Input Text                       ${INPUT_TELEFONE}    ${arg1[26]}

    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_OPERADORA}    ${temp}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_PLANO_ORIGEM}      ${temp}
    Set Focus To Element             ${BOTAO_SALVAR}
    Click Element                    ${BOTAO_SALVAR}
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword If  "${f[0]}" == "PASS"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60

    Wait Until Page Contains      Solicitação de Portabilidade » Solicitação
    Set Focus To Element             ${GRAU_DEPENDENCIA_COMPANHEIROA}
    Wait Until Element Is Visible    ${GRAU_DEPENDENCIA_COMPANHEIROA}


Cadastrou segundo DEPENDENTE
    [Arguments]  @{arg1}
    Wait Until Page Contains  Pessoa (Portabilidade) » Criar     timeout=${TIMEOUT}
    Set Focus To Element             ${SETA_PESSOA}
    Click Element                    ${SETA_PESSOA}
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Maximize Browser Window
    Sleep  10s
    Wait Until Element Is Visible    ${CRIAR_PESSOA}
    Set Focus To Element             ${CRIAR_PESSOA}
    Click Element                    ${CRIAR_PESSOA}
    Input Text                       ${INPUT_NOME_PESSOA}           ${arg1[56]}
    Sleep  5s
    Input Text                       ${INPUT_DATA_NASCIMENTO}       ${arg1[59]}
    Click Element   ${INPUT_TIPO_PESSOA}
    Set Focus To Element  ${TIPO_PESSOA_DEPENDENTE}
    Click Element    ${TIPO_PESSOA_DEPENDENTE}

    Input Text                       ${CPF_PESSOA}      ${arg1[55]}
    Click Element                    ${BOTAO_SALVAR_PESSOA}
    Click Element                    xpath://html/body/table[4]/tbody[2]/tr[1]/td[1]/a[contains(text(), '${arg1[56]}')]
    Sleep  10s
    Switch Window  MAIN
    Run Keyword And Ignore Error  Set Focus To Element             ${INPUT_TIPO}
    Run Keyword And Ignore Error  Click Element                    ${INPUT_TIPO}
    Run Keyword And Ignore Error  Click Element                    ${TIPO_DEPENTENTE}
    Click Element                    ${GRAU_DEPENDENCIA}
    Click Element                    ${GRAU_COMPANHEIRO}
    ${t}  Run Keyword And Ignore Error  Input Text                       ${INPUT_TITULAR}    ${arg1[1]}
    Run Keyword If  "${t[0]}" == "PASS"  Sleep  5s
    Run Keyword If  "${t[0]}" == "PASS"  Press Keys  None  ARROW_DOWN
    Run Keyword If  "${t[0]}" == "PASS"  Press Keys  None  ENTER
    Click Element  id:aos_products_id_c
    Press Keys   None  ARROW_DOWN
    Press Keys   None  ENTER
    Input Text                       ${INPUT_EMAIL}    ${arg1[60]}
    Input Text                       ${INPUT_TELEFONE}    ${arg1[26]}

    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_OPERADORA}    ${temp}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_PLANO_ORIGEM}      ${temp}
    Set Focus To Element             ${BOTAO_SALVAR}
    Click Element                    ${BOTAO_SALVAR}
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword If  "${f[0]}" == "PASS"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60

    Wait Until Page Contains      Solicitação de Portabilidade » Solicitação
    Set Focus To Element             ${GRAU_DEPENDENCIA_COMPANHEIROA}
    Wait Until Element Is Visible    ${GRAU_DEPENDENCIA_COMPANHEIROA}


Cadastrou primeiro TITULAR
    [Arguments]  @{arg1}
    Wait Until Page Contains  Pessoa (Portabilidade) » Criar     timeout=${TIMEOUT}
    Set Focus To Element             ${SETA_PESSOA}
    Click Element                    ${SETA_PESSOA}
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Run Keyword If  '${tam}' == '3'   Switch Window  ${excludes[2]}
    Maximize Browser Window
    Sleep  10s
    Wait Until Element Is Visible    ${CRIAR_PESSOA}
    Set Focus To Element             ${CRIAR_PESSOA}
    Click Element                    ${CRIAR_PESSOA}
    Input Text                       ${INPUT_NOME_PESSOA}           ${arg1[48]}
    Sleep  5s
    Input Text                       ${INPUT_DATA_NASCIMENTO}       ${arg1[51]}
    Click Element                    ${INPUT_TIPO_PESSOA}
    Set Focus To Element             ${TIPO_PESSOA_TITULAR}
    Click Element                    ${TIPO_PESSOA_TITULAR}

    Input Text                       ${CPF_PESSOA}      ${arg1[47]}
    Click Element                    ${BOTAO_SALVAR_PESSOA}
    Click Element                    xpath://html/body/table[4]/tbody[2]/tr[1]/td[1]/a[contains(text(), '${arg1[48]}')]
    Sleep  10s
    ${excludes} =    Get Window Handles
    ${tam} =  Get Length    ${excludes}
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '1'   Switch Window  ${excludes[0]}
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    Set Focus To Element             ${INPUT_TIPO}
    Click Element                    ${INPUT_TIPO}
    Click Element                    ${TIPO_TITULAR}
    Click Element  id:aos_products_id_c
    Press Keys   None  ARROW_DOWN
    Press Keys   None  ENTER
    Input Text                       ${INPUT_EMAIL}    ${arg1[52]}
    Input Text                       ${INPUT_TELEFONE}    ${arg1[26]}

    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_OPERADORA}    ${temp}
    ${temp}         FakerLibrary.Random Number
    Input Text                       ${INPUT_REG_PLANO_ORIGEM}      ${temp}
    Set Focus To Element             ${BOTAO_SALVAR}
    Click Element                    ${BOTAO_SALVAR}
    ${f}  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword If  "${f[0]}" == "PASS"  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60

    Wait Until Page Contains      Solicitação de Portabilidade » Solicitação