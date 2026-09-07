*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   07
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav


*** Test Cases ***
Teste de Regressão 01 - DEC DE SAUDE (Contrato) - APROVAR DECLARAÇÃO DE SAÚDE, COM UMA PESSOA VIA POTENCIAL PF - GERADA AUTOMATICAMENTE
    [Documentation]  DEC DE SAUDE (Contrato) - TR001: APROVAR DECLARAÇÃO DE SAÚDE, COM UMA PESSOA VIA POTENCIAL PF - GERADA AUTOMATICAMENTE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios  @{DECDESAUDEPF01}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 4 e demais campos obrigatórios  @{DECDESAUDEPF01}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a INDIVIDUAL FAMILIAR  @{DECDESAUDEPF01}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDEPF01[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDEPF01}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou um Beneficiário Titular, com mesmo CPF do Potencial Cliente  @{DECDESAUDEPF01}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPF01[1]}
    E       Clicou no botão "CRIAR", painel Declaração de Saúde
    E       Selecionou uma Pessoa  ${DECDESAUDEPF01[1]}
    E       Preencheu os campos "Tipo","Altura","Peso","PA", selecionou a opção NÃO, selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"  @{DECDESAUDEPF01}
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID e clicou no botão "GRAVAR"  ${DECDESAUDEPF01[1]}
    E       Clicou na pessoa do painel "Questionário Pessoa"  ${DECDESAUDEPF01[1]}
    Quando  Clicou no botão "APROVAR QUESTIONÁRIO"
    Então   CRM deve atualizar a tela de Questionário Pessoa, com campo "Status" igual a APROVADO
    E       Tela Declaração de Saúde com campo "Status" igual a APROVADO
    E       Tela Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas com DS Aprovada" igual a 1
    E       Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" igual a APROVADO, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." e coluna "Dispensado" desmarcado


Teste de Regressão 02 - DEC DE SAUDE (Contrato) - RECUSAR DECLARAÇÃO DE SAÚDE, COM UMA PESSOA VIA POTENCIAL PF - GERADA AUTOMATICAMENTE
    [Documentation]  DEC DE SAUDE (Contrato) - TR002: RECUSAR DECLARAÇÃO DE SAÚDE, COM UMA PESSOA VIA POTENCIAL PF - GERADA AUTOMATICAMENTE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios  @{DECDESAUDEPF02}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 4 e demais campos obrigatórios  @{DECDESAUDEPF02}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a INDIVIDUAL FAMILIAR  @{DECDESAUDEPF02}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDEPF02[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDEPF02}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou um Beneficiário Titular, com mesmo CPF do Potencial Cliente  @{DECDESAUDEPF02}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPF02[1]}
    E       Clicou no botão "CRIAR", painel Declaração de Saúde
    E       Selecionou uma Pessoa  ${DECDESAUDEPF02[1]}
    E       Preencheu os campos "Tipo","Altura","Peso","PA", selecionou a opção NÃO, não selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"  @{DECDESAUDEPF02}
    E       Clicou no botão "GRAVAR"
    E       Selecionou a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica" e clicou no botão "GRAVAR"  ${DECDESAUDEPF02[1]}
    E       Clicou na pessoa do painel "Questionário Pessoa"  ${DECDESAUDEPF02[1]}
    Quando  Clicar no botão "RECUSAR BENEFICIÁRIO"
    E       Preencher o campo "Motivo" e clicar no botão "SALVAR"
    Então   CRM deve atualizar a tela de Questionário Pessoa, com campo "Status" igual a RECUSADO PELO BENEFICIÁRIO
    E       Tela Declaração de Saúde com campo "Status" igual a RECUSADO PELO BENEFICIÁRIO
    E       Tela Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas com DS Recusada" igual a 1
    E       Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" igual a RECUSADO PELO BENEFICIÁRIO, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." e coluna "Dispensado" desmarcado


Teste de Regressão 03 - DEC DE SAUDE (Contrato) - DISPENSAR BENEFICIÁRIO DA DECLARAÇÃO DE SAÚDE, COM UMA PESSOA VIA POTENCIAL PF - GERADA AUTOMATICAMENTE
    [Documentation]  DEC DE SAUDE (Contrato) - TR003: DISPENSAR BENEFICIÁRIO DA DECLARAÇÃO DE SAÚDE, COM UMA PESSOA VIA POTENCIAL PF - GERADA AUTOMATICAMENTE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios  @{DECDESAUDEPF03}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 4 e demais campos obrigatórios  @{DECDESAUDEPF03}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a INDIVIDUAL FAMILIAR  @{DECDESAUDEPF03}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDEPF03[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDEPF03}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou um Beneficiário Titular, com mesmo CPF do Potencial Cliente  @{DECDESAUDEPF03}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPF03[1]}
    Quando  Clicar no menu "DISPENSA EM MASSA"
    E       Selecionar a Pessoa, preencher o "Motivo" e clicar no botão "SALVAR"  ${DECDESAUDEPF03[1]}
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas dispensadas de DS" igual a 1, com campo "Status" igual a EM ANDAMENTO
    E       Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" VAZIO, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." e coluna "Dispensado" selecionada
    E       Sem Declaração de Saúde


Teste de Regressão 04 - DEC DE SAUDE (Contrato) - FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM TRÊS PESSOAS VIA POTENCIAL PF - GERADA MANUALMENTE
    [Documentation]  DEC DE SAUDE (Contrato) - TR004: FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM TRÊS PESSOAS VIA POTENCIAL PF - GERADA MANUALMENTE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO

    Dado    Usuário logou no sistema
    E       Desmarcou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios  @{DECDESAUDEPF04}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 3 e demais campos obrigatórios  @{DECDESAUDEPF04}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a INDIVIDUAL FAMILIAR  @{DECDESAUDEPF04}
    E       Não preencheu automaticamente o campo "Processo de Declaração de Saúde"
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDEPF04}
    E       Não selecionou o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou um Beneficiário Titular, com mesmo CPF do Potencial Cliente  @{DECDESAUDEPF04}
    E       Não apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário desejando incluir dependentes
    E       Cadastrou dois Beneficiários Dependentes  @{DECDESAUDEPF04}
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Cotação"  ${DECDESAUDEPF04[1]}
    E       Clicou no menu "INICIAR PROCESSO DE DECLARAÇÃO DE SAÚDE"
    E       Preencher o campo "Nome" e clicou no botão "SALVAR"  ${DECDESAUDEPF04[1]}
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPF04[1]}
    E       Clicou no botão "CRIAR", painel Declaração de Saúde
    E       Selecionou a Pessoa Titular, preencheu os campos "Tipo" igual a TITULAR,"Altura","Peso","PA"  @{DECDESAUDEPF04}
    E       Clicou no botão "ADICIONAR PESSOA", selecionou a Pessoa Dependente Conjuge, preencheu os campos "Tipo" igual a DEPENDENTE, "Grau Dependência" igual a 01 - CONJUGE,"Altura","Peso","PA"  @{DECDESAUDEPF04}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDEPF04[1]}
    E       Selecionou a pessoa Dependente, no campo pericia selecionou a opção "Não é necessária a perícia médica", não preencheu o prazo, CID  ${DECDESAUDEPF04[40]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPF04[1]}
    Quando  Clicar na aba Pessoa
    E       Selecionar a Pessoa TITULAR, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM  ${DECDESAUDEPF04[1]}
    E       Clicar na aba Pessoa
    E       Selecionar a Pessoa DEPENDENTE Conjuge, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR  ${DECDESAUDEPF04[40]}
    E       Clicar na aba Pessoa
    E       Clicar no menu EDITAR > DISPENSAR EM MASSA, selecionar a Pessoa DEPENDENTE Filho, preencher o "Motivo" e clicar em SALVAR  ${DECDESAUDEPF04[47]}
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 3, "Quantidade de Pessoas" igual a 3, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" igual a 1, com campo "Status" igual a EM ANDAMENTO
    E       Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para o Titular, RECUSADO PELO BENEFICIÁRIO para o Conjuge, VAZIO para o Filho, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Titular e Filho, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para o Conjuge, coluna "Dispensado" desmarcada para o Titular e Conjuge e selecionada para o Filho
    E       Com Declaração de Saúde, com a "status" FINALIZADO


Teste de Regressão 05 - DEC DE SAUDE (Contrato) - DISPENSAR DECLARAÇÃO DE SAÚDE, VIA POTENCIAL PF - GERADA AUTOMATICAMENTE
    [Documentation]  DEC DE SAUDE (Contrato) - TR005: DISPENSAR DECLARAÇÃO DE SAÚDE, VIA POTENCIAL PF - GERADA AUTOMATICAMENTE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios  @{DECDESAUDEPF05}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 2 e demais campos obrigatórios  @{DECDESAUDEPF05}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a INDIVIDUAL FAMILIAR  @{DECDESAUDEPF05}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDEPF05[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDEPF05}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou um Beneficiário Titular, com mesmo CPF do Potencial Cliente  @{DECDESAUDEPF05}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPF05[1]}
    Quando  Clicar no botão "EDITAR"
    E       Selecionar o campo "Dispensar Validação de Declaração de Saúde", clicar no botão "SIM", selecionar "Motivo" e clicar no botão "SALVAR"
    E       Clicar no menu "FINALIZAR" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Status" igual a CONCLUIDO, "Dispensar Validação de Declaração de Saúde" selecionado, "Usuário que dispensou" preenchido, "Data da Dispensa" preenchido, "Motivo" preenchido, "Complemento" visivel, "Concluído Manualmente" selecionado, os campos "Quantidade de vidas Aprovadas na cotação", "Quantidade de Pessoas: 1 Quantidade de Pessoas dispensadas de DS", Quantidade de Pessoas com DS Aprovada", "Quantidade de Pessoas com DS Recusada" não devem ser apresentados
    E       Aba Pessoa, com a mensagem "Não há Declarações de Saúde para a seleção."
    E       Sem painel Declaração de Saúde


Teste de Regressão 06 - DEC DE SAUDE (Contrato) - FINALIZAR DECLARAÇÃO DE SAÚDE AUTOMATICAMENTE (POTENCIAL PF)
    [Documentation]  DEC DE SAUDE (Contrato) - TR006: FINALIZAR DECLARAÇÃO DE SAÚDE AUTOMATICAMENTE (POTENCIAL PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios  @{DECDESAUDEPF06}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 4 e demais campos obrigatórios  @{DECDESAUDEPF06}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a INDIVIDUAL FAMILIAR  @{DECDESAUDEPF06}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDEPF06[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDEPF06}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou um Beneficiário Titular, com mesmo CPF do Potencial Cliente  @{DECDESAUDEPF06}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPF06[1]}
    E       Criou a Declaração de Saúde, com uma Pessoa, preencheu os campos "Tipo","Altura","Peso","PA", selecionou a opção NÃO, selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"  @{DECDESAUDEPF06}
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica" e clicou no botão "GRAVAR"  ${DECDESAUDEPF06[1]}
    E       Clicou na pessoa do painel "Questionário Pessoa"  ${DECDESAUDEPF06[1]}
    E       Clicou no botão "APROVAR QUESTIONÁRIO"
    E       Clicou no Contrato  ${DECDESAUDEPF06[1]}
    E       Realizou a integração  @{DECDESAUDEPF06}
    Quando  Acessar o Processo de Declaração de Saúde"  ${DECDESAUDEPF06[1]}
    Então   CRM deve atualizar a tela Processo de Declaração de Saúde, com os campos "Status" igual a CONCLUIDO e "Concluído Manualmente" desmarcado


