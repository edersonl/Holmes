*** Settings ***
Resource    ../../main.resource
# Resource     ../../resources/CRM/data/Massa03Oportunidades.robot
# Default Tags    Passed
Suite Setup     Instancia Variaveis  03
Test Setup      Comum.Abrir Nav
Test Teardown   Comum.Fechar Nav

*** Test Cases ***
Teste de Regressão 22 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL PF
    [Documentation]  OPORTUNIDADES - TR022: CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR010
    [Tags]    Opo    PF    full    OPOPOTENCIALPF22    OPOPF
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{OPOPOTENCIALPF22}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOPOTENCIALPF22}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOPOTENCIALPF22[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALPF22[5]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALPF22[1]}

Teste de Regressão 23 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE PF
    [Documentation]  OPORTUNIDADES - TR023: CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE PF
    ...              DEPENDENCIA DO CONTAS - TR012
    [Tags]    Opo    PF    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por  @{OPOCLIENTEPF23}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOCLIENTEPF23}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOCLIENTEPF23[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOCLIENTEPF23[4]}   ${OPOCLIENTEPF23[5]}
        E        Preencher o campo Origem de Vida com  ${OPOCLIENTEPF23[7]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOCLIENTEPF23[1]}

Teste de Regressão 24 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE PELO DETALHES DE UM POTENCIAL CLIENTE PF CADASTRADOs
    [Documentation]  OPORTUNIDADES - TR024: CADASTRAR UMA OPORTUNIDADE PELO DETALHES DE UM POTENCIAL CLIENTE PF CADASTRADO
    ...              DEPENDENCIA DO CONTAS - TR010
    [Tags]    Opo    PF    full    OPOPOTENCIALPF24
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{OPOPOTENCIALPF24}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{OPOPOTENCIALPF24}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{OPOPOTENCIALPF24}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOPOTENCIALPF24[4]}  ${OPOPOTENCIALPF24[8]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALPF24[10]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALPF24[1]}

Teste de Regressão 25 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL PJ, MENOR QUE 30 VIDAS
    [Documentation]  OPORTUNIDADES - TR025: CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL PJ, MENOR QUE 30 VIDAS
    ...              DEPENDENCIA DO CONTAS - TR014
    [Tags]    Opo    PJ    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{OPOPOTENCIALPJ25}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOPOTENCIALPJ25}		
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOPOTENCIALPJ25[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOPOTENCIALPJ25[2]}  ${OPOPOTENCIALPJ25[3]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALPJ25[5]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALPJ25[1]}

Teste de Regressão 26 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE PJ, MENOR QUE 30 VIDAS
    [Documentation]  OPORTUNIDADES - TR026: CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE PJ, MENOR QUE 30 VIDAS
    ...              DEPENDENCIA DO CONTAS - TR016
    [Tags]    Opo    PJ    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por  @{OPOCLIENTEPJ26}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOCLIENTEPJ26}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOCLIENTEPJ26[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com   ${OPOCLIENTEPJ26[4]}   ${OPOCLIENTEPJ26[5]}
        E        Preencher o campo Origem de Vida com  ${OPOCLIENTEPJ26[7]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOCLIENTEPJ26[1]}

Teste de Regressão 27 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE PJ, MENOR QUE 30 VIDAS
    [Documentation]  OPORTUNIDADES - TR027: CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE PJ, MENOR QUE 30 VIDAS
    ...              DEPENDENCIA DO CONTAS - TR008
    [Tags]    Opo    PJ    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{OPOPOTENCIALPJ27}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{OPOPOTENCIALPJ27}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{OPOPOTENCIALPJ27}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com   ${OPOPOTENCIALPJ27[4]}   ${OPOPOTENCIALPJ27[13]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALPJ27[15]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALPJ27[1]}


Teste de Regressão 28 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL PJ, COM 30 VIDAS
    [Documentation]  OPORTUNIDADES - TR028: CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL PJ, COM 30 VIDAS
    ...              DEPENDENCIA DO CONTAS - TR014
    [Tags]    Opo    PJ    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{OPOPOTENCIALPJ28}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOPOTENCIALPJ28}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta		
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOPOTENCIALPJ28[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOPOTENCIALPJ28[2]}  ${OPOPOTENCIALPJ28[3]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALPJ28[5]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALPJ28[1]}

Teste de Regressão 29 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE PJ, COM 30 VIDAS
    [Documentation]  OPORTUNIDADES - TR029: CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE PJ, COM 30 VIDAS
    ...              DEPENDENCIA DO CONTAS - TR016
    [Tags]    Opo    PJ    full  OPOCLIENTEPJ29
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por  @{OPOCLIENTEPJ29}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOCLIENTEPJ29}		
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOCLIENTEPJ29[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOCLIENTEPJ29[4]}  ${OPOCLIENTEPJ29[5]}
        E        Preencher o campo Origem de Vida com  ${OPOCLIENTEPJ29[7]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOCLIENTEPJ29[1]}

Teste de Regressão 30 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE PJ, COM 30 VIDAS
    [Documentation]  OPORTUNIDADES - TR030: CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE PJ, COM 30 VIDAS
    ...              DEPENDENCIA DO CONTAS - TR008
    [Tags]    Opo    PJ    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{OPOPOTENCIALPJ30}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{OPOPOTENCIALPJ30}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{OPOPOTENCIALPJ30}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com   ${OPOPOTENCIALPJ30[4]}   ${OPOPOTENCIALPJ30[13]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALPJ30[15]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALPJ30[1]}

Teste de Regressão 31 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL PJ, MAIOR QUE 30 VIDAS
    [Documentation]  OPORTUNIDADES - TR031: CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL PJ, MAIOR QUE 30 VIDAS
    ...              DEPENDENCIA DO CONTAS - TR014
    [Tags]    Opo    PJ    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{OPOPOTENCIALPJ31}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOPOTENCIALPJ31}		
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOPOTENCIALPJ31[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOPOTENCIALPJ31[2]}  ${OPOPOTENCIALPJ31[3]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALPJ31[5]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALPJ31[1]}

Teste de Regressão 32 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE PJ, MAIOR QUE 30 VIDAS
    [Documentation]  OPORTUNIDADES - TR032: CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE PJ, MAIOR QUE 30 VIDAS
    ...              DEPENDENCIA DO CONTAS - TR016
    [Tags]    Opo    PJ    full    OPOCLIENTEPJ32
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por  @{OPOCLIENTEPJ32}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOCLIENTEPJ32}		
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOCLIENTEPJ32[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOCLIENTEPJ32[4]}  ${OPOCLIENTEPJ32[5]}
        E        Preencher o campo Origem de Vida com  ${OPOCLIENTEPJ32[7]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOCLIENTEPJ32[1]}

Teste de Regressão 33 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE PJ, MAIOR QUE 30 VIDAS
    [Documentation]  OPORTUNIDADES - TR033: CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE PJ, MAIOR QUE 30 VIDAS
    ...              DEPENDENCIA DO CONTAS - TR014
    [Tags]    Opo    PJ    full    OPOPOTENCIALPJ33
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{OPOPOTENCIALPJ33}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{OPOPOTENCIALPJ33}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOPOTENCIALPJ33[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com   ${OPOPOTENCIALPJ33[4]}   ${OPOPOTENCIALPJ33[13]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALPJ33[15]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALPJ33[1]}

Teste de Regressão 34 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL CAEPF
    [Documentation]  OPORTUNIDADES - TR034: CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL CAEPF
    ...              DEPENDENCIA DO CONTAS - TR020
    [Tags]    Opo    CAEPF    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{OPOPOTENCIALCAEPF34}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOPOTENCIALCAEPF34}		
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOPOTENCIALCAEPF34[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com    ${OPOPOTENCIALCAEPF34[2]}    ${OPOPOTENCIALCAEPF34[3]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALCAEPF34[5]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALCAEPF34[1]}

Teste de Regressão 35 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE CAEPF
    [Documentation]  OPORTUNIDADES - TR035: CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE CAEPF
    ...              DEPENDENCIA DO CONTAS - TR020
    [Tags]    Opo    CAEPF    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por  @{OPOCLIENTECAEPF35}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOCLIENTECAEPF35}		
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOCLIENTECAEPF35[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOCLIENTECAEPF35[5]}  ${OPOCLIENTECAEPF35[6]}
        E        Preencher o campo Origem de Vida com  ${OPOCLIENTECAEPF35[8]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOCLIENTECAEPF35[1]}

Teste de Regressão 36 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL CAEPF COM MAIOR QUE 30 VIDAS
    [Documentation]  OPORTUNIDADES - TR036: CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL CAEPF COM MAIOR QUE 30 VIDAS
    ...              DEPENDENCIA DO POTENCIAL - TR009
    [Tags]    Opo    CAEPF    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{OPOPOTENCIALCAEPF36}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{OPOPOTENCIALCAEPF36}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOPOTENCIALCAEPF36[2]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com   ${OPOPOTENCIALCAEPF36[4]}   ${OPOPOTENCIALCAEPF36[9]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALCAEPF36[11]}
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALCAEPF36[2]}

Teste de Regressão 37 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE PF, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    [Documentation]  OPORTUNIDADES - TR037: CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE PF, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    ...              DEPENDENCIA DO CONTAS - TR012
    [Tags]    Opo    PF    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por  @{OPOCLIENTEPF37}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOCLIENTEPF37}		
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOCLIENTEPF37[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOCLIENTEPF37[4]}  ${OPOCLIENTEPF37[5]}
        E        Preencher o campo Origem de Vida com  ${OPOCLIENTEPF37[7]}
        E        Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOCLIENTEPF37[1]}

Teste de Regressão 38 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE PF, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    [Documentation]  OPORTUNIDADES - TR038: CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE PF, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    ...              DEPENDENCIA DO CONTAS - TR016
    [Tags]    Opo    PF    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{OPOCLIENTEPF38}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{OPOCLIENTEPF38}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{OPOCLIENTEPF38}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com   ${OPOCLIENTEPF38[4]}   ${OPOCLIENTEPF38[8]}
        E        Preencher o campo Origem de Vida com  ${OPOCLIENTEPF38[10]}
        E        Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOCLIENTEPF38[1]}


Teste de Regressão 39 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL CLIENTE PJ, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    [Documentation]  OPORTUNIDADES - TR039: CADASTRAR UMA OPORTUNIDADE VIA CONTA POTENCIAL CLIENTE PJ, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    ...              DEPENDENCIA DO CONTAS - TR014
    [Tags]    Opo    PJ    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{OPOPOTENCIALPJ39}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOPOTENCIALPJ39}		
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOPOTENCIALPJ39[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALPJ39[5]}
        E        Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALPJ39[1]}

Teste de Regressão 40 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE PJ, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    [Documentation]  OPORTUNIDADES - TR040: CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE PJ, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    ...              DEPENDENCIA DO POTENCIAL - TR008
    [Tags]    Opo    PJ    full    OPOPOTENCIALPJ40
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{OPOPOTENCIALPJ40}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{OPOPOTENCIALPJ40}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente CNPJ  ${OPOPOTENCIALPJ40[1]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com   ${OPOPOTENCIALPJ40[4]}   ${OPOPOTENCIALPJ40[13]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALPJ40[15]}
        E        Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALPJ40[1]}

Teste de Regressão 41 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE CAEPF, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    [Documentation]  OPORTUNIDADES - TR041: CADASTRAR UMA OPORTUNIDADE VIA CONTA CLIENTE CAEPF, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    ...              DEPENDENCIA DO CONTAS - TR020
    [Tags]    Opo    CAEPF    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por  @{OPOPOTENCIALCAEPF41}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{OPOPOTENCIALCAEPF41}		
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{OPOPOTENCIALCAEPF41}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${OPOPOTENCIALCAEPF41[5]}  ${OPOPOTENCIALCAEPF41[6]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALCAEPF41[8]}
        E        Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALCAEPF41[1]}

Teste de Regressão 42 - OPORTUNIDADES - CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE CAEPF, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    [Documentation]  OPORTUNIDADES - TR036: CADASTRAR UMA OPORTUNIDADE VIA POTENCIAL CLIENTE CAEPF, COM DEMOSTROU INTERESSE EM PF E PJ SELECIONADO
    ...              DEPENDENCIA DO POTENCIAL - TR009
    [Tags]    Opo    CAEPF    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{OPOPOTENCIALCAEPF42}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{OPOPOTENCIALCAEPF42}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${OPOPOTENCIALCAEPF42[2]}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com   ${OPOPOTENCIALCAEPF42[4]}   ${OPOPOTENCIALCAEPF42[9]}
        E        Preencher o campo Origem de Vida com  ${OPOPOTENCIALCAEPF42[11]}
        E        Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
        E        Clicar no Botão Salvar Oportunidade
    Então        Apresentar a tela Oportunidade »  ${OPOPOTENCIALCAEPF42[2]}