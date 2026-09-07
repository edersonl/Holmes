*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   19
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav


*** Test Cases ***
Teste de Regressão 01 - PORTABILIDADE CRM - FINALIZAR PORTABILIDADE, COM DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO PF
    [Documentation]  PORTABILIDADE CRM - TR001: FINALIZAR PORTABILIDADE, COM DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO PF
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou um Contrato com "Tipo" POTENCIAL PF, com um Beneficiário TITULAR  @{PORTABILIDADECRMPF01}
    E       Acessou o menu Todos > Solicitação de Portabilidade
    E       Clicou no menu "Criar Solicitação de Portabilidade"
    E       Preencheu o campo "Contrato" e clicou no botão "SALVAR"  ${PORTABILIDADECRMPF01[1]}
    E       Apresentou a tela de Solicitação de Portabilidade » Solicitação - data e hora atual, campo "Situação" igual a RASCUNHO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL
    E       Clicou no botão "CRIAR" painel Pessoa(Portabilidade)
    E       Cadastrou duas Pessoa DEPENDENTE  @{PORTABILIDADECRMPF01}
    E       Anexou um arquivo no painel documento
    E       Clicou menu "ENCAMINHAR PARA VALIDAÇÃO"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    E       Apresentou a mensagem "Portabilidade encaminhada para validação." e alterou a "Situação" para AGUARDANDO VALIDAÇÃO
    E       Clicou o botão "Validar em Massa"
    E       Selecionou as pessoas e clicou no botão "VALIDAR"
    E       Clicou na aba "Checklist da Documentação"
    E       Selecionou a opção "Presente" e clicou no botão "SALVAR"
    E       Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E       Clicar no botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    E       Apresentou a mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente." e alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
    E       Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E       Voltar para a aba da "Portabilidade"
    E       Apresentou o campo "Data Emissão Proposta de Adesão de Portabilidade" preenchido a data e hora atual
    E       Clicou no menu "Encaminhar para Análise"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    E       Atualizou o titulo da tela para Solicitação de Portabilidade » Protocolo
    E       Apresentou a mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    E       Apresenta painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado
    E       Clicou no botão "ANALISAR" da primeira pessoa
    E       Clicou na aba "Questionário Elegibilidade"
    E       Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
    E       Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    E       Clicou no botão "ANALISAR" da segunda pessoa
    E       Clicou na aba "Questionário Elegibilidade"
    E       Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    E       Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Quando  Usuário clicar no menu "FINALIZAR PROTOCOLO"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    E       Validar a apresentação da mensagem "Protocolo Finalizado.", a "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual			
    Então   CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade, com situação igual a APROVADA


Teste de Regressão 02 - PORTABILIDADE CRM - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO PJ ADESÃO
    [Documentation]  PORTABILIDADE CRM - TR002: FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO PJ ADESÃO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou um Contrato com "Tipo" POTENCIAL PJ e "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários  @{PORTABILIDADECRMPJ02}
    E       Acessou o menu Todos > Solicitação de Portabilidade
    E       Clicou no menu "Criar Solicitação de Portabilidade"
    E       Preencheu o campo "Contrato" e clicou no botão "SALVAR"  ${PORTABILIDADECRMPJ02[1]}
    E       Apresentou a tela de Solicitação de Portabilidade » Solicitação - data e hora atual, campo "Situação" igual a RASCUNHO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL
    E       Clicou no botão "CRIAR" painel Pessoa(Portabilidade)
    E       Cadastrar duas Pessoa TITULAR e DEPENDENTE  @{PORTABILIDADECRMPJ02}
    E       Anexou um arquivo no painel documento
    E       Clicou menu "ENCAMINHAR PARA VALIDAÇÃO"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    E       Apresentou a mensagem "Portabilidade encaminhada para validação." e alterou a "Situação" para AGUARDANDO VALIDAÇÃO
    E       Clicou o botão "Validar em Massa"
    E       Selecionou as pessoas e clicou no botão "VALIDAR"
    E       Clicou na aba "Checklist da Documentação"
    E       Selecionou a opção "Presente" e clicou no botão "SALVAR"
    E       Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E       Clicar no botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    E       Apresentou a mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente." e alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
    E       Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E       Voltar para a aba da "Portabilidade"
    E       Apresentou o campo "Data Emissão Proposta de Adesão de Portabilidade" preenchido a data e hora atual
    E       Clicou no menu "Encaminhar para Análise"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    E       Atualizou o titulo da tela para Solicitação de Portabilidade » Protocolo
    E       Apresentou a mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    E       Apresenta painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado
    E       Clicou no botão "ANALISAR" da primeira pessoa
    E       Clicou na aba "Questionário Elegibilidade"
    E       Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
    E       Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    E       Clicou no botão "ANALISAR" da segunda pessoa
    E       Clicou na aba "Questionário Elegibilidade"
    E       Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    E       Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Quando  Usuário clicar no menu "FINALIZAR PROTOCOLO"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    E       Validar a apresentação da mensagem "Protocolo Finalizado.", a "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual			
    Então   CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade, com situação igual a APROVADA


Teste de Regressão 03 - PORTABILIDADE CRM - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO PJ EMPRESARIAL
    [Documentation]  PORTABILIDADE CRM - TR003: FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO PJ EMPRESARIAL
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou um Contrato com "Tipo" POTENCIAL PJ e "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{PORTABILIDADECRMPJ03}
    E       Acessou o menu Todos > Solicitação de Portabilidade
    E       Clicou no menu "Criar Solicitação de Portabilidade"
    E       Preencheu o campo "Contrato" e clicou no botão "SALVAR"  ${PORTABILIDADECRMPJ03[1]}
    E       Apresentou a tela de Solicitação de Portabilidade » Solicitação - data e hora atual, campo "Situação" igual a RASCUNHO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL
    E       Clicou no botão "CRIAR" painel Pessoa(Portabilidade)
    E       Cadastrar duas Pessoa TITULAR e DEPENDENTE  @{PORTABILIDADECRMPJ03}
    E       Anexou um arquivo no painel documento
    E       Clicou menu "ENCAMINHAR PARA VALIDAÇÃO"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    E       Apresentou a mensagem "Portabilidade encaminhada para validação." e alterou a "Situação" para AGUARDANDO VALIDAÇÃO
    E       Clicou o botão "Validar em Massa"
    E       Selecionou as pessoas e clicou no botão "VALIDAR"
    E       Clicou na aba "Checklist da Documentação"
    E       Selecionou a opção "Presente" e clicou no botão "SALVAR"
    E       Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E       Clicar no botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    E       Apresentou a mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente." e alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
    E       Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E       Voltar para a aba da "Portabilidade"
    E       Apresentou o campo "Data Emissão Proposta de Adesão de Portabilidade" preenchido a data e hora atual
    E       Clicou no menu "Encaminhar para Análise"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    E       Atualizou o titulo da tela para Solicitação de Portabilidade » Protocolo
    E       Apresentou a mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    E       Apresenta painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado
    E       Clicou no botão "ANALISAR" da primeira pessoa
    E       Clicou na aba "Questionário Elegibilidade"
    E       Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
    E       Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    E       Clicou no botão "ANALISAR" da segunda pessoa
    E       Clicou na aba "Questionário Elegibilidade"
    E       Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    E       Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Quando  Usuário clicar no menu "FINALIZAR PROTOCOLO"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    E       Validar a apresentação da mensagem "Protocolo Finalizado.", a "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual			
    Então   CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade, com situação igual a APROVADA


Teste de Regressão 04 - PORTABILIDADE CRM - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO CAEPF ADESÃO
    [Documentation]  PORTABILIDADE CRM - TR004: FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO CAEPF ADESÃO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou um Contrato com "Tipo" POTENCIAL CAEPF e "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários  @{PORTABILIDADECRMCAEPF04}
    E       Acessou o menu Todos > Solicitação de Portabilidade
    E       Clicou no menu "Criar Solicitação de Portabilidade"
    E       Preencheu o campo "Contrato" e clicou no botão "SALVAR"  ${PORTABILIDADECRMCAEPF04[1]}
    E       Apresentou a tela de Solicitação de Portabilidade » Solicitação - data e hora atual, campo "Situação" igual a RASCUNHO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL
    E       Clicou no botão "CRIAR" painel Pessoa(Portabilidade)
    E       Cadastrar duas Pessoa TITULAR e DEPENDENTE  @{PORTABILIDADECRMCAEPF04}
    E       Anexou um arquivo no painel documento
    E       Clicou menu "ENCAMINHAR PARA VALIDAÇÃO"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    E       Apresentou a mensagem "Portabilidade encaminhada para validação." e alterou a "Situação" para AGUARDANDO VALIDAÇÃO
    E       Clicou o botão "Validar em Massa"
    E       Selecionou as pessoas e clicou no botão "VALIDAR"
    E       Clicou na aba "Checklist da Documentação"
    E       Selecionou a opção "Presente" e clicou no botão "SALVAR"
    E       Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E       Clicar no botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    E       Apresentou a mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente." e alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
    E       Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E       Voltar para a aba da "Portabilidade"
    E       Apresentou o campo "Data Emissão Proposta de Adesão de Portabilidade" preenchido a data e hora atual
    E       Clicou no menu "Encaminhar para Análise"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    E       Atualizou o titulo da tela para Solicitação de Portabilidade » Protocolo
    E       Apresentou a mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    E       Apresenta painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado
    E       Clicou no botão "ANALISAR" da primeira pessoa
    E       Clicou na aba "Questionário Elegibilidade"
    E       Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
    E       Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    E       Clicou no botão "ANALISAR" da segunda pessoa
    E       Clicou na aba "Questionário Elegibilidade"
    E       Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    E       Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Quando  Usuário clicar no menu "FINALIZAR PROTOCOLO"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    E       Validar a apresentação da mensagem "Protocolo Finalizado.", a "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual			
    Então   CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade, com situação igual a APROVADA


Teste de Regressão 05 - PORTABILIDADE CRM - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO CAEPF EMPRESARIAL
    [Documentation]  PORTABILIDADE CRM - TR005: FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO CAEPF EMPRESARIAL
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado    Usuário logou no sistema
    E       Integrou um Contrato com "Tipo" POTENCIAL CAEPF e "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários  @{PORTABILIDADECRMCAEPF05}
    E       Acessou o menu Todos > Solicitação de Portabilidade
    E       Clicou no menu "Criar Solicitação de Portabilidade"
    E       Preencheu o campo "Contrato" e clicou no botão "SALVAR"  ${PORTABILIDADECRMCAEPF05[1]}
    E       Apresentou a tela de Solicitação de Portabilidade » Solicitação - data e hora atual, campo "Situação" igual a RASCUNHO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL
    E       Clicou no botão "CRIAR" painel Pessoa(Portabilidade)
    E       Cadastrar duas Pessoa TITULAR e DEPENDENTE  @{PORTABILIDADECRMCAEPF05}
    E       Anexou um arquivo no painel documento
    E       Clicou menu "ENCAMINHAR PARA VALIDAÇÃO"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    E       Apresentou a mensagem "Portabilidade encaminhada para validação." e alterou a "Situação" para AGUARDANDO VALIDAÇÃO
    E       Clicou o botão "Validar em Massa"
    E       Selecionou as pessoas e clicou no botão "VALIDAR"
    E       Clicou na aba "Checklist da Documentação"
    E       Selecionou a opção "Presente" e clicou no botão "SALVAR"
    E       Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E       Clicar no botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    E       Apresentou a mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente." e alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
    E       Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E       Voltar para a aba da "Portabilidade"
    E       Apresentou o campo "Data Emissão Proposta de Adesão de Portabilidade" preenchido a data e hora atual
    E       Clicou no menu "Encaminhar para Análise"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    E       Atualizou o titulo da tela para Solicitação de Portabilidade » Protocolo
    E       Apresentou a mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    E       Apresenta painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado
    E       Clicou no botão "ANALISAR" da primeira pessoa
    E       Clicou na aba "Questionário Elegibilidade"
    E       Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
    E       Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    E       Clicou no botão "ANALISAR" da segunda pessoa
    E       Clicou na aba "Questionário Elegibilidade"
    E       Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    E       Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Quando  Usuário clicar no menu "FINALIZAR PROTOCOLO"
    E       Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    E       Validar a apresentação da mensagem "Protocolo Finalizado.", a "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual			
    Então   CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade, com situação igual a APROVADA