Teste de Regressão 07 - DEC DE SAUDE (Contrato) - FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL PJ - GERADA AUTOMATICAMENTE
    [Documentation]  DEC DE SAUDE (Contrato) - TR007: FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL PJ - GERADA AUTOMATICAMENTE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
  
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios (DEC DE SAUDE)  @{DECDESAUDEPJ07}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 15 e demais campos obrigatórios  @{DECDESAUDEPJ07}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL  @{DECDESAUDEPJ07}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDEPJ07[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDEPJ07}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou Beneficiários  @{DECDESAUDEPJ07}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ07[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Titular, preencheu os campos "Tipo de Pessoa"igual a TITULAR,"Altura","Peso","PA"  @{DECDESAUDEPJ07}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDEPJ07[1]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ07[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Dependente, preencheu os campos "Tipo de Pessoa"igual a DEPENDENTE,"Altura","Peso","PA"  @{DECDESAUDEPJ07}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDEPJ07[40]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ07[1]}
    Quando  Clicar na aba Pessoa
    E       Selecionar a Pessoa TITULAR com DS, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM  ${DECDESAUDEPJ07[1]}
    E       Clicar na aba Pessoa
    E       Selecionar a Pessoa DEPENDENTE com DS, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR  ${DECDESAUDEPJ07[40]}
    E       Clicar na aba Pessoa
    E       Clicar no menu EDITAR > DISPENSAR EM MASSA, selecionar as demais Pessoas, preencher o "Motivo" e clicar em SALVAR
    E       Clicar no menu "FINALIZAR" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 15, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    E       Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para um Beneficiário, RECUSADO PELO BENEFICIÁRIO para um Beneficiário, VAZIO para outros Beneficiários, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Beneficiário Aprovado e Dispensado, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para Beneficiário Recusado, coluna "Dispensado" desmarcada para Beneficiário Aprovado e Dispensado e selecionada para o Beneficiário Recusado
    E       Com uma Declaração de Saúde, com a "status" APROVADO e uma Declaração de Saúde, com a "status" RECUSADO PELO BENEFICIÁRIO


Teste de Regressão 08 - DEC DE SAUDE (Contrato) - FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL PJ - GERADA MANUALMENTE (MAIS DE 29 VIDAS)
    [Documentation]  DEC DE SAUDE (Contrato) - TR008: FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL PJ - GERADA MANUALMENTE (MAIS DE 29 VIDAS)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios (DEC DE SAUDE)  @{DECDESAUDEPJ08}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 30 e demais campos obrigatórios  @{DECDESAUDEPJ08}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL  @{DECDESAUDEPJ08}
    E       Não Preencheu automaticamente o campo "Processo de Declaração de Saúde"
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDEPJ08}
    E       Não Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou Beneficiários  @{DECDESAUDEPJ08}
    E       Não Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Cotação"  ${DECDESAUDEPJ08[1]}
    E       Clicou no menu "INICIAR PROCESSO DE DECLARAÇÃO DE SAÚDE"
    E       Preencher o campo "Nome" e clicou no botão "SALVAR"  ${DECDESAUDEPJ08[1]}
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ08[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Titular, preencheu os campos "Tipo de Pessoa"igual a TITULAR,"Altura","Peso","PA"  @{DECDESAUDEPJ08}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDEPJ08[1]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ08[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Dependente, preencheu os campos "Tipo de Pessoa"igual a DEPENDENTE,"Altura","Peso","PA"  @{DECDESAUDEPJ08}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDEPJ08[40]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ08[1]}
    Quando  Clicar na aba Pessoa
    E       Selecionar a Pessoa TITULAR com DS, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM  ${DECDESAUDEPJ08[1]}
    E       Clicar na aba Pessoa
    E       Selecionar a Pessoa DEPENDENTE com DS, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR  ${DECDESAUDEPJ08[40]}
    E       Clicar na aba Pessoa
    E       Clicar no menu EDITAR > DISPENSAR EM MASSA, selecionar as demais Pessoas, preencher o "Motivo" e clicar em SALVAR
    E       Clicar no menu "FINALIZAR" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 30, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    E       Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para um Beneficiário, RECUSADO PELO BENEFICIÁRIO para um Beneficiário, VAZIO para outros Beneficiários, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Beneficiário Aprovado e Dispensado, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para Beneficiário Recusado, coluna "Dispensado" desmarcada para Beneficiário Aprovado e Dispensado e selecionada para o Beneficiário Recusado
    E       Com uma Declaração de Saúde, com a "status" APROVADO e uma Declaração de Saúde, com a "status" RECUSADO PELO BENEFICIÁRIO


Teste de Regressão 09 - DEC DE SAUDE (Contrato) - FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL PJ - GERADA MANUALMENTE (SEM PARAMETRO COMERCIAL)
    [Documentation]  DEC DE SAUDE (Contrato) - TR009: FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL PJ - GERADA MANUALMENTE (SEM PARAMETRO COMERCIAL)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Desmarcou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios (DEC DE SAUDE)  @{DECDESAUDEPJ09}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 10 e demais campos obrigatórios  @{DECDESAUDEPJ09}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL  @{DECDESAUDEPJ09}
    E       Não Preencheu automaticamente o campo "Processo de Declaração de Saúde"
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDEPJ09}
    E       Não Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou Beneficiários  @{DECDESAUDEPJ09}
    E       Não Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Cotação"  ${DECDESAUDEPJ09[1]}
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ09[1]}
    E       Clicou no menu "INICIAR PROCESSO DE DECLARAÇÃO DE SAÚDE"
    E       Preencher o campo "Nome" e clicou no botão "SALVAR"  ${DECDESAUDEPJ09[1]}
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ09[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Titular, preencheu os campos "Tipo de Pessoa"igual a TITULAR,"Altura","Peso","PA"  @{DECDESAUDEPJ09}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDEPJ09[1]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ09[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Dependente, preencheu os campos "Tipo de Pessoa"igual a DEPENDENTE,"Altura","Peso","PA"  @{DECDESAUDEPJ09}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDEPJ09[40]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ09[1]}
    Quando  Clicar na aba Pessoa
    E       Selecionar a Pessoa TITULAR com DS, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM  ${DECDESAUDEPJ09[1]}
    E       Clicar na aba Pessoa
    E       Selecionar a Pessoa DEPENDENTE com DS, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR  ${DECDESAUDEPJ09[40]}
    E       Clicar na aba Pessoa
    E       Clicar no menu EDITAR > DISPENSAR EM MASSA, selecionar as demais Pessoas, preencher o "Motivo" e clicar em SALVAR
    E       Clicar no menu "FINALIZAR" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 10, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    E       Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para um Beneficiário, RECUSADO PELO BENEFICIÁRIO para um Beneficiário, VAZIO para outros Beneficiários, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Beneficiário Aprovado e Dispensado, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para Beneficiário Recusado, coluna "Dispensado" desmarcada para Beneficiário Aprovado e Dispensado e selecionada para o Beneficiário Recusado
    E       Com uma Declaração de Saúde, com a "status" APROVADO e uma Declaração de Saúde, com a "status" RECUSADO PELO BENEFICIÁRIO


Teste de Regressão 10 - DEC DE SAUDE (Contrato) - DISPENSAR DECLARAÇÃO DE SAÚDE, VIA POTENCIAL PJ - GERADA AUTOMATICAMENTE
    [Documentation]  DEC DE SAUDE (Contrato) - TR010: DISPENSAR DECLARAÇÃO DE SAÚDE, VIA POTENCIAL PJ - GERADA AUTOMATICAMENTE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios (DEC DE SAUDE)  @{DECDESAUDEPJ10}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 10 e demais campos obrigatórios  @{DECDESAUDEPJ10}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL  @{DECDESAUDEPJ10}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDEPJ10[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios   @{DECDESAUDEPJ10}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou um Beneficiário Titular (DEC DE SAUDE)  @{DECDESAUDEPJ10}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ10[1]}
    Quando  Clicar no botão "EDITAR"
    E       Selecionar o campo "Dispensar Validação de Declaração de Saúde", clicar no botão "SIM", selecionar "Motivo" e clicar no botão "SALVAR"
    E       Clicar no menu "FINALIZAR" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Status" igual a CONCLUIDO, "Dispensar Validação de Declaração de Saúde" selecionado, "Usuário que dispensou" preenchido, "Data da Dispensa" preenchido, "Motivo" preenchido, "Complemento" visivel, "Concluído Manualmente" selecionado, os campos "Quantidade de vidas Aprovadas na cotação", "Quantidade de Pessoas: 1 Quantidade de Pessoas dispensadas de DS", Quantidade de Pessoas com DS Aprovada", "Quantidade de Pessoas com DS Recusada" não devem ser apresentados
    E       Aba Pessoa, com a mensagem "Não há Declarações de Saúde para a seleção."
    E       Sem painel Declaração de Saúde


Teste de Regressão 11 - DEC DE SAUDE (Contrato) - FINALIZAR DECLARAÇÃO DE SAÚDE AUTOMATICAMENTE (POTENCIAL PJ EMPRESARIAL)
    [Documentation]  DEC DE SAUDE (Contrato) - TR011: FINALIZAR DECLARAÇÃO DE SAÚDE AUTOMATICAMENTE (POTENCIAL PJ EMPRESARIAL)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios (DEC DE SAUDE)  @{DECDESAUDEPJ11}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 10 e demais campos obrigatórios  @{DECDESAUDEPJ11}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL  @{DECDESAUDEPJ11}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDEPJ11[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDEPJ11}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou um Beneficiário Titular (DEC DE SAUDE)  @{DECDESAUDEPJ11}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEPJ11[1]}
    E       Criou a Declaração de Saúde, com uma Pessoa, preencheu os campos "Tipo","Altura","Peso","PA", selecionou a opção NÃO, selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"  @{DECDESAUDEPJ11}
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica" e clicou no botão "GRAVAR"  ${DECDESAUDEPJ11[1]}
    E       Clicou na pessoa do painel "Questionário Pessoa"  ${DECDESAUDEPJ11[1]}
    E       Clicou no botão "APROVAR QUESTIONÁRIO"
    E       Clicou no Contrato  ${DECDESAUDEPJ11[1]}
    E       Realizou a integração  @{DECDESAUDEPJ11}
    Quando  Acessar o Processo de Declaração de Saúde"  ${DECDESAUDEPJ11[1]}
    Então   CRM deve atualizar a tela Processo de Declaração de Saúde, com os campos "Status" igual a CONCLUIDO e "Concluído Manualmente" desmarcado


Teste de Regressão 12 - DEC DE SAUDE (Contrato) - FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL CAEPF EMPRESARIAL - GERADA AUTOMATICAMENTE
    [Documentation]  DEC DE SAUDE (Contrato) - TR012: FINALIZAR DECLARAÇÃO DE SAÚDE AUTOMATICAMENTE (POTENCIAL PJ EMPRESARIAL)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (DEC DE SAUDE)  @{DECDESAUDECAEPF12}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 15 e demais campos obrigatórios  @{DECDESAUDECAEPF12}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL  @{DECDESAUDECAEPF12}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF12[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDECAEPF12}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou Beneficiários  @{DECDESAUDECAEPF12}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF12[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Titular, preencheu os campos "Tipo de Pessoa"igual a TITULAR,"Altura","Peso","PA"  @{DECDESAUDECAEPF12}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDECAEPF12[1]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF12[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Dependente, preencheu os campos "Tipo de Pessoa"igual a DEPENDENTE,"Altura","Peso","PA"  @{DECDESAUDECAEPF12}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDECAEPF12[40]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF12[1]}
    Quando  Clicar na aba Pessoa
    E       Selecionar a Pessoa TITULAR com DS, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM  ${DECDESAUDECAEPF12[1]}
    E       Clicar na aba Pessoa
    E       Selecionar a Pessoa DEPENDENTE com DS, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR  ${DECDESAUDECAEPF12[40]}
    E       Clicar na aba Pessoa
    E       Clicar no menu EDITAR > DISPENSAR EM MASSA, selecionar as demais Pessoas, preencher o "Motivo" e clicar em SALVAR
    E       Clicar no menu "FINALIZAR" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 15, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    E       Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para um Beneficiário, RECUSADO PELO BENEFICIÁRIO para um Beneficiário, VAZIO para outros Beneficiários, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Beneficiário Aprovado e Dispensado, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para Beneficiário Recusado, coluna "Dispensado" desmarcada para Beneficiário Aprovado e Dispensado e selecionada para o Beneficiário Recusado
    E       Com uma Declaração de Saúde, com a "status" APROVADO e uma Declaração de Saúde, com a "status" RECUSADO PELO BENEFICIÁRIO


Teste de Regressão 13 - DEC DE SAUDE (Contrato) - FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL CAEPF EMPRESARIAL - GERADA MANUALMENTE (MAIS DE 29 VIDAS)
    [Documentation]  DEC DE SAUDE (Contrato) - TR013: FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL CAEPF EMPRESARIAL - GERADA MANUALMENTE (MAIS DE 29 VIDAS)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (DEC DE SAUDE)  @{DECDESAUDECAEPF13}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 30 e demais campos obrigatórios  @{DECDESAUDECAEPF13}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL  @{DECDESAUDECAEPF13}
    E       Não Preencheu automaticamente o campo "Processo de Declaração de Saúde"
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDECAEPF13}
    E       Não Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou Beneficiários  @{DECDESAUDECAEPF13}
    E       Não Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Cotação"  ${DECDESAUDECAEPF13[1]}
    E       Clicou no menu "INICIAR PROCESSO DE DECLARAÇÃO DE SAÚDE"
    E       Preencher o campo "Nome" e clicou no botão "SALVAR"  ${DECDESAUDECAEPF13[1]}
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF13[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Titular, preencheu os campos "Tipo de Pessoa"igual a TITULAR,"Altura","Peso","PA"  @{DECDESAUDECAEPF13}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDECAEPF13[1]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF13[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Dependente, preencheu os campos "Tipo de Pessoa"igual a DEPENDENTE,"Altura","Peso","PA"  @{DECDESAUDECAEPF13}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDECAEPF13[40]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF13[1]}
    Quando  Clicar na aba Pessoa
    E       Selecionar a Pessoa TITULAR com DS, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM  ${DECDESAUDECAEPF13[1]}
    E       Clicar na aba Pessoa
    E       Selecionar a Pessoa DEPENDENTE com DS, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR  ${DECDESAUDECAEPF13[40]}
    E       Clicar na aba Pessoa
    E       Clicar no menu EDITAR > DISPENSAR EM MASSA, selecionar as demais Pessoas, preencher o "Motivo" e clicar em SALVAR
    E       Clicar no menu "FINALIZAR" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 30, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    E       Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para um Beneficiário, RECUSADO PELO BENEFICIÁRIO para um Beneficiário, VAZIO para outros Beneficiários, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Beneficiário Aprovado e Dispensado, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para Beneficiário Recusado, coluna "Dispensado" desmarcada para Beneficiário Aprovado e Dispensado e selecionada para o Beneficiário Recusado
    E       Com uma Declaração de Saúde, com a "status" APROVADO e uma Declaração de Saúde, com a "status" RECUSADO PELO BENEFICIÁRIO


Teste de Regressão 14 - DEC DE SAUDE (Contrato) - FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL CAEPF EMPRESARIAL - GERADA MANUALMENTE (SEM PARAMETRO COMERCIAL)
    [Documentation]  DEC DE SAUDE (Contrato) - TR014: FINALIZAR DECLARAÇÃO DE SAÚDE MANUALMENTE, COM PESSOAS VIA POTENCIAL CAEPF EMPRESARIAL - GERADA MANUALMENTE (SEM PARAMETRO COMERCIAL)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Desmarcou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (DEC DE SAUDE)  @{DECDESAUDECAEPF14}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 10 e demais campos obrigatórios  @{DECDESAUDECAEPF14}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL  @{DECDESAUDECAEPF14}
    E       Não Preencheu automaticamente o campo "Processo de Declaração de Saúde"
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDECAEPF14}
    E       Não Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou Beneficiários  @{DECDESAUDECAEPF14}
    E       Não Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Cotação"  ${DECDESAUDECAEPF14[1]}
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF14[1]}
    E       Clicou no menu "INICIAR PROCESSO DE DECLARAÇÃO DE SAÚDE"
    E       Preencher o campo "Nome" e clicou no botão "SALVAR"  ${DECDESAUDECAEPF14[1]}
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF14[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Titular, preencheu os campos "Tipo de Pessoa"igual a TITULAR,"Altura","Peso","PA"  @{DECDESAUDECAEPF14}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDECAEPF14[1]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF14[1]}
    E       Criou um Declaração de Saúde, selecionou a Pessoa Dependente, preencheu os campos "Tipo de Pessoa"igual a DEPENDENTE,"Altura","Peso","PA"  @{DECDESAUDECAEPF14}
    E       Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID  ${DECDESAUDECAEPF14[40]}
    E       Clicou no botão "GRAVAR" Analise Declaração
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF14[1]}
    Quando  Clicar na aba Pessoa
    E       Selecionar a Pessoa TITULAR com DS, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM  ${DECDESAUDECAEPF14[1]}
    E       Clicar na aba Pessoa
    E       Selecionar a Pessoa DEPENDENTE com DS, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR  ${DECDESAUDECAEPF14[40]}
    E       Clicar na aba Pessoa
    E       Clicar no menu EDITAR > DISPENSAR EM MASSA, selecionar as demais Pessoas, preencher o "Motivo" e clicar em SALVAR
    E       Clicar no menu "FINALIZAR" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 10, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    E       Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para um Beneficiário, RECUSADO PELO BENEFICIÁRIO para um Beneficiário, VAZIO para outros Beneficiários, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Beneficiário Aprovado e Dispensado, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para Beneficiário Recusado, coluna "Dispensado" desmarcada para Beneficiário Aprovado e Dispensado e selecionada para o Beneficiário Recusado
    E       Com uma Declaração de Saúde, com a "status" APROVADO e uma Declaração de Saúde, com a "status" RECUSADO PELO BENEFICIÁRIO


Teste de Regressão 15 - DEC DE SAUDE (Contrato) - DISPENSAR DECLARAÇÃO DE SAÚDE, VIA POTENCIAL CAEPF EMPRESARIAL - GERADA AUTOMATICAMENTE
    [Documentation]  DEC DE SAUDE (Contrato) - TR015: DISPENSAR DECLARAÇÃO DE SAÚDE, VIA POTENCIAL CAEPF EMPRESARIAL - GERADA AUTOMATICAMENTE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (DEC DE SAUDE)  @{DECDESAUDECAEPF15}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 10 e demais campos obrigatórios  @{DECDESAUDECAEPF15}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL  @{DECDESAUDECAEPF15}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF15[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios   @{DECDESAUDECAEPF15}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou um Beneficiário Titular (DEC DE SAUDE)  @{DECDESAUDECAEPF15}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF15[1]}
    Quando  Clicar no botão "EDITAR"
    E       Selecionar o campo "Dispensar Validação de Declaração de Saúde", clicar no botão "SIM", selecionar "Motivo" e clicar no botão "SALVAR"
    E       Clicar no menu "FINALIZAR" e clicar no botão "SIM"
    Então   CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Status" igual a CONCLUIDO, "Dispensar Validação de Declaração de Saúde" selecionado, "Usuário que dispensou" preenchido, "Data da Dispensa" preenchido, "Motivo" preenchido, "Complemento" visivel, "Concluído Manualmente" selecionado, os campos "Quantidade de vidas Aprovadas na cotação", "Quantidade de Pessoas: 1 Quantidade de Pessoas dispensadas de DS", Quantidade de Pessoas com DS Aprovada", "Quantidade de Pessoas com DS Recusada" não devem ser apresentados
    E       Aba Pessoa, com a mensagem "Não há Declarações de Saúde para a seleção."
    E       Sem painel Declaração de Saúde


Teste de Regressão 16 - DEC DE SAUDE (Contrato) - FINALIZAR DECLARAÇÃO DE SAÚDE AUTOMATICAMENTE (POTENCIAL CAEPF EMPRESARIAL)
    [Documentation]  DEC DE SAUDE (Contrato) - TR016: FINALIZAR DECLARAÇÃO DE SAÚDE AUTOMATICAMENTE (POTENCIAL CAEPF EMPRESARIAL)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (DEC DE SAUDE)  @{DECDESAUDECAEPF16}
    E       Clicou no menu "Solicitar Reserva de Mercado"
    E       Clicou no link "Nome da Conta"
    E       Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 10 e demais campos obrigatórios  @{DECDESAUDECAEPF16}
    E       Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL  @{DECDESAUDECAEPF16}
    E       Preencheu automaticamente o campo "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF16[1]}
    E       Cadastrou um Contrato, preenchendo campos obrigatórios  @{DECDESAUDECAEPF16}
    E       Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    E       Cadastrou um Beneficiário Titular (DEC DE SAUDE)  @{DECDESAUDECAEPF16}
    E       Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Salvou o Beneficiário não desejando incluir dependentes
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDECAEPF16[1]}
    E       Criou a Declaração de Saúde, com uma Pessoa, preencheu os campos "Tipo","Altura","Peso","PA", selecionou a opção NÃO, selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"  @{DECDESAUDECAEPF16}
    E       Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    E       Selecionou a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica" e clicou no botão "GRAVAR"  ${DECDESAUDECAEPF16[1]}
    E       Clicou na pessoa do painel "Questionário Pessoa"  ${DECDESAUDECAEPF16[1]}
    E       Clicou no botão "APROVAR QUESTIONÁRIO"
    E       Clicou no Contrato  ${DECDESAUDECAEPF16[1]}
    E       Realizou a integração  @{DECDESAUDECAEPF16}
    Quando  Acessar o Processo de Declaração de Saúde"  ${DECDESAUDECAEPF16[1]}
    Então   CRM deve atualizar a tela Processo de Declaração de Saúde, com os campos "Status" igual a CONCLUIDO e "Concluído Manualmente" desmarcado


### DECLARAÇÃO DE SAÚDE (Movimentação)
Teste de Regressão 01 - DECLARAÇÃO DE SAÚDE (Movimentação) - APROVAR BENEFICIÁRIO DA DECLARAÇÃO DE SAÚDE, COM UMA PESSOA (CONTRATO PF) - GERADA AUTOMATICAMENTE
    [Documentation]  DECLARAÇÃO DE SAÚDE (Movimentação) - TR001: APROVAR BENEFICIÁRIO DA DECLARAÇÃO DE SAÚDE, COM UMA PESSOA (CONTRATO PF) - GERADA AUTOMATICAMENTE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado    Usuário logou no sistema
    E       Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    E       Acessou um Contrato PF com "Situação" igual a INTEGRADO  @{DECDESAUDEMOVPF01}
    E       Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    E       Validou o preenchimento automaticamente do campo "Processo de Declaração de Saúde" com o ID da Movimentação
    E       Clicou no botão "CRIAR" subpainel "Beneficiários - Inclusão"
    E       Preencheu o campo "CPF" válido  ${DECDESAUDEMOVPF01[31]}
    E       Validou a apresentação da mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    E       Preencheu demais campo obrigatórios, com "Tipo" igual a DEPENDENTE e clicou no botão "SALVAR"
    E       Salvou o Beneficiário DEPENDENTE não desejando incluir dependentes  ${DECDESAUDEMOVPF01[1]}
    E       Clicou no link "Processo de Declaração de Saúde"  ${DECDESAUDEMOVPF01[1]}
    E       Validou a apresentação a tela "Processo de Declaração de Saúde", aba Básica com os campos "Nome" igual ao ID da Mov Cadastral, "Movimentação Cadastral" com ID da Mov Cadastral",  "Status" igual a EM ANDAMENTO, "Dispensar Validação de Declaração de Saúde" desmarcado, "Quantidade de Pessoas" igual a 1, "Quantidade de Pessoas dispensadas de DS" igual a 0, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 0 e "Concluído Manualmente" desmarcado e subpainel "Declaração de Saúde" sem registros
    E       Clicou na aba "Pessoa"
    E       Validou a apresentação da tela "Processo de Declaração de Saúde", aba Pessoas, com uma pessoa cadastrada e com as colunas "Situação", "Status DS", "Dispensado" vazios
    E       Clicou no botão "CRIAR", painel Declaração de Saúde
    E       Selecionou no campo "Pessoa 1" o Dependente da Mov Cadastral e preencheu o campo "Tipo" igual a DEPENDENTE
    E       Validou a apresentação do campo "Titular" acima do campo "Pessoa 1"
    E       Preencheu os campos "Titular", "Grau de Dependencia", "Altura", "Peso", "PA", selecionou a opção NÃO, selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    E       Validou a apresentação da aba "Responder Questionário", com perguntas com as opções SIM e NÃO
    E       Selecionou a opção NÃO para TODAS as perguntas
    E       Preencheu o campo "obs" e clicou no botão "SALVAR E CONTINUAR"
    E       Validou a apresentação da aba "Analise Declaração", com os paineis "Selecionar a pessoa" e "Resumo de Respostas Afirmativas por Pessoa", com as colunas "Pessoa" com o nome da pessoa, "Pergunta" com a pergunta respondida com SIM e "Observação" com a resposta informada
    E       Selecionou a pessoa
    E       Validou a apresentação do painel "Pericia", com campo radiobutton com as opções "Não é necessária a perícia médica.", "Com observações, mas sem necessidade de perícia.", "É necessária a perícia médica." e "Declarada a doença ou lesão preexistente.", campo alfanumérico "CID", campo combobox "Prazo de Suspensão (meses)" com as opções "1" até "24" e tabela com as colunas "Doença/Patologia", "CID" e "Prazo de Suspensão (meses)"
    E       Selecionou a opção "É necessária a perícia médica.", preencheu o prazo, CID
    E       Validou a inclusão do registro na tabela
    E       Clicou no botão "GRAVAR"
    E       Validou a apresentação da tela Declaração de Saúde » ID Declaração gerado automaticamente, com os campos "Processo de Declaração de Saúde" com o ID da Mov Cadastral, "Data de Criação" igual data e hora, "Titular" igual o nome do Titular, "Identificação" com o ID da Declaração de Saúde, "Status" igual a REGISTRADO ANÁLISE, painel "Questionário Pessoa" com as colunas "Pessoa", "Tipo", "Pericia", "Status", "Data de Modificação"
    E       Clicou na pessoa do painel "Questionário Pessoa"
    E       Validou a apresentação da tela "Questionário Pessoa » NOME PESSOA", com os botões "GERAR PARECER", "GERAR TERMO CPT", "APROVAR QUESTIONÁRIO", "RECUSA BENEFICIÁRIO", aba Básica com os campos "Declaração de Saúde", "Data de Criação", "Pessoa", "Pericia", "Status" e subpainel "Doenças ou Lesões Pré-existentes" com o CID informado
    E       Clicou na aba "Questionário Respondido"
    E       Validou a apresentação do questionário respondido e desabilitado
    E       Clicou na aba "Identificação Pessoal"
    E       Validou a apresentação dos campos de cadastro da pessoa
    E       Clicou na aba "Recusa"
    E       Validou a apresentação dos campos "Data Recusa", "Motivo Recusa", "Responsável Recusa"
    Quando  Clicar no botão "APROVAR QUESTIONÁRIO"
    Então   CRM deve atualizar a tela de "Questionário Pessoa", com campo "Status" igual a APROVADO
    E       Mostrar a tela "Declaração de Saúde" com campo "Status" igual a APROVADO e o subpainel "Questionário Pessoa" com o registro com o "Status" igual a APROVADO
    E       Mostrar a tela "Processo de Declaração de Saúde", aba Básica com os campos "Status" igual a EM ANDAMENTO, "Dispensar Validação de Declaração de Saúde" desmarcado, "Quantidade de Pessoas" igual a 1, "Quantidade de Pessoas dispensadas de DS" igual a 0, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 0 e "Concluído Manualmente" desmarcado e subpainel "Declaração de Saúde" com o registro com "Status" igual a APROVADO
    E       Mostrar a tela "Processo de Declaração de Saúde", aba Pessoa com coluna "Situação" igual a APROVADO, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." e coluna "Dispensado" desmarcado"				