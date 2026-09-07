*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   15
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav


*** Test Cases ***
Teste de Regressão 01 - IMPORT DE BENEF MOV CADASTRAL - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIOS - CONTRATO PF, COM BENEFICIÁRIOS IMPORTADOS
    [Documentation]  IMPORT DE BENEF MOV CADASTRAL - TR001: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIOS - CONTRATO PF, COM BENEFICIÁRIOS IMPORTADOS
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), sem Beneficiários  @{IMPORTDEBENEFMOVCADASTRALPF01}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Gerou um arquivo com 3 vidas e Importar o arquivo gerado    @{IMPORTDEBENEFMOVCADASTRALPF01}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"  @{IMPORTDEBENEFMOVCADASTRALPF01}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência    @{IMPORTDEBENEFMOVCADASTRALPF01}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${IMPORTDEBENEFMOVCADASTRALPF01[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação - 3 Vidas)    @{IMPORTDEBENEFMOVCADASTRALPF01}


Teste de Regressão 02 - IMPORT DE BENEF MOV CADASTRAL - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIOS - CONTRATO PJ, COM BENEFICIÁRIOS IMPORTADOS
    [Documentation]  IMPORT DE BENEF MOV CADASTRAL - TR002: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIOS - CONTRATO PJ, COM BENEFICIÁRIOS IMPORTADOS
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), sem Beneficiários  @{IMPORTDEBENEFMOVCADASTRALPJ02}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Gerou um arquivo com 10 vidas e Importar o arquivo gerado    @{IMPORTDEBENEFMOVCADASTRALPJ02}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{IMPORTDEBENEFMOVCADASTRALPJ02}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{IMPORTDEBENEFMOVCADASTRALPJ02}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${IMPORTDEBENEFMOVCADASTRALPJ02[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação - 10 Vidas)    @{IMPORTDEBENEFMOVCADASTRALPJ02}
    E        Validar que a coluna "Data Base Carência" foi preenchido    @{IMPORTDEBENEFMOVCADASTRALPJ02}


Teste de Regressão 03 - IMPORT DE BENEF MOV CADASTRAL - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIOS - CONTRATO CAEPF, COM BENEFICIÁRIOS IMPORTADOS
    [Documentation]  IMPORT DE BENEF MOV CADASTRAL - TR003: INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIOS - CONTRATO CAEPF, COM BENEFICIÁRIOS IMPORTADOS
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), sem Beneficiários  @{IMPORTDEBENEFMOVCADASTRALCAEPF03}
    E        Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E        Gerou um arquivo com 10 vidas e Importar o arquivo gerado    @{IMPORTDEBENEFMOVCADASTRALCAEPF03}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{IMPORTDEBENEFMOVCADASTRALCAEPF03}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência	 @{IMPORTDEBENEFMOVCADASTRALCAEPF03}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${IMPORTDEBENEFMOVCADASTRALCAEPF03[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        No Contrato os BENEFICIÁRIO incluidos (Importação - 10 Vidas)    @{IMPORTDEBENEFMOVCADASTRALCAEPF03}
    E        Validar que a coluna "Data Base Carência" foi preenchido  @{IMPORTDEBENEFMOVCADASTRALCAEPF03}