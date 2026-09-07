*** Settings ***
Resource    ../../main.resource

Suite Setup      Instancia Variaveis    C05
Test Setup       Comum.Abrir Nav  
Test Teardown    Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 1 - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIOS - CONTRATO PJ, COM BENEFICIÁRIOS IMPORTADOS
    [Documentation]  INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIOS - CONTRATO PJ, COM BENEFICIÁRIOS IMPORTADOS    
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{IMPORTACAOBENEFICIARIOCNPJ01}
    E     Editou o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${IMPORTACAOBENEFICIARIOCNPJ01[2]}

    E     Gerou arquivo com 10 vidas  @{IMPORTACAOBENEFICIARIOCNPJ01}
    E     Clicou na aba "Inclusão por Arquivo"
    E     Selecionou o arquivo e clicou no botão "SALVAR E FINALIZAR"
    E     Clicou no menu Ações > Confirmar Importação e clicar no botão "SIM" na modal de Confirmação
    E     Clicar no link "ID MOV CADASTRAL"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${IMPORTACAOBENEFICIARIOCNPJ01[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou que a coluna "Data Base Carência" foi preenchido
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${IMPORTACAOBENEFICIARIOCNPJ01[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"


Teste de Regressão 2 - INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIOS - CONTRATO CAEPF, COM BENEFICIÁRIOS IMPORTADOS
    [Documentation]  INTEGRAR MOV CADASTRAL DE INCLUSÃO DE BENEFICIÁRIOS - CONTRATO CAEPF, COM BENEFICIÁRIOS IMPORTADOS   
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{IMPORTACAOBENEFICIARIOCAEPF01}
    E     Editou o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${IMPORTACAOBENEFICIARIOCAEPF01[2]}

    E     Gerou arquivo com 10 vidas  @{IMPORTACAOBENEFICIARIOCAEPF01}
    E     Clicou na aba "Inclusão por Arquivo"
    E     Selecionou o arquivo e clicou no botão "SALVAR E FINALIZAR"
    E     Clicou no menu Ações > Confirmar Importação e clicar no botão "SIM" na modal de Confirmação
    E     Clicar no link "ID MOV CADASTRAL"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${IMPORTACAOBENEFICIARIOCAEPF01[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou que a coluna "Data Base Carência" foi preenchido
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${IMPORTACAOBENEFICIARIOCAEPF01[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"