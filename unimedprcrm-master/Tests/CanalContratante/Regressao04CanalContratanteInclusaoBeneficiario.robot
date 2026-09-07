*** Settings ***
Resource    ../../main.resource

Suite Setup      Instancia Variaveis    C04
Test Setup       Comum.Abrir Nav  
Test Teardown    Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 1 - INCLUSÃO DE BENEFICIÁRIO - INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ ADESÃO)
    [Documentation]  INCLUSÃO DE BENEFICIÁRIO - INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ ADESÃO)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários  @{INCLUSAOBENEFICIARIOCANALPJ01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${INCLUSAOBENEFICIARIOCANALPJ01[2]}

    E     Cadastrou 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS  @{INCLUSAOBENEFICIARIOCANALPJ01}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{INCLUSAOBENEFICIARIOCANALPJ01}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS  @{INCLUSAOBENEFICIARIOCANALPJ01}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS  @{INCLUSAOBENEFICIARIOCANALPJ01}
    E     Clicou no botão "ENCERRAR CADASTRO"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${INCLUSAOBENEFICIARIOCANALPJ01[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INCLUSAOBENEFICIARIOCANALPJ01[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários incluidos



Teste de Regressão 2 - INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), SEM PARAMETRO DE CARÊNCIA
    [Documentation]  INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), SEM PARAMETRO DE CARÊNCIA
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INCLUSAOBENEFICIARIOCANALPJ02}
    E     Editou o Contrato, desmarcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${INCLUSAOBENEFICIARIOCANALPJ02[2]}

    E     Cadastrou 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS  @{INCLUSAOBENEFICIARIOCANALPJ02}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{INCLUSAOBENEFICIARIOCANALPJ02}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS  @{INCLUSAOBENEFICIARIOCANALPJ02}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS  @{INCLUSAOBENEFICIARIOCANALPJ02}
    E     Clicou no botão "ENCERRAR CADASTRO"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${INCLUSAOBENEFICIARIOCANALPJ02[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INCLUSAOBENEFICIARIOCANALPJ02[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários incluidos


Teste de Regressão 3 - INTEGINTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM PARAMETRO DE CARÊNCIA
    [Documentation]  INTINTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM PARAMETRO DE CARÊNCIA
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INCLUSAOBENEFICIARIOCANALPJ05}
    E     Editou o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS) e com campo "Beneficiários - Inclusões sem carência" diferente de SIM
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${INCLUSAOBENEFICIARIOCANALPJ05[2]}

    E     Cadastrou 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS  @{INCLUSAOBENEFICIARIOCANALPJ05}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{INCLUSAOBENEFICIARIOCANALPJ05}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS  @{INCLUSAOBENEFICIARIOCANALPJ05}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS  @{INCLUSAOBENEFICIARIOCANALPJ05}
    E     Clicou no botão "ENCERRAR CADASTRO"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${INCLUSAOBENEFICIARIOCANALPJ05[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INCLUSAOBENEFICIARIOCANALPJ05[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários incluidos


Teste de Regressão 4 - INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM PARAMETRO BENEFICIÁRIOS - INCLUSÕES SEM CARÊNCIA IGUAL A SIM
    [Documentation]  INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM PARAMETRO BENEFICIÁRIOS - INCLUSÕES SEM CARÊNCIA IGUAL A SIM
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INCLUSAOBENEFICIARIOCANALPJ06}
    E     Editou o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS) e com campo "Beneficiários - Inclusões sem carência" igual a SIM
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${INCLUSAOBENEFICIARIOCANALPJ06[2]}

    E     Cadastrou 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS  @{INCLUSAOBENEFICIARIOCANALPJ06}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{INCLUSAOBENEFICIARIOCANALPJ06}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS  @{INCLUSAOBENEFICIARIOCANALPJ06}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS  @{INCLUSAOBENEFICIARIOCANALPJ06}
    E     Clicou no botão "ENCERRAR CADASTRO"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${INCLUSAOBENEFICIARIOCANALPJ06[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" - 301 DIAS para todos os beneficiários
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INCLUSAOBENEFICIARIOCANALPJ06[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários incluidos


# Teste de Regressão 5 - INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM TITULAR E DEPENDENTES NA MESMA MOVIMENTAÇÃO
#     [Documentation]  INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM TITULAR E DEPENDENTES NA MESMA MOVIMENTAÇÃO
#     Dado  Usuário logou no sistema
#     E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INCLUSAOBENEFICIARIOCANALPJ03}
#     E     Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" VAZIO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
#     E     Acessou o módulo Todos > Usuário Canal do Contratante
#     E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
#     E     Acessou o usuário desejado
#     E     Vinculou o Contrato integrado no painel "Contrato"
#     E     O Usuário logou no sistema Canal do Contratante
#     E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
#     E     Clicou no menu Ações > Solicitar Movimentação
#     E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${INCLUSAOBENEFICIARIOCANALPJ03[2]}

#     E     Cadastrou Titular com "Data Admissão Empresa" menor que 10 dias da data atual  @{INCLUSAOBENEFICIARIOCANALPJ04}
#     E     Clicou no botão "NOVO DEPENDENTE"
#     E     Cadastrou Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular menor que 10 dias da data atual  @{INCLUSAOBENEFICIARIOCANALPJ04}
#     E     Clicou no botão "NOVO TITULAR"
#     E     Cadastrou Titular com "Data Admissão Empresa" igual a 10 dias da data atual  @{INCLUSAOBENEFICIARIOCANALPJ04}
#     E     Clicou no botão "NOVO DEPENDENTE"
#     E     Cadastrou Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular igual a 10 dias da data atual "Data Base de Carência" igual a Data Início Vigência – 301 Dias  @{INCLUSAOBENEFICIARIOCANALPJ04}
#     E     Clicou no botão "NOVO TITULAR"
#     E     Cadastrou Titular com "Data Admissão Empresa" maior que 10 dias da data atual  @{INCLUSAOBENEFICIARIOCANALPJ03}
#     E     Clicou no botão "NOVO DEPENDENTE"
#     E     Cadastrou Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular maior que 10 dias da data atual  @{INCLUSAOBENEFICIARIOCANALPJ03}
#     E     Clicou no botão "ENCERRAR CADASTRO"

#     E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
#     E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
#     E     Acessou o sistema CRM
#     E     Acessou o módulo Conferência
#     E     Clicou no menu "CONFERIR PROCESSOS"
#     E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
#     E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${INCLUSAOBENEFICIARIOCANALPJ03[1]}
#     E     Clicou no botão "SIM" da modal de Confirmação
#     E     Validou que o campo "Usuário Canal do Contratante" está preenchido
#     E     Clicou na aba "Movimentação Cadastral"
#     E     Se Data de Admissão for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias
#     E     Se Data de Admissão for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência
#     E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
#     E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
#     E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
#     Quando     Clicar no registro "Integração Solicitada"
#     E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INCLUSAOBENEFICIARIOCANALPJ03[1]}
#     Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
#     E     No Contrato os Beneficiários incluidos


# Teste de Regressão 6 - INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM TITULAR INTEGRADO NO CONTRATO
#     [Documentation]  INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO PJ EMPRESARIAL), COM TITULAR INTEGRADO NO CONTRATO
#     Dado  Usuário logou no sistema
#     E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com um Beneficiário TITULAR  @
#     E     Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" VAZIO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
#     E     Acessou o módulo Todos > Usuário Canal do Contratante
#     E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
#     E     Acessou o usuário desejado
#     E     Vinculou o Contrato integrado no painel "Contrato"

#     E     O Usuário logou no sistema Canal do Contratante
#     E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
#     E     Clicou no menu Ações > Solicitar Movimentação
#     E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${INCLUSAOBENEFICIARIOCANALPJ03[2]}
#     E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
#     E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"  

#     E     Acessou o sistema CRM
#     E     Acessou o módulo Conferência
#     E     Clicou no menu "CONFERIR PROCESSOS"
#     E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
#     E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${INCLUSAOBENEFICIARIOCANALPJ03[1]}
#     E     Clicou no botão "SIM" da modal de Confirmação
#     E     Validou que o campo "Usuário Canal do Contratante" está preenchido
#     E     Clicou na aba "Movimentação Cadastral"


Teste de Regressão 8 - INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF ADESÃO)
    [Documentation]  INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF ADESÃO)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários  @{INCLUSAOBENEFICIARIOCANALCAEPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${INCLUSAOBENEFICIARIOCANALCAEPF01[2]}

    E     Cadastrou 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS  @{INCLUSAOBENEFICIARIOCANALCAEPF01}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{INCLUSAOBENEFICIARIOCANALCAEPF01}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS  @{INCLUSAOBENEFICIARIOCANALCAEPF01}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS  @{INCLUSAOBENEFICIARIOCANALCAEPF01}
    E     Clicou no botão "ENCERRAR CADASTRO"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${INCLUSAOBENEFICIARIOCANALCAEPF01[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INCLUSAOBENEFICIARIOCANALCAEPF01[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários incluidos


Teste de Regressão 9 - INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF EMPRESARIAL), SEM PARAMETRO DE CARÊNCIA
    [Documentation]  INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF EMPRESARIAL), SEM PARAMETRO DE CARÊNCIA
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INCLUSAOBENEFICIARIOCANALCAEPF02}
    E     Editou o Contrato, desmarcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${INCLUSAOBENEFICIARIOCANALCAEPF02[2]}

    E     Cadastrou 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS  @{INCLUSAOBENEFICIARIOCANALCAEPF02}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{INCLUSAOBENEFICIARIOCANALCAEPF02}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS  @{INCLUSAOBENEFICIARIOCANALCAEPF02}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS  @{INCLUSAOBENEFICIARIOCANALCAEPF02}
    E     Clicou no botão "ENCERRAR CADASTRO"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${INCLUSAOBENEFICIARIOCANALCAEPF02[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INCLUSAOBENEFICIARIOCANALCAEPF02[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários incluidos



Teste de Regressão 10 - INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF EMPRESARIAL), COM PARAMETRO DE CARÊNCIA
    [Documentation]  INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF EMPRESARIAL), COM PARAMETRO DE CARÊNCIA
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INCLUSAOBENEFICIARIOCANALCAEPF03}
    E     Editou o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS) e com campo "Beneficiários - Inclusões sem carência" diferente de SIM
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${INCLUSAOBENEFICIARIOCANALCAEPF03[2]}

    E     Cadastrou 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS  @{INCLUSAOBENEFICIARIOCANALCAEPF03}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{INCLUSAOBENEFICIARIOCANALCAEPF03}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS  @{INCLUSAOBENEFICIARIOCANALCAEPF03}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS  @{INCLUSAOBENEFICIARIOCANALCAEPF03}
    E     Clicou no botão "ENCERRAR CADASTRO"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${INCLUSAOBENEFICIARIOCANALCAEPF03[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INCLUSAOBENEFICIARIOCANALCAEPF03[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários incluidos



Teste de Regressão 11 - INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF EMPRESARIAL), COM PARAMETRO BENEFICIÁRIOS - INCLUSÕES SEM CARÊNCIA IGUAL A SIM
    [Documentation]  INTEGRAR MOVIMENTAÇÃO DE INCLUSÃO DE BENEFICIÁRIO (CONTRATO CAEPF EMPRESARIAL), COM PARAMETRO BENEFICIÁRIOS - INCLUSÕES SEM CARÊNCIA IGUAL A SIM
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{INCLUSAOBENEFICIARIOCANALCAEPF04}
    E     Editou o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS) e com campo "Beneficiários - Inclusões sem carência" igual a SIM
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"  ${INCLUSAOBENEFICIARIOCANALCAEPF04[2]}

    E     Cadastrou 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS  @{INCLUSAOBENEFICIARIOCANALCAEPF04}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{INCLUSAOBENEFICIARIOCANALCAEPF04}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS  @{INCLUSAOBENEFICIARIOCANALCAEPF04}
    E     Clicou no botão "NOVO DEPENDENTE"
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS  @{INCLUSAOBENEFICIARIOCANALCAEPF04}
    E     Clicou no botão "ENCERRAR CADASTRO"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"   
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${INCLUSAOBENEFICIARIOCANALPJ04[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" - 301 DIAS para todos os beneficiários
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INCLUSAOBENEFICIARIOCANALPJ04[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários incluidos

       
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

