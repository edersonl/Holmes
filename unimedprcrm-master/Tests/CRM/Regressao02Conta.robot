*** Settings ***
Resource    ../../main.resource
Default Tags    Passed
Suite Setup     Instancia Variaveis  02
Test Setup      Comum.Abrir Nav
Test Teardown   Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 10 - CONTAS - CADASTRAR UMA CONTA POTENCIAL PF COM DADOS OBRIGATÓRIOS (NOME DA CONTA)
    [Documentation]  CONTAS - TR010: CADASTRAR UMA CONTA POTENCIAL PF COM DADOS OBRIGATÓRIOS (NOME DA CONTA)									
    [Tags]    full    PF    OPOPOTENCIALPF22    OPOPF
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTEPOTENCIALPF10[0]}
        E        Preencher o campo "Nome da conta" com  ${CLIENTEPOTENCIALPF10[1]}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTEPOTENCIALPF10}

Teste de Regressão 11 - CONTAS - CADASTRAR UMA CONTA POTENCIAL PF COM TODOS OS DADOS
    [Documentation]  CONTAS - TR011: CADASTRAR UMA CONTA POTENCIAL PF COM TODOS OS DADOS									
    [Tags]    full    PF
     Dado        Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTEPOTENCIALPF11[0]}
        E        Preencher Todos os Campos de Pessoa Físca com  @{CLIENTEPOTENCIALPF11}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTEPOTENCIALPF11}

Teste de Regressão 12 - CONTAS - CADASTRAR UMA CONTA CLIENTE PF COM DADOS OBRIGATÓRIOS (NOME DA CONTA E CNPJ/CPF/CAEPF)
    [Documentation]  CONTAS - TR012: CADASTRAR UMA CONTA CLIENTE PF COM DADOS OBRIGATÓRIOS (NOME DA CONTA E CNPJ/CPF/CAEPF)																		
    [Tags]    full    PF
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTEPF12[0]}
        E        Preencher os campos "Nome da conta" e "CNPJ/CPF/CAEPF"  @{CLIENTEPF12}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTEPF12}
    
Teste de Regressão 13 - CONTAS - CADASTRAR UMA CONTA CLIENTE PF COM TODOS OS DADOS
    [Documentation]  CONTAS - TR013: CADASTRAR UMA CONTA POTENCIAL PF COM TODOS OS DADOS									
    [Tags]    full    PF
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTEPF13[0]}
        E        Preencher Todos os Campos de Pessoa Físca com  @{CLIENTEPF13}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTEPF13}																		
    
Teste de Regressão 14 - CONTAS - CADASTRAR UMA CONTA POTENCIAL PJ COM DADOS OBRIGATÓRIOS (NOME DA CONTA)
    [Documentation]  CONTAS - TR014: CADASTRAR UM POTENCIAL PJ COM DADOS OBRIGATORIOS (NOME DA CONTA E NOME)									
    [Tags]    full    PJ
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como   ${CLIENTEPOTENCIALPJ14[0]}
        E        Preencher o campo "Nome da conta" com  ${CLIENTEPOTENCIALPJ14[1]}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTEPOTENCIALPJ14}

Teste de Regressão 15 - CONTAS - CADASTRAR UMA CONTA POTENCIAL PJ COM TODOS OS DADOS
    [Documentation]  CONTAS - TR015: CADASTRAR UMA CONTA POTENCIAL PJ COM TODOS OS DADOS									
    [Tags]    full    PJ
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTEPOTENCIALPJ15[0]}
        E        Preencher Todos os Campos de Pessoa Jurídica com  @{CLIENTEPOTENCIALPJ15}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTEPOTENCIALPJ15}

Teste de Regressão 16 - CONTAS - CADASTRAR UMA CONTA CLIENTE PJ COM DADOS OBRIGATÓRIOS (NOME DA CONTA, RAZÃO SOCIAL E CNPJ/CPF/CAEPF)
    [Documentation]  CONTAS - TR016: CADASTRAR UM CLIENTE PJ COM DADOS OBRIGATORIOS (NOME DA CONTA, RAZÃO SOCIAL E CNPJ/CPF/CAEPF)									
    [Tags]    full    PJ    OPOCLIENTEPJ29
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTEPJ16[0]}
        E        Preencher os Campos Obrigatórios para Cliente PJ com  @{CLIENTEPJ16}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTEPJ16}

Teste de Regressão 17 - CONTAS - CADASTRAR UMA CONTA CLIENTE PJ COM TODOS OS DADOS
    [Documentation]  CONTAS - TR017: CADASTRAR UMA CONTA CLIENTE PJ COM TODOS OS DADOS									
    [Tags]    full    PJ
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTEPJ17[0]}
        E        Preencher Todos os Campos de Pessoa Jurídica com  @{CLIENTEPJ17}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTEPJ17}

Teste de Regressão 18 - CONTAS - CADASTRAR UMA CONTA POTENCIAL CAEPF COM DADOS OBRIGATÓRIOS (NOME DA CONTA)
    [Documentation]  CONTAS - TR018: CADASTRAR UMA CONTA POTENCIAL CAEPF COM DADOS OBRIGATÓRIOS (NOME DA CONTA)						
    [Tags]    full    CAEPF
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTEPOTENCIALCAEPF18[0]}
        E        Preencher o campo "Nome da conta" com  ${CLIENTEPOTENCIALCAEPF18[1]}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTEPOTENCIALCAEPF18}

Teste de Regressão 19 - CONTAS - CADASTRAR UMA CONTA POTENCIAL CAEPF COM TODOS OS DADOS
    [Documentation]  CONTAS - TR019: CADASTRAR UMA CONTA POTENCIAL CAEPF COM TODOS OS DADOS									
    [Tags]    full    CAEPF
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTEPOTENCIALCAEPF19[0]}
        E        Preencher Todos os Campos de Pessoa CAEPF com  @{CLIENTEPOTENCIALCAEPF19}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTEPOTENCIALCAEPF19}

Teste de Regressão 20 - CONTAS - CADASTRAR UMA CONTA CLIENTE CAEPF COM DADOS OBRIGATÓRIOS (NOME DA CONTA, RAZÃO SOCIAL, CNPJ/CPF/CAEPF E CPF RESPONSÁVEL(CAEPF))
    [Documentation]  CONTAS - TR020: CADASTRAR UMA CONTA CLIENTE CAEPF COM DADOS OBRIGATÓRIOS (NOME DA CONTA, RAZÃO SOCIAL, CNPJ/CPF/CAEPF E CPF RESPONSÁVEL(CAEPF))									
    [Tags]    full    CAEPF
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTECAEPF20[0]}
        E        Preencher os Campos Obrigatórios para Cliente CAEPF com  @{CLIENTECAEPF20}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTECAEPF20}

Teste de Regressão 21 - CONTAS - CADASTRAR UMA CONTA CLIENTE CAEPF COM TODOS OS DADOS
    [Documentation]  CONTAS - TR021: CADASTRAR UMA CONTA CLIENTE CAEPF COM TODOS OS DADOS									
    [Tags]    full    CAEPF
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Contas> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Contas
    Quando       Apertar o Botão Criar do Contas
        Então    Apresentar a Tela de Cadastro Contas
    Quando       Selecionar o tipo como  ${CLIENTECAEPF21[0]}
        E        Preencher Todos os Campos de Pessoa CAEPF com  @{CLIENTECAEPF21}
        E        Clicar no botão <SALVAR>
    Então        Apresentar a Tela de Detalhes do Conta com os dados  @{CLIENTECAEPF21}