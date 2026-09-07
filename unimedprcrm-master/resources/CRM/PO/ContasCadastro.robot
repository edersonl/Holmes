*** Settings ***
Library     SeleniumLibrary
Resource    ../../../main.resource
*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  10
${TITULO_CONTAS_CRIAR} =  xpath://*[@id="pagecontent"]/div[1]/h2
${CONTATIPOPESSOA} =  xpath://*[@id="account_type"]
${CONTANOMECONTA} =  xpath://*[@id="name"]
${BOTAO_SALVAR} =  xpath:/html/body/div[2]/div/div/form/table/tbody/tr/td[1]/div/input[1]
${CONTA_NOME_SOCIAL} =  xpath://input[@id="nome_social_c"]
${CONTA_GENERO SOCIAL} =  xpath://*[@id="genero_social_c"]
${CONTA_CPF_CNPJ_CAEPF} =  xpath://*[@id="cnpj_mf_c"]
${CONTA_EMAIL} =  xpath://*[@id="Accounts0emailAddress0"]
${CONTA_DATA_NASC} =  xpath://*[@id="data_nasc_c"]
${CONTA_SEXO} =  xpath://*[@id="sexo_c"]
${CONTA_NOME_MAE} =  xpath://*[@id="nome_mae_c"]
${CONTA_NOME_PAI} =  xpath://*[@id="nome_pai_c"]
${CONTA_ESTADO_CIVIL} =  xpath://*[@id="estado_civil_c"]
${CONTA_NATURALIDADE} =  xpath://*[@id="naturalidade_rel_c"]
${CONTA_RESULT_NATURALIDADE} =  xpath://*[@id="EditView_naturalidade_rel_c_results"]/div/div[2]/ul/li[1]
${CONTA_TIPO_TELEFONE} =  xpath://*[@id="registro_telefone_tel_tipo_aaaaa"]
${CONTA_NUMERO_CELULAR} =  xpath://*[@id="registro_telefone_name_aaaaa"]
${CONTA_CLASSE_TELEFONE} =  xpath://*[@id="registro_telefone_tel_classe_aaaaa"]
${CONTA_RAZAO_SOCIAL} =  xpath://*[@id="razao_social_c"]
${CONTA_PORTE_EMPRESA} =  xpath://*[@id="tipo_empresa_c"]
${CONTA_NATUREZA_JURIDICA} =  xpath://*[@id="natureza_juridica_c"]
${CONTA_INSCRICAO_ESTADUAL} =  xpath://*[@id="inscricao_estadual_c"]
${CONTA_INSCRICAO_MUNICIPAL} =  xpath://*[@id="inscricao_municipal_c"]
${CONTA_CPF_RESPONSAVEL} =  xpath://input[@id="cpf_responsavel_cei_c"]
${SALVAR_CONTA} =  xpath://*[@id="pagecontent"]/form/table/tbody/tr/td/table/tbody/tr[2]/td/table[2]/tbody/tr[1]/td/table/tbody/tr/td/input[2]

*** Keywords ***
Verificar Página Contas Criar
     Wait Until Element Contains  ${TITULO_CONTAS_CRIAR}   Contas » Criar   timeout=${TIMEOUT}

Colocar o Tipo no Cadastro Conta com
    [Arguments]  ${arg1}
    # Selecionar Tipo de Pessoa
    Wait Until Element Contains    ${CONTATIPOPESSOA}      ${arg1}
    Select From List By Label      ${CONTATIPOPESSOA}      ${arg1}

Preencher Nome da Conta com  
    [Arguments]  ${arg1}
    Sleep  5s
    Input Text  ${CONTANOMECONTA}  ${arg1}
    Sleep  ${SLEEP}

Preencher Nome Social com  
    [Arguments]  ${arg1}
    Input Text  ${CONTA_NOME_SOCIAL}  ${arg1}
    Sleep  ${SLEEP}

Colocar o Genero Social com
    [Arguments]  ${arg1}
    Select From List By Label  ${CONTA_GENERO SOCIAL}  ${arg1}

Preencher CNPJ/CPF/CAEPF com  
    [Arguments]  ${arg1}
    Input Text  ${CONTA_CPF_CNPJ_CAEPF}  ${arg1}
    Sleep  ${SLEEP}

Preencher Email com  
    [Arguments]  ${arg1}
    Input Text  ${CONTA_EMAIL}  ${arg1}
    Sleep  ${SLEEP}

Preencher Data de Nascimento com
    [Arguments]  ${arg1}
    Input Text  ${CONTA_DATA_NASC}  ${arg1}
    Sleep  ${SLEEP}

Colocar o Sexo com
    [Arguments]  ${arg1}
    Select From List By Label  ${CONTA_SEXO}  ${arg1}
    Sleep  ${SLEEP}

Preencher Nome da Mãe com  
    [Arguments]  ${arg1}
    Input Text  ${CONTA_NOME_MAE}   ${arg1}
    Sleep  ${SLEEP}

Preencher Nome da Pai com
    [Arguments]  ${arg1}
    Input Text  ${CONTA_NOME_PAI}  ${arg1}
    Sleep  ${SLEEP}

Colocar o Estado Civil com
    [Arguments]  ${arg1}
    Select From List By Label  ${CONTA_ESTADO_CIVIL}  ${arg1}

Preencher Naturalidade com  
    [Arguments]  ${arg1}
    Sleep  3s
    Input Text  ${CONTA_NATURALIDADE}  ${arg1}
    Press Keys    ${CONTA_NATURALIDADE}    ENTER
    # Wait Until Element Is Visible  ${CONTA_RESULT_NATURALIDADE}  timeout=${TIMEOUT}
    # Click Element  ${CONTA_RESULT_NATURALIDADE}

Colocar o Tipo Telefone com
    [Arguments]  ${arg1}
    Select From List By Label  ${CONTA_TIPO_TELEFONE}  ${arg1}

Preencher Número Telefone com  
    [Arguments]  ${arg1}
    Input Text  ${CONTA_NUMERO_CELULAR}  ${arg1}
    Sleep  ${SLEEP}

Colocar Classe Telefone com  
    [Arguments]  ${arg1}
    Select From List By Label  ${CONTA_CLASSE_TELEFONE}  ${arg1}
    Sleep  ${SLEEP}
    
Preencher Razão Social com  
    [Arguments]  ${arg1}
    Input Text  ${CONTA_RAZAO_SOCIAL}  ${arg1}
    Sleep  ${SLEEP}

Colocar Porte da Empresa com
    [Arguments]  ${arg1}
    Select From List By Label  ${CONTA_PORTE_EMPRESA}  ${arg1}
    Sleep  ${SLEEP}

Colocar Natureza Jurídica com
    [Arguments]  ${arg1}
    Select From List By Label  ${CONTA_NATUREZA_JURIDICA}  ${arg1}
    Sleep  ${SLEEP}

Preencher Inscrição Estadual com  
    [Arguments]  ${arg1}
    Input Text  ${CONTA_INSCRICAO_ESTADUAL}  ${arg1}
    Sleep  ${SLEEP}

Preencher Inscrição Municipal com  
    [Arguments]  ${arg1}
    Input Text  ${CONTA_INSCRICAO_MUNICIPAL}  ${arg1}
    Sleep  ${SLEEP}

Preencher CPF do Responsável com  
    [Arguments]  ${arg1}
    Wait Until Element Is Visible  ${CONTA_CPF_RESPONSAVEL}  timeout=${TIMEOUT}
    Input Text  ${CONTA_CPF_RESPONSAVEL}  ${arg1}
    Sleep  ${SLEEP}

Apertar Botão Salvar Contas
    Wait Until Element Is Visible  ${BOTAO_SALVAR}  timeout=${TIMEOUT}
    Mouse Over  ${BOTAO_SALVAR}
    Click Element  ${BOTAO_SALVAR}

    ${r}  Run Keyword And Ignore Error   Wait Until Page Contains    O CNPJ/MF/CPF/CAEPF já foi preenchido, você deseja juntar as duas contas?
    Run Keyword If  "${r[0]}" == "PASS"  Set Focus To Element  ${BOTAO_SIM_FINALIZAR_PROTOCOLO}
    Run Keyword If  "${r[0]}" == "PASS"  Click Element  ${BOTAO_SIM_FINALIZAR_PROTOCOLO}
    
    ${q}  Run Keyword And Ignore Error   Wait Until Page Contains    A conta que está prestes a criar talvez esteja duplicada com outra conta que já existe.     timeout=${TIMEOUT}
    Run Keyword If  "${q[0]}" == "PASS"  Set Focus To Element  ${SALVAR_CONTA}
    Run Keyword If  "${q[0]}" == "PASS"  Click Element  ${SALVAR_CONTA}