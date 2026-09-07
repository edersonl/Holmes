*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   16
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav

*** Variables ***


*** Test Cases ***
Teste de Regressão 01 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PF), SEM PORTABILIDADE
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR001: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PF), SEM PORTABILIDADE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), sem Beneficiários  @{INTEGMOVINCLUSAOCRMPF01}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS  @{INTEGMOVINCLUSAOCRMPF01}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE   @{INTEGMOVINCLUSAOCRMPF01}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS    @{INTEGMOVINCLUSAOCRMPF01}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS   @{INTEGMOVINCLUSAOCRMPF01}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMPF01}
    E        Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)  @{INTEGMOVINCLUSAOCRMPF01}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMPF01}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMPF01[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 4 Vidas)    @{INTEGMOVINCLUSAOCRMPF01}


Teste de Regressão 02 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PF), COM PORTABILIDADE
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR002: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PF), COM PORTABILIDADE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), sem Beneficiários  @{INTEGMOVINCLUSAOCRMPF02}
    E        Gerou uma Solicitação de Portabilidade  @{INTEGMOVINCLUSAOCRMPF02}
    E        Cadastrou duas Pessoas Titular e Conjuge    @{INTEGMOVINCLUSAOCRMPF02}
    E        Finalizou a Portabilidade com Titular Aprovado Total e Dependente Aprovado Parcial  @{INTEGMOVINCLUSAOCRMPF02}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS  @{INTEGMOVINCLUSAOCRMPF02}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE   @{INTEGMOVINCLUSAOCRMPF02}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS    @{INTEGMOVINCLUSAOCRMPF02}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS   @{INTEGMOVINCLUSAOCRMPF02}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMPF02}
    E        Validar que a coluna "Data Base Carência" foi preenchida da seguinte forma: Titular foi preenchido com a "Data Inicio Vigência" - 301 dias, Conjuge com a coluna "Data Base Carência" vazia, Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  @{INTEGMOVINCLUSAOCRMPF02}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	  @{INTEGMOVINCLUSAOCRMPF02}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMPF02[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Portabilidade - 4 Vidas)    @{INTEGMOVINCLUSAOCRMPF02}


Teste de Regressão 03 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ ADESÃO), SEM PORTABILIDADE
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR003: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ ADESÃO), SEM PORTABILIDADE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários  @{INTEGMOVINCLUSAOCRMPJ03}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS (COLETIVO POR ADESÃO)  @{INTEGMOVINCLUSAOCRMPJ03}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (COLETIVO POR ADESÃO)    @{INTEGMOVINCLUSAOCRMPJ03}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS (COLETIVO POR ADESÃO)    @{INTEGMOVINCLUSAOCRMPJ03}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS (COLETIVO POR ADESÃO)   @{INTEGMOVINCLUSAOCRMPJ03}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMPJ03}
    E        Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)  @{INTEGMOVINCLUSAOCRMPJ03}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMPJ03}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMPJ03[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 4 Vidas)    @{INTEGMOVINCLUSAOCRMPJ03}



 04 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ ADESÃO), COM PORTABILIDADE
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR004: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ ADESÃO), COM PORTABILIDADE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários  @{INTEGMOVINCLUSAOCRMPJ04}
    E        Gerou uma Solicitação de Portabilidade  @{INTEGMOVINCLUSAOCRMPJ04}
    E        Cadastrou duas Pessoas Titular e Conjuge    @{INTEGMOVINCLUSAOCRMPJ04}
    E        Finalizou a Portabilidade com Titular Aprovado Parcial e Dependente Aprovado Total  @{INTEGMOVINCLUSAOCRMPJ04}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS (Primeira Familia)  @{INTEGMOVINCLUSAOCRMPJ04}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Primeira Familia)   @{INTEGMOVINCLUSAOCRMPJ04}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS (Primeira Familia)    @{INTEGMOVINCLUSAOCRMPJ04}
    E        Cadastrou 1 (UM) Beneficiário TITULAR, sem Portabilidade, com "Início vigência" igual a EM 24 HORAS (Segunda Familia)  @{INTEGMOVINCLUSAOCRMPJ04}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, sem Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Segunda Familia)   @{INTEGMOVINCLUSAOCRMPJ04}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS (Segunda Familia)   @{INTEGMOVINCLUSAOCRMPJ04}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMPJ04}
    E        Validar que a coluna "Data Base Carência" foi preenchida da seguinte forma: Titular foi preenchido com a "Data Inicio Vigência" - 301 dias, Conjuge com a coluna "Data Base Carência" vazia, Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  @{INTEGMOVINCLUSAOCRMPJ04}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMPJ04}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMPJ04[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação - 6 Vidas)    @{INTEGMOVINCLUSAOCRMPJ04}


Teste de Regressão 05 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), SEM PORTABILIDADE
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR005: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), SEM PORTABILIDADE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários  @{INTEGMOVINCLUSAOCRMCAEPF05}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS  @{INTEGMOVINCLUSAOCRMCAEPF05}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE   @{INTEGMOVINCLUSAOCRMCAEPF05}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS    @{INTEGMOVINCLUSAOCRMCAEPF05}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS   @{INTEGMOVINCLUSAOCRMCAEPF05}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMCAEPF05}
    E        Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)  @{INTEGMOVINCLUSAOCRMCAEPF05}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMCAEPF05}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMCAEPF05[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 4 Vidas)    @{INTEGMOVINCLUSAOCRMCAEPF05}


Teste de Regressão 06 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), COM PORTABILIDADE
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR006: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), COM PORTABILIDADE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários  @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Gerou uma Solicitação de Portabilidade  @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Cadastrou duas Pessoas Titular e Conjuge    @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Finalizou a Portabilidade com Titular Aprovado Parcial e Dependente Aprovado Total  @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS (Primeira Familia)  @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Primeira Familia)   @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS (Primeira Familia)    @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Cadastrou 1 (UM) Beneficiário TITULAR, sem Portabilidade, com "Início vigência" igual a EM 24 HORAS (Segunda Familia)  @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, sem Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Segunda Familia)   @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS (Segunda Familia)   @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Validar que a coluna "Data Base Carência" foi preenchida da seguinte forma: Titular foi preenchido com a "Data Inicio Vigência" - 301 dias, Conjuge com a coluna "Data Base Carência" vazia, Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"  @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMCAEPF06}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMCAEPF06[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação - 6 Vidas)    @{INTEGMOVINCLUSAOCRMCAEPF06}


Teste de Regressão 07 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), SEM PORTABILIDADE, SEM PARAMETRO DE CARÊNCIA
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR007: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), SEM PORTABILIDADE, SEM PARAMETRO DE CARÊNCIA
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INTEGMOVINCLUSAOCRMPJ07}
    E        Editou o Contrato, desmarcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS  @{INTEGMOVINCLUSAOCRMPJ07}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE   @{INTEGMOVINCLUSAOCRMPJ07}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS    @{INTEGMOVINCLUSAOCRMPJ07}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS   @{INTEGMOVINCLUSAOCRMPJ07}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMPJ07}
    E        Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)  @{INTEGMOVINCLUSAOCRMPJ07}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência  @{INTEGMOVINCLUSAOCRMPJ07}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMPJ07[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 4 Vidas)    @{INTEGMOVINCLUSAOCRMPJ07}


Teste de Regressão 08 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM PORTABILIDADE, SEM PARAMETRO DE CARÊNCIA
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR008: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM PORTABILIDADE, SEM PARAMETRO DE CARÊNCIA
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INTEGMOVINCLUSAOCRMPJ08}
    E        Editou o Contrato, desmarcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    E        Gerou uma Solicitação de Portabilidade  @{INTEGMOVINCLUSAOCRMPJ08}
    E        Cadastrou duas Pessoas Titular e Conjuge    @{INTEGMOVINCLUSAOCRMPJ08}
    E        Finalizou a Portabilidade com Titular Aprovado Parcial e Dependente Aprovado Total  @{INTEGMOVINCLUSAOCRMPJ08}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS (Primeira Familia)  @{INTEGMOVINCLUSAOCRMPJ08}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Primeira Familia)   @{INTEGMOVINCLUSAOCRMPJ08}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS (Primeira Familia)    @{INTEGMOVINCLUSAOCRMPJ08}
    E        Cadastrou 1 (UM) Beneficiário TITULAR, sem Portabilidade, com "Início vigência" igual a EM 24 HORAS (Segunda Familia)  @{INTEGMOVINCLUSAOCRMPJ08}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, sem Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Segunda Familia)   @{INTEGMOVINCLUSAOCRMPJ08}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS (Segunda Familia)   @{INTEGMOVINCLUSAOCRMPJ08}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMPJ08}
    E        Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)  @{INTEGMOVINCLUSAOCRMPJ08}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMPJ08}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMPJ08[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação - 6 Vidas)    @{INTEGMOVINCLUSAOCRMPJ08}


Teste de Regressão 09 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), SEM PORTABILIDADE, SEM PARAMETRO DE CARÊNCIA
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR009: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), SEM PORTABILIDADE, SEM PARAMETRO DE CARÊNCIA
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INTEGMOVINCLUSAOCRMCAEPF09}
    E        Editou o Contrato, desmarcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS  @{INTEGMOVINCLUSAOCRMCAEPF09}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE   @{INTEGMOVINCLUSAOCRMCAEPF09}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS    @{INTEGMOVINCLUSAOCRMCAEPF09}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS   @{INTEGMOVINCLUSAOCRMCAEPF09}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMCAEPF09}
    E        Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)  @{INTEGMOVINCLUSAOCRMCAEPF09}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMCAEPF09}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMCAEPF09[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 4 Vidas)    @{INTEGMOVINCLUSAOCRMCAEPF09}


Teste de Regressão 10 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), COM PORTABILIDADE, SEM PARAMETRO DE CARÊNCIA
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR010: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), COM PORTABILIDADE, SEM PARAMETRO DE CARÊNCIA
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Editou o Contrato, desmarcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    E        Gerou uma Solicitação de Portabilidade  @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Cadastrou duas Pessoas Titular e Conjuge    @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Finalizou a Portabilidade com Titular Aprovado Parcial e Dependente Aprovado Total  @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS (Primeira Familia)  @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Primeira Familia)   @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS (Primeira Familia)    @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Cadastrou 1 (UM) Beneficiário TITULAR, sem Portabilidade, com "Início vigência" igual a EM 24 HORAS (Segunda Familia)  @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, sem Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Segunda Familia)   @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS (Segunda Familia)   @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)  @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMCAEPF10}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMCAEPF10[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação - 6 Vidas)    @{INTEGMOVINCLUSAOCRMCAEPF10}


Teste de Regressão 11 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM PARAMETRO BENEFICIÁRIOS - INCLUSÕES SEM CARÊNCIA IGUAL A SIM
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR011: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM PARAMETRO BENEFICIÁRIOS - INCLUSÕES SEM CARÊNCIA IGUAL A SIM
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INTEGMOVINCLUSAOCRMPJ11}
    E        Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" igual a SIM
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS  @{INTEGMOVINCLUSAOCRMPJ11}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE   @{INTEGMOVINCLUSAOCRMPJ11}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS    @{INTEGMOVINCLUSAOCRMPJ11}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS   @{INTEGMOVINCLUSAOCRMPJ11}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMPJ11}
    E        Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)  @{INTEGMOVINCLUSAOCRMPJ11}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMPJ11}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMPJ11[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 4 Vidas)    @{INTEGMOVINCLUSAOCRMPJ11}


Teste de Regressão 12 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF EMPRESARIAL), COM PARAMETRO BENEFICIÁRIOS - INCLUSÕES SEM CARÊNCIA IGUAL A SIM
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR012: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF EMPRESARIAL), COM PARAMETRO BENEFICIÁRIOS - INCLUSÕES SEM CARÊNCIA IGUAL A SIM
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INTEGMOVINCLUSAOCRMCAEPF12}
    E        Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" igual a SIM
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS  @{INTEGMOVINCLUSAOCRMCAEPF12}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE   @{INTEGMOVINCLUSAOCRMCAEPF12}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS    @{INTEGMOVINCLUSAOCRMCAEPF12}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS   @{INTEGMOVINCLUSAOCRMCAEPF12}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMCAEPF12}
    E        Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)  @{INTEGMOVINCLUSAOCRMCAEPF12}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMCAEPF12}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMCAEPF12[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 4 Vidas)    @{INTEGMOVINCLUSAOCRMCAEPF12}


Teste de Regressão 13 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), SEM PORTABILIDADE, COM TITULAR E DEPENDENTES NA MESMA MOVIMENTAÇÃO
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR013: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), SEM PORTABILIDADE, COM TITULAR E DEPENDENTES NA MESMA MOVIMENTAÇÃO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INTEGMOVINCLUSAOCRMPJ13}
    E        Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" VAZIO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou os seguintes Beneficiários:
    E        Titular com "Data Admissão Empresa" menor que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMPJ13}
        E    Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular menor que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMPJ13}
    E        Titular com "Data Admissão Empresa" igual a 10 dias da data atual  @{INTEGMOVINCLUSAOCRMPJ13}
        E    Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular igual a 10 dias da data atual "Data Base de Carência" igual a Data Início Vigência – 301 Dias  @{INTEGMOVINCLUSAOCRMPJ13}
    E        Titular com "Data Admissão Empresa" maior que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMPJ13}
        E    Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular maior que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMPJ13}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMPJ13}
    E        Validar que a coluna "Data Base Carência" foi preenchido da seguinte forma: (9 Vidas)
    E        Titular com "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  @{INTEGMOVINCLUSAOCRMPJ13}
    E        Dependente com "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  @{INTEGMOVINCLUSAOCRMPJ13}
    E        Titular com "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  @{INTEGMOVINCLUSAOCRMPJ13}
    E        Dependente com "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  @{INTEGMOVINCLUSAOCRMPJ13}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMPJ13}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMPJ13[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 9 Vidas)    @{INTEGMOVINCLUSAOCRMPJ13}


Teste de Regressão 14 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), SEM PORTABILIDADE, COM TITULAR INTEGRADO NO CONTRATO
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR014: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), SEM PORTABILIDADE, COM TITULAR INTEGRADO NO CONTRATO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com um Beneficiário TITULAR  @{INTEGMOVINCLUSAOCRMPJ14}
    E        Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" igual a NÃO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou os seguintes Beneficiários:
    E        Dependente Conjuge com "Data Certidão de Casamento" maior que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMPJ14}
    E        Dependente Filho com "Data de Nascimento" igual a 10 dias da data atual  @{INTEGMOVINCLUSAOCRMPJ14}
    E        Dependente Filho Adotivo com "Data da Adoção" menor que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMPJ14}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMPJ14}
    E        Validar que a coluna "Data Base Carência" foi preenchido da seguinte forma: (3 Vidas)
    E        Se "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias  @{INTEGMOVINCLUSAOCRMPJ14}
    E        Se "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência  @{INTEGMOVINCLUSAOCRMPJ14}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMPJ14}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMPJ14[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 4 Vidas)    @{INTEGMOVINCLUSAOCRMPJ14}


Teste de Regressão 15 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), SEM PORTABILIDADE, COM TITULAR INTEGRADO EM OUTRA MOV
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR015: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), SEM PORTABILIDADE, COM TITULAR INTEGRADO EM OUTRA MOV
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INTEGMOVINCLUSAOCRMPJ15}
    E        Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" igual a NÃO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
    E        Realizou a integração de uma Movimentação Cadastral de Inclusão de Beneficiário, com um Titular  @{INTEGMOVINCLUSAOCRMPJ15}
    E        Executou as querys para alterar as datas de criação da Movimentação e Titular
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou os seguintes Beneficiários:
    E        Dependente Filho com "Data Admissão Empresa" a menos 9 dias da data atual e "Data de Vinculo" igual a menos 31 dias da data atual  @{INTEGMOVINCLUSAOCRMPJ15}
    E        Dependente Filho Adotivo com "Data Admissão Empresa" a menos 10 dias da data atual e "Data de Vinculo" igual a menos 30 dias da data atual  @{INTEGMOVINCLUSAOCRMPJ15}
    E        Dependente Conjuge com "Data Admissão Empresa" a menos 11 dias da data atual e "Data de Vinculo" igual a menos 30 dias da data atual   @{INTEGMOVINCLUSAOCRMPJ15}
    E        Dependente Filho com "Data Admissão Empresa" a menos 10 dias da data atual e "Data de Vinculo" igual a menos 29 dias da data atual   @{INTEGMOVINCLUSAOCRMPJ15}
    E        Dependente Conjuge com "Data Admissão Empresa" a menos 20 dias da data atual e "Data de Vinculo" igual a menos 29 dias da data atual   @{INTEGMOVINCLUSAOCRMPJ15}
    E        Dependente Filho com "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 19 dias da data atual   @{INTEGMOVINCLUSAOCRMPJ15}
    E        Dependente Filho Adotivo com "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 20 dias da data atual   @{INTEGMOVINCLUSAOCRMPJ15}
    E        Dependente Conjuge com "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 21 dias da data atual   @{INTEGMOVINCLUSAOCRMPJ15}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMPJ14}
    E        Validar que a coluna "Data Base Carência" foi preenchido da seguinte forma: (8 Vidas)
    E        Dependente Filho com Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMPJ14}
    E        Dependente Filho adotivo com Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMPJ14}
    E        Dependente Conjuge com Data Base Carencia igual a Data de vigência    @{INTEGMOVINCLUSAOCRMPJ14}
    E        Dependente Filho adotivo com Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMPJ14}
    E        Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMPJ14}
    E        Dependente Filho com Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMPJ14}
    E        Dependente Filho adotivo com Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMPJ14}
    E        Dependente Conjuge com Data Base Carencia igual a Data de vigência     @{INTEGMOVINCLUSAOCRMPJ14}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência    @{INTEGMOVINCLUSAOCRMPJ14}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMPJ14[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 8 Vidas)    @{INTEGMOVINCLUSAOCRMPJ14}


Teste de Regressão 16 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), SEM PORTABILIDADE, COM TITULAR E DEPENDENTES NA MESMA MOVIMENTAÇÃO
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR016: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), SEM PORTABILIDADE, COM TITULAR E DEPENDENTES NA MESMA MOVIMENTAÇÃO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INTEGMOVINCLUSAOCRMCAEPF16}
    E        Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" VAZIO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou os seguintes Beneficiários:
    E        Titular com "Data Admissão Empresa" menor que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMCAEPF16}
        E    Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular menor que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMCAEPF16}
    E        Titular com "Data Admissão Empresa" igual a 10 dias da data atual  @{INTEGMOVINCLUSAOCRMCAEPF16}
        E    Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular igual a 10 dias da data atual "Data Base de Carência" igual a Data Início Vigência – 301 Dias  @{INTEGMOVINCLUSAOCRMCAEPF16}
    E        Titular com "Data Admissão Empresa" maior que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMCAEPF16}
        E    Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular maior que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMCAEPF16}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMCAEPF16}
    E        Validar que a coluna "Data Base Carência" foi preenchido da seguinte forma: (9 Vidas)
    E        Titular com "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  @{INTEGMOVINCLUSAOCRMCAEPF16}
    E        Dependente com "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA  @{INTEGMOVINCLUSAOCRMCAEPF16}
    E        Titular com "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  @{INTEGMOVINCLUSAOCRMCAEPF16}
    E        Dependente com "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA  @{INTEGMOVINCLUSAOCRMCAEPF16}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMCAEPF16}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMCAEPF16[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 9 Vidas)    @{INTEGMOVINCLUSAOCRMCAEPF16}


Teste de Regressão 17 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), SEM PORTABILIDADE, COM TITULAR INTEGRADO NO CONTRATO
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR017: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), SEM PORTABILIDADE, COM TITULAR INTEGRADO NO CONTRATO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com um Beneficiário TITULAR    @{INTEGMOVINCLUSAOCRMCAEPF17}
    E        Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" igual a NÃO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou os seguintes Beneficiários:
    E        Dependente Conjuge com "Data Certidão de Casamento" maior que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMCAEPF17}
    E        Dependente Filho com "Data de Nascimento" igual a 10 dias da data atual  @{INTEGMOVINCLUSAOCRMCAEPF17}
    E        Dependente Filho Adotivo com "Data da Adoção" menor que 10 dias da data atual  @{INTEGMOVINCLUSAOCRMCAEPF17}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMCAEPF17}
    E        Validar que a coluna "Data Base Carência" foi preenchido da seguinte forma: (3 Vidas)
    E        Se "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias  @{INTEGMOVINCLUSAOCRMCAEPF17}
    E        Se "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência  @{INTEGMOVINCLUSAOCRMCAEPF17}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMCAEPF17}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMCAEPF17[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 6 Vidas)    @{INTEGMOVINCLUSAOCRMCAEPF17}


Teste de Regressão 18 - INTEG MOV INCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), SEM PORTABILIDADE, COM TITULAR INTEGRADO EM OUTRA MOV
    [Documentation]  INTEG MOV INCLUSÃO CRM - TR018: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF), SEM PORTABILIDADE, COM TITULAR INTEGRADO EM OUTRA MOV
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" igual a NÃO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
    E        Realizou a integração de uma Movimentação Cadastral de Inclusão de Beneficiário, com um Titular  @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Executou as querys para alterar as datas de criação da Movimentação e Titular  @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Cadastrou os seguintes Beneficiários:
    E        Dependente Filho com "Data Admissão Empresa" a menos 9 dias da data atual e "Data de Vinculo" igual a menos 31 dias da data atual  @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Filho Adotivo com "Data Admissão Empresa" a menos 10 dias da data atual e "Data de Vinculo" igual a menos 30 dias da data atual  @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Conjuge com "Data Admissão Empresa" a menos 11 dias da data atual e "Data de Vinculo" igual a menos 30 dias da data atual   @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Filho com "Data Admissão Empresa" a menos 10 dias da data atual e "Data de Vinculo" igual a menos 29 dias da data atual   @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Conjuge com "Data Admissão Empresa" a menos 20 dias da data atual e "Data de Vinculo" igual a menos 29 dias da data atual   @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Filho com "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 19 dias da data atual   @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Filho Adotivo com "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 20 dias da data atual   @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Conjuge com "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 21 dias da data atual   @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Validar que a coluna "Data Base Carência" foi preenchido da seguinte forma: (8 Vidas)
    E        Dependente Filho com Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Filho adotivo com Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Conjuge com Data Base Carencia igual a Data de vigência    @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Filho adotivo com Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Conjuge com a Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Filho com Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Filho adotivo com Data Base Carencia igual a Data de vigência - 301 dias    @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Dependente Conjuge com Data Base Carencia igual a Data de vigência     @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{INTEGMOVINCLUSAOCRMCAEPF18}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVINCLUSAOCRMCAEPF18[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 8 Vidas)    @{INTEGMOVINCLUSAOCRMCAEPF18}
