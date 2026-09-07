*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   13
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav

*** Test Cases ***
Teste de Regressão 01 - INTEG MOV TRANSF GRUP FAMIL CRM - GERAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PF)
    [Documentation]  INTEG MOV TRANSF GRUP FAMIL CRM - TR001: GERAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVTRANSFGRUPFAMILCRMPF01}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVTRANSFGRUPFAMILCRMPF01[1]}
    Quando   Gerar uma Movimentação Cadastral de Transferência de Grupo Familiar
    Então    CRM deve apresentar a mensagem de erro "A Transferência de Grupo Familiar via movimentação cadastral é permitida apenas para Contratos Pessoa Jurídica."

    
Teste de Regressão 02 - INTEG MOV TRANSF GRUP FAMIL CRM - INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = N
    [Documentation]  INTEG MOV TRANSF GRUP FAMIL CRM - TR002: INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = N
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Resultado query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser N
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (10 Vidas - Transferência de Grupo Familiar)  @{INTEGMOVTRANSFGRUPFAMILCRMPJ02}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVTRANSFGRUPFAMILCRMPJ02[1]}
    E        Gerar uma Movimentação Cadastral de Transferência de Grupo Familiar
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EM 24 HORAS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório  @{INTEGMOVTRANSFGRUPFAMILCRMPJ02}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a 1° DIA DO MÊS SEGUINTE, selecionou o Contrato Destino, selecionou produto Assistencial  @{INTEGMOVTRANSFGRUPFAMILCRMPJ02}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EÚLTIMO DIA DO MÊS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório  @{INTEGMOVTRANSFGRUPFAMILCRMPJ02}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou o Contrato Destino, selecionou produto Assistencial  @{INTEGMOVTRANSFGRUPFAMILCRMPJ02}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"  @{INTEGMOVTRANSFGRUPFAMILCRMPJ02}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Transferência de Grupo Familiar em Conferência  @{INTEGMOVTRANSFGRUPFAMILCRMPJ02}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVTRANSFGRUPFAMILCRMPJ02[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato Origem os BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  @{INTEGMOVTRANSFGRUPFAMILCRMPJ02}
    E        Contrato Destino os BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  @{INTEGMOVTRANSFGRUPFAMILCRMPJ02}


Teste de Regressão 03 - INTEG MOV TRANSF GRUP FAMIL CRM - INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = S
    [Documentation]  INTEG MOV TRANSF GRUP FAMIL CRM - TR003: INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = S
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Resultado query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser S
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (10 Vidas - Transferência de Grupo Familiar)  @{INTEGMOVTRANSFGRUPFAMILCRMPJ03}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVTRANSFGRUPFAMILCRMPJ03[1]}
    E        Gerar uma Movimentação Cadastral de Transferência de Grupo Familiar
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EM 24 HORAS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório  @{INTEGMOVTRANSFGRUPFAMILCRMPJ03}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a 1° DIA DO MÊS SEGUINTE, selecionou o Contrato Destino, selecionou produto Assistencial  @{INTEGMOVTRANSFGRUPFAMILCRMPJ03}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EÚLTIMO DIA DO MÊS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório  @{INTEGMOVTRANSFGRUPFAMILCRMPJ03}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou o Contrato Destino, selecionou produto Assistencial  @{INTEGMOVTRANSFGRUPFAMILCRMPJ03}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"  @{INTEGMOVTRANSFGRUPFAMILCRMPJ03}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Transferência de Grupo Familiar em Conferência  @{INTEGMOVTRANSFGRUPFAMILCRMPJ03}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVTRANSFGRUPFAMILCRMPJ03[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato Origem os BENEFICIÁRIO transferidos não devem ser apresentados  @{INTEGMOVTRANSFGRUPFAMILCRMPJ03}
    E        Contrato Destino os BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  @{INTEGMOVTRANSFGRUPFAMILCRMPJ03}


Teste de Regressão 04 - INTEG MOV TRANSF GRUP FAMIL CRM - INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO CAEPF), COM EMP_MANTER_COD_BENEF = N
    [Documentation]  INTEG MOV TRANSF GRUP FAMIL CRM - TR004: INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO CAEPF), COM EMP_MANTER_COD_BENEF = N
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Resultado query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser N
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (10 Vidas - Transferência de Grupo Familiar)  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF04}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVTRANSFGRUPFAMILCRMCAEPF04[1]}
    E        Gerar uma Movimentação Cadastral de Transferência de Grupo Familiar
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EM 24 HORAS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF04}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a 1° DIA DO MÊS SEGUINTE, selecionou o Contrato Destino, selecionou produto Assistencial  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF04}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EÚLTIMO DIA DO MÊS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF04}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou o Contrato Destino, selecionou produto Assistencial  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF04}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF04}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Transferência de Grupo Familiar em Conferência  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF04}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVTRANSFGRUPFAMILCRMCAEPF04[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato Origem os BENEFICIÁRIO transferidos não devem ser apresentados  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF04}
    E        Contrato Destino os BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF04}


Teste de Regressão 05 - INTEG MOV TRANSF GRUP FAMIL CRM - INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO CAEPF), COM EMP_MANTER_COD_BENEF = S
    [Documentation]  INTEG MOV TRANSF GRUP FAMIL CRM - TR005: INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO CAEPF), COM EMP_MANTER_COD_BENEF = S
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Resultado query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser S
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (10 Vidas - Transferência de Grupo Familiar)  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF05}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVTRANSFGRUPFAMILCRMCAEPF05[1]}
    E        Gerar uma Movimentação Cadastral de Transferência de Grupo Familiar
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EM 24 HORAS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF05}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a 1° DIA DO MÊS SEGUINTE, selecionou o Contrato Destino, selecionou produto Assistencial  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF05}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EÚLTIMO DIA DO MÊS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF05}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou o Contrato Destino, selecionou produto Assistencial  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF05}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF05}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Transferência de Grupo Familiar em Conferência  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF05}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVTRANSFGRUPFAMILCRMCAEPF05[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato Origem os BENEFICIÁRIO transferidos não devem ser apresentados  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF05}
    E        Contrato Destino os BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  @{INTEGMOVTRANSFGRUPFAMILCRMCAEPF05}