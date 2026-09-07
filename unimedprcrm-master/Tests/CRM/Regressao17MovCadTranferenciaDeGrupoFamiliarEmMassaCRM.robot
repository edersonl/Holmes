*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   17
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav

*** Test Cases ***
Teste de Regressão 01 - MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR EM MASSA CRM - GERAR EM MASSA UMA MOV CADASTRAL DE TRANSFERÊNCIA DE GRUPO FAMILIAR, COM UMA FAMILIA (CONTRATO PJ)
    [Documentation]  MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR EM MASSA CRM - TR001: GERAR EM MASSA UMA MOV CADASTRAL DE TRANSFERÊNCIA DE GRUPO FAMILIAR, COM UMA FAMILIA (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com Beneficiários TITULARES e DEPENDENTES (UMA FAMILIA)  @{MOVTRANFGRUPOFAMMASSAPJ01}
    E       Acessou módulo Movimentação em Massa
    E       Gerou um registro, com campo "Tipo de Movimentação" igual a TRANSFERÊNCIA DE GRUPO FAMILIAR  ${MOVTRANFGRUPOFAMMASSAPJ01[1]}
    E       Clicou no botão "DEFINIR BENEFICIÁRIOS"
    E       Clicou no botão "+ ADICIONAR BENEFICIÁRIOS"
    E       Preencheu o campo "CPF" com a informação de um Beneficiário existente no CRM e clicou no botão "PESQUISAR"  ${MOVTRANFGRUPOFAMMASSAPJ01[39]}
    E       Clicou no Beneficiário  ${MOVTRANFGRUPOFAMMASSAPJ01[40]}
    E       Preencheu o campo "Contrato Destino" com um Contrato PJ existente no CRM  @{MOVTRANFGRUPOFAMMASSAPJ01}
    E       Preencheu os campo "Transferência", "Produto Assistencial" e clicou no botão "SALVAR"  ${MOVTRANFGRUPOFAMMASSAPJ01[6]}
    E       Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (UMA FAMILIA)  @{MOVTRANFGRUPOFAMMASSAPJ01}
    Quando  Clicar no menu "GERAR MOVIMENTAÇÕES CADASTRAIS" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Movimentações Cadastrais com:
    E       A mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    E       Com o botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    E       A "situação" igual a CONCLUIDO
    E       Sem o botão "DEFINIR BENEFICIÁRIOS"
    E       Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO


Teste de Regressão 02 - MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR EM MASSA CRM - GERAR EM MASSA UMA MOV CADASTRAL DE TRANSFERÊNCIA DE GRUPO FAMILIAR, COM DUAS FAMILIAS (CONTRATO PJ)
    [Documentation]  MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR EM MASSA CRM - TR002: GERAR EM MASSA UMA MOV CADASTRAL DE TRANSFERÊNCIA DE GRUPO FAMILIAR, COM DUAS FAMILIAS (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com Beneficiários TITULARES e DEPENDENTES (DUAS FAMILIAS)  @{MOVTRANFGRUPOFAMMASSAPJ02}
    E       Acessou módulo Movimentação em Massa
    E       Gerou um registro, com campo "Tipo de Movimentação" igual a TRANSFERÊNCIA DE GRUPO FAMILIAR  ${MOVTRANFGRUPOFAMMASSAPJ02[1]}
    E       Clicou no botão "DEFINIR BENEFICIÁRIOS"
    E       Clicou no botão "+ ADICIONAR BENEFICIÁRIOS"
    E       Preencheu o campo "ID no Sistema de Gestão (Contrato)" com a informação de um Contrato existente no CRM e clicou no botão "PESQUISAR"  @{MOVTRANFGRUPOFAMMASSAPJ02}
    E       Selecionou dois Beneficiários e clicou no botão "SELECIONAR"
    E       Preencheu para o primeiro Beneficiário o campo "Contrato Destino" com um Contrato PJ existente no CRM  @{MOVTRANFGRUPOFAMMASSAPJ02}
    E       Preencheu para o segundo Beneficiário o campo "Contrato Destino" com um Contrato PJ existente no CRM (diferente do primeiro Contrato)  @{MOVTRANFGRUPOFAMMASSAPJ02}
    # E       Preencheu os campo "Transferência", "Produto Assistencial" e clicou no botão "SALVAR"  ${MOVTRANFGRUPOFAMMASSAPJ02[6]}
    E       Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (DUAS FAMILIAS)  @{MOVTRANFGRUPOFAMMASSAPJ02}
    Quando  Clicar no menu "GERAR MOVIMENTAÇÕES CADASTRAIS" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Movimentações Cadastrais com:
    E       A mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    E       Com o botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    E       A "situação" igual a CONCLUIDO
    E       Sem o botão "DEFINIR BENEFICIÁRIOS"
    E       Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO


Teste de Regressão 03 - MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR EM MASSA CRM - GERAR EM MASSA UMA MOV CADASTRAL DE TRANSFERÊNCIA DE GRUPO FAMILIAR, COM UMA FAMILIA (CONTRATO CAEPF)
    [Documentation]  MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR EM MASSA CRM - TR003: GERAR EM MASSA UMA MOV CADASTRAL DE TRANSFERÊNCIA DE GRUPO FAMILIAR, COM UMA FAMILIA (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com Beneficiários TITULARES e DEPENDENTES (UMA FAMILIA)  @{MOVTRANFGRUPOFAMMASSACAEPF03}
    E       Acessou módulo Movimentação em Massa
    E       Gerou um registro, com campo "Tipo de Movimentação" igual a TRANSFERÊNCIA DE GRUPO FAMILIAR  ${MOVTRANFGRUPOFAMMASSACAEPF03[1]}
    E       Clicou no botão "DEFINIR BENEFICIÁRIOS"
    E       Clicou no botão "+ ADICIONAR BENEFICIÁRIOS"
    E       Preencheu o campo "CPF" com a informação de um Beneficiário existente no CRM e clicou no botão "PESQUISAR"  ${MOVTRANFGRUPOFAMMASSACAEPF03[39]}
    E       Clicou no Beneficiário  ${MOVTRANFGRUPOFAMMASSACAEPF03[40]}
    E       Preencheu o campo "Contrato Destino" com um Contrato PJ existente no CRM  @{MOVTRANFGRUPOFAMMASSACAEPF03}
    E       Preencheu os campo "Transferência", "Produto Assistencial" e clicou no botão "SALVAR"  ${MOVTRANFGRUPOFAMMASSACAEPF03[6]}
    E       Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (UMA FAMILIA)  @{MOVTRANFGRUPOFAMMASSACAEPF03}
    Quando  Clicar no menu "GERAR MOVIMENTAÇÕES CADASTRAIS" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Movimentações Cadastrais com:
    E       A mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    E       Com o botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    E       A "situação" igual a CONCLUIDO
    E       Sem o botão "DEFINIR BENEFICIÁRIOS"
    E       Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO


Teste de Regressão 04 - MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR EM MASSA CRM - GERAR EM MASSA UMA MOV CADASTRAL DE TRANSFERÊNCIA DE GRUPO FAMILIAR, COM DUAS FAMILIAS (CONTRATO CAEPF)
    [Documentation]  MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR EM MASSA CRM - TR004: GERAR EM MASSA UMA MOV CADASTRAL DE TRANSFERÊNCIA DE GRUPO FAMILIAR, COM DUAS FAMILIAS (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com Beneficiários TITULARES e DEPENDENTES (DUAS FAMILIAS)  @{MOVTRANFGRUPOFAMMASSACAEPF04}
    E       Acessou módulo Movimentação em Massa
    E       Gerou um registro, com campo "Tipo de Movimentação" igual a TRANSFERÊNCIA DE GRUPO FAMILIAR  ${MOVTRANFGRUPOFAMMASSACAEPF04[1]}
    E       Clicou no botão "DEFINIR BENEFICIÁRIOS"
    E       Clicou no botão "+ ADICIONAR BENEFICIÁRIOS"
    E       Preencheu o campo "ID no Sistema de Gestão (Contrato)" com a informação de um Contrato existente no CRM e clicou no botão "PESQUISAR"  @{MOVTRANFGRUPOFAMMASSACAEPF04}
    E       Selecionou dois Beneficiários e clicou no botão "SELECIONAR"
    E       Preencheu para o primeiro Beneficiário o campo "Contrato Destino" com um Contrato CAEPF existente no CRM  @{MOVTRANFGRUPOFAMMASSACAEPF04}
    E       Preencheu para o segundo Beneficiário o campo "Contrato Destino" com um Contrato CAEPF existente no CRM (diferente do primeiro Contrato)  @{MOVTRANFGRUPOFAMMASSACAEPF04}
    # E       Preencheu os campo "Transferência", "Produto Assistencial" e clicou no botão "SALVAR"  ${MOVTRANFGRUPOFAMMASSACAEPF04[6]}
    E       Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (DUAS FAMILIAS)  @{MOVTRANFGRUPOFAMMASSACAEPF04}
    Quando  Clicar no menu "GERAR MOVIMENTAÇÕES CADASTRAIS" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Movimentações Cadastrais com:
    E       A mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    E       Com o botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    E       A "situação" igual a CONCLUIDO
    E       Sem o botão "DEFINIR BENEFICIÁRIOS"
    E       Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO
