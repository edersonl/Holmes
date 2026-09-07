*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   18
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav


*** Test Cases ***
Teste de Regressão 01 - MOV CAD EXCLUSÃO DE BENEFICIÁRIOS EM MASSA CRM - GERAR UMA MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO PJ)
    [Documentation]  MOV CAD EXCLUSÃO DE BENEFICIÁRIOS EM MASSA CRM - TR001: GERAR UMA MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou UM Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com Beneficiários TITULARES e DEPENDENTES  @{MOVEXCLUSAOMASSAPJ01}
    E       Acessou módulo Movimentação em Massa
    E       Gerou um registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS  ${MOVEXCLUSAOMASSAPJ01[1]}
    E       Clicou no botão "DEFINIR BENEFICIÁRIOS"
    E       Clicou no botão "+ ADICIONAR BENEFICIÁRIOS" (MOV EXCLUSAO)
    E       Clicou na opção "LISTA DE CPF"
    E       Preencheu DOIS CPFs um Titular com Dependente, um Dependente do Contrato e clicou no botão "INSERIR"  @{MOVEXCLUSAOMASSAPJ01}
    E       Validou a apresentação dos Beneficiários selecionados e seus dependentes  @{MOVEXCLUSAOMASSAPJ01}
    E       Preencheu os campos "Motivo", "Data de Exclusão", telefone e email de "Contato" e clicou no botão "SALVAR"  @{MOVEXCLUSAOMASSAPJ01}
    E       Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (MOV EXCLUSAO)  @{MOVEXCLUSAOMASSAPJ01}
    Quando  Clicar no menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    E       Clicar no botão "SIM" na modal de Confirmação "Confirma geração das movimentações cadastrais?"		
    Então   CRM deve atualizar a tela de Movimentações Cadastrais com:
    E       A mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    E       Com o botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    E       A "situação" igual a CONCLUIDO
    E       Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO


Teste de Regressão 02 - MOV CAD EXCLUSÃO DE BENEFICIÁRIOS EM MASSA CRM - GERAR DUAS MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO PJ)
    [Documentation]  MOV CAD EXCLUSÃO DE BENEFICIÁRIOS EM MASSA CRM - TR002: GERAR DUAS MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou DOIS Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com Beneficiários TITULARES e DEPENDENTES  @{MOVEXCLUSAOMASSAPJ02}
    E       Acessou módulo Movimentação em Massa
    E       Gerou um registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS  ${MOVEXCLUSAOMASSAPJ02[1]}
    E       Clicou no botão "DEFINIR BENEFICIÁRIOS"
    E       Clicou no botão "+ ADICIONAR BENEFICIÁRIOS" (MOV EXCLUSAO)
    E       Clicou na opção "LISTA DE CPF"
    E       Preencheu QUATRO CPFs um Titular com Dependente, um Dependente do Contrato 1, um Titular com Dependente, um Dependente do Contrato 2 e clicou no botão "INSERIR"  @{MOVEXCLUSAOMASSAPJ02}
    E       Validou a apresentação dos Beneficiários selecionados e seus dependentes  @{MOVEXCLUSAOMASSAPJ02}
    E       Preencheu os campos "Motivo", "Data de Exclusão", telefone e email de "Contato" e clicou no botão "SALVAR" (DOIS CONTRATOS)  @{MOVEXCLUSAOMASSAPJ02}
    E       Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (DOIS CONTRATOS)  @{MOVEXCLUSAOMASSAPJ02}
    Quando  Clicar no menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    E       Clicar no botão "SIM" na modal de Confirmação "Confirma geração das movimentações cadastrais?"		
    Então   CRM deve atualizar a tela de Movimentações Cadastrais com:
    E       A mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    E       Com o botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    E       A "situação" igual a CONCLUIDO
    E       Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO


Teste de Regressão 03 - MOV CAD EXCLUSÃO DE BENEFICIÁRIOS EM MASSA CRM - GERAR UMA MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO CAEPF)
    [Documentation]  MOV CAD EXCLUSÃO DE BENEFICIÁRIOS EM MASSA CRM - TR001: GERAR UMA MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou UM Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com Beneficiários TITULARES e DEPENDENTES  @{MOVEXCLUSAOMASSACAEPF03}
    E       Acessou módulo Movimentação em Massa
    E       Gerou um registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS  ${MOVEXCLUSAOMASSACAEPF03[1]}
    E       Clicou no botão "DEFINIR BENEFICIÁRIOS"
    E       Clicou no botão "+ ADICIONAR BENEFICIÁRIOS" (MOV EXCLUSAO)
    E       Clicou na opção "LISTA DE CPF"
    E       Preencheu DOIS CPFs um Titular com Dependente, um Dependente do Contrato e clicou no botão "INSERIR"  @{MOVEXCLUSAOMASSACAEPF03}
    E       Validou a apresentação dos Beneficiários selecionados e seus dependentes  @{MOVEXCLUSAOMASSACAEPF03}
    E       Preencheu os campos "Motivo", "Data de Exclusão", telefone e email de "Contato" e clicou no botão "SALVAR"  @{MOVEXCLUSAOMASSACAEPF03}
    E       Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (MOV EXCLUSAO)  @{MOVEXCLUSAOMASSACAEPF03}
    Quando  Clicar no menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    E       Clicar no botão "SIM" na modal de Confirmação "Confirma geração das movimentações cadastrais?"		
    Então   CRM deve atualizar a tela de Movimentações Cadastrais com:
    E       A mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    E       Com o botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    E       A "situação" igual a CONCLUIDO
    E       Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO


Teste de Regressão 04 - MOV CAD EXCLUSÃO DE BENEFICIÁRIOS EM MASSA CRM - GERAR DUAS MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO CAEPF)
    [Documentation]  MOV CAD EXCLUSÃO DE BENEFICIÁRIOS EM MASSA CRM - TR002: GERAR DUAS MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou DOIS Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com Beneficiários TITULARES e DEPENDENTES  @{MOVEXCLUSAOMASSACAEPF04}
    E       Acessou módulo Movimentação em Massa
    E       Gerou um registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS  ${MOVEXCLUSAOMASSACAEPF04[1]}
    E       Clicou no botão "DEFINIR BENEFICIÁRIOS"
    E       Clicou no botão "+ ADICIONAR BENEFICIÁRIOS" (MOV EXCLUSAO)
    E       Clicou na opção "LISTA DE CPF"
    E       Preencheu QUATRO CPFs um Titular com Dependente, um Dependente do Contrato 1, um Titular com Dependente, um Dependente do Contrato 2 e clicou no botão "INSERIR"  @{MOVEXCLUSAOMASSACAEPF04}
    E       Validou a apresentação dos Beneficiários selecionados e seus dependentes  @{MOVEXCLUSAOMASSACAEPF04}
    E       Preencheu os campos "Motivo", "Data de Exclusão", telefone e email de "Contato" e clicou no botão "SALVAR" (DOIS CONTRATOS)  @{MOVEXCLUSAOMASSACAEPF04}
    E       Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (DOIS CONTRATOS)  @{MOVEXCLUSAOMASSACAEPF04}
    Quando  Clicar no menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    E       Clicar no botão "SIM" na modal de Confirmação "Confirma geração das movimentações cadastrais?"		
    Então   CRM deve atualizar a tela de Movimentações Cadastrais com:
    E       A mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    E       Com o botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    E       A "situação" igual a CONCLUIDO
    E       Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO
