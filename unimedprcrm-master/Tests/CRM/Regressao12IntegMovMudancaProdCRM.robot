*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   12
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav



*** Test Cases ***
Teste de Regressão 01 - INTEG MOV MUDANÇA PROD CRM - GERAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO PF)
    [Documentation]  INTEG MOV MUDANÇA PROD CRM - TR001: GERAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVMUDANCAPRODPF01}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVMUDANCAPRODPF01[1]}
    Quando   Gerou uma Movimentação Cadastral de Mudança de Produto
    Então    CRM deve apresentar a mensagem de erro "A mudança de produto via movimentação cadastral é permitido apenas para Contratos Pessoa Jurídica."


Teste de Regressão 02 - INTEG MOV MUDANÇA PROD CRM - INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO PJ)
    [Documentation]  INTEG MOV MUDANÇA PROD CRM - TR002: INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (10 vidas)  @{INTEGMOVMUDANCAPRODPJ02}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVMUDANCAPRODPJ02[1]}
    E        Gerou uma Movimentação Cadastral de Mudança de Produto
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Alteração" igual a EM 24 HORAS, selecionou novo produto    @{INTEGMOVMUDANCAPRODPJ02}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, informou "Alteração" igual a 1° DIA DO MÊS SEGUINTE, selecionou novo produto    @{INTEGMOVMUDANCAPRODPJ02}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Alteração" igual a EÚLTIMO DIA DO MÊS, selecionou novo produto    @{INTEGMOVMUDANCAPRODPJ02}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, informou "Alteração" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou novo produto    @{INTEGMOVMUDANCAPRODPJ02}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVMUDANCAPRODPJ02}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    Quando   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então    CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO devem estar com produto alterado


Teste de Regressão 03 - INTEG MOV MUDANÇA PROD CRM - INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO CAEPF)
    [Documentation]  INTEG MOV MUDANÇA PROD CRM - TR003: INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (10 vidas)  @{INTEGMOVMUDANCAPRODCAEPF03}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVMUDANCAPRODCAEPF03[1]}
    E        Gerou uma Movimentação Cadastral de Mudança de Produto
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Alteração" igual a EM 24 HORAS, selecionou novo produto    @{INTEGMOVMUDANCAPRODCAEPF03}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, informou "Alteração" igual a 1° DIA DO MÊS SEGUINTE, selecionou novo produto    @{INTEGMOVMUDANCAPRODCAEPF03}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Alteração" igual a EÚLTIMO DIA DO MÊS, selecionou novo produto    @{INTEGMOVMUDANCAPRODCAEPF03}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, informou "Alteração" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou novo produto    @{INTEGMOVMUDANCAPRODCAEPF03}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVMUDANCAPRODCAEPF03}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    Quando   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então    CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO devem estar com produto alterado
