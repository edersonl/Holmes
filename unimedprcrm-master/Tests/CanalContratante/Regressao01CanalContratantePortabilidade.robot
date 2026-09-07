*** Settings ***
Resource    ../../main.resource

Suite Setup      Instancia Variaveis    C01
Test Setup       Comum.Abrir Nav  
Test Teardown    Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 01 - PORTABILIDADE CANAL - Finalizar Portabilidade, com DEPENDENTES APTOS E APTOS PARCIAIS (CONTRATO PF)
    [Documentation]  PORTABILIDADE CANAL - Finalizar Portabilidade, com DEPENDENTES APTOS E APTOS PARCIAIS (CONTRATO PF)
    
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com Beneficiários  @{PORTABILIDADECANALCLIENTEPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Portabilidade"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Portabilidade > Solicitar Portabilidade
    E     Clicou no menu Ações > Nova Solicitação de Portabilidade
    E     Selecionou o Contrato e clicou no botão "SALVAR"
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, sem pessoas na tabela "Pessoas"
    E     Clicou no botão "ADICIONAR" painel Pessoa
    E     Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge  @{PORTABILIDADECANALCLIENTEPF01}
    E     Cadastrou 1 (UM) Pessoa DEPENDENTE Filho    @{PORTABILIDADECANALCLIENTEPF01}
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, com pessoas na tabela "Pessoas"
    E     Anexou um arquivo no painel Documentos
    E     Clicou o menu "ENCAMINHAR PARA VALIDAÇÃO"
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação.", com "Situação" da Portabilidade e das Pessoas igual a AGUARDANDO VALIDAÇÃO

    E     Acessou a Solicitação de Portabilidade pelo CRM
    E     Validou a apresentação da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a AGUARDANDO VALIDAÇÃO
    E     Clicou no botão "VALIDAR EM MASSA"
    E     Selecionou as pessoas e clicou no botão "VALIDAR"
    E     Clicou aba "Checklist da Documentação"
    E     Selecionou opção "Presente" e clicou no botão "SALVAR"
    E     Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a DOCUMENTAÇÃO APROVADA
    E     Clicou o menu "SOLICITAR ASSINATURA DE PROPOSTA DE ADESÃO DE PORTABILIDADE"
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    E     Apresentou mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente." 
    E     Alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE

    E     Acessou a Solicitação de Portabilidade pelo Canal do Contratante
    E     Validou a alteração da "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    E     Clicou no menu "EMITIR PROPOSTA DE ADESÃO PORTABILIDADE"
    E     Fechou a modal aberta
    E     Clicou o menu "REALIZAR UPLOAD DE PROPOSTA DE ADESÃO DE PORTABILIDADE"
    E     Anexou e gravou o documento
    E     Apresentou a mensagem "A solicitação de portabilidade foi enviada para análise da assinatura. Em breve você receberá um retorno de sua solicitação.", alterou a "Situação" para AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO e no campo "Proposta de Adesão de Portabilidade Assinada" incluiu um link "Baixar"

    E     Acessou Solicitação de Portabilidade pelo CRM
    E     Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO, preencheu os campos "Data Emissão Proposta de Adesão de Portabilidade" com a DATA E HORA, "Proposta de Adesão de Portabilidade Assinada" igual a PROPOSTA DE ADESÃO DE PORTABILIDADE ASSINADA (link) e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    E     Clicou o menu "ENCAMINHAR PARA ANÁLISE"
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    E     Apresentou mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    E     Clicou o botão "ANALISAR" da primeira pessoa
    E     Clicou a aba "Questionário Elegibilidade"
    E     Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
    E     Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    E     Clicou o botão "ANALISAR" da segunda pessoa
    E     Clicou na aba "Questionário Elegibilidade"
    E     Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    E     Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Quando     Clicar o menu "FINALIZAR PROTOCOLO"
    E     Clicar botão "SIM" da modal Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    Então     O CRM deve atualizar a tela "Solicitação de Portabilidade" + Protocolo, com a mensagem "Protocolo Finalizado.", a "Situação" igual a APROVADA, "Data Encerramento Protocolo" igual a data e hora atual
    E     No Canal do Contratante a Solicitação de Portabilidade, com a "Situação" igual a APROVADA, campo "Protocolo", "Data Solicitação", "Data/Hora Envio para Análise", "Responsável Envio para Análise" preenchidos e com o menu "GERAR MOV. CADASTRAL"


Teste de Regressão 02 - PORTABILIDADE CANAL - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO PJ ADESÃO
    [Documentation]  PORTABILIDADE CANAL - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO PJ ADESÃO
    Dado  Usuário logou no sistema
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), sem Beneficiários  @{PORTABILIDADECANALPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Portabilidade"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Portabilidade > Solicitar Portabilidade
    E     Clicou no menu Ações > Nova Solicitação de Portabilidade
    E     Selecionou o Contrato e clicou no botão "SALVAR"
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, sem pessoas na tabela "Pessoas"
    E     Clicou no botão "ADICIONAR" painel Pessoa
    E     Cadastrou 1 (UM) Pessoa TITULAR, com Produtos Asistencial (5050)  @{PORTABILIDADECANALPF01}
    E     Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge, com Produtos Asistencial (5051)  @{PORTABILIDADECANALPF01}
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, com pessoas na tabela "Pessoas"
    E     Anexou um arquivo no painel Documentos
    E     Clicou o menu "ENCAMINHAR PARA VALIDAÇÃO"
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação.", com "Situação" da Portabilidade e das Pessoas igual a AGUARDANDO VALIDAÇÃO
    
    E     Acessou a Solicitação de Portabilidade pelo CRM
    E     Validou a apresentação da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a AGUARDANDO VALIDAÇÃO
    E     Clicou no botão "VALIDAR EM MASSA"
    E     Selecionou as pessoas e clicou no botão "VALIDAR"
    E     Clicou aba "Checklist da Documentação"
    E     Selecionou opção "Presente" e clicou no botão "SALVAR"
    E     Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a DOCUMENTAÇÃO APROVADA
    E     Clicou o menu "SOLICITAR ASSINATURA DE PROPOSTA DE ADESÃO DE PORTABILIDADE" 
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    E     Apresentou mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente."
    E     Alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE

    E     Acessou a Solicitação de Portabilidade pelo Canal do Contratante
    E     Validou a alteração da "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    E     Clicou no menu "EMITIR PROPOSTA DE ADESÃO PORTABILIDADE"
    E     Fechou a modal aberta
    E     Clicou o menu "REALIZAR UPLOAD DE PROPOSTA DE ADESÃO DE PORTABILIDADE"
    E     Anexou e gravou o documento
    E     Apresentou a mensagem "A solicitação de portabilidade foi enviada para análise da assinatura. Em breve você receberá um retorno de sua solicitação.", alterou a "Situação" para AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO e no campo "Proposta de Adesão de Portabilidade Assinada" incluiu um link "Baixar"
    
    E     Acessou Solicitação de Portabilidade pelo CRM
    E     Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO, preencheu os campos "Data Emissão Proposta de Adesão de Portabilidade" com a DATA E HORA, "Proposta de Adesão de Portabilidade Assinada" igual a PROPOSTA DE ADESÃO DE PORTABILIDADE ASSINADA (link) e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    E     Clicou o menu "ENCAMINHAR PARA ANÁLISE" 
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    E     Apresentou mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    E     Clicou o botão "ANALISAR" da primeira pessoa
    E     Clicou a aba "Questionário Elegibilidade"
    E     Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR" 
    E     Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    E     Clicou o botão "ANALISAR" da segunda pessoa
    E     Clicou na aba "Questionário Elegibilidade"
    E     Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    E     Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Quando     Clicar o menu "FINALIZAR PROTOCOLO"
    E     Clicar botão "SIM" da modal Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    Então     O CRM deve atualizar a tela "Solicitação de Portabilidade" + Protocolo, com a mensagem "Protocolo Finalizado.", a "Situação" igual a APROVADA, "Data Encerramento Protocolo" igual a data e hora atual
    E     No Canal do Contratante a Solicitação de Portabilidade, com a "Situação" igual a APROVADA, campo "Protocolo", "Data Solicitação", "Data/Hora Envio para Análise", "Responsável Envio para Análise" preenchidos e com o menu "GERAR MOV. CADASTRAL"


Teste de Regressão 03 - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO PJ EMPRESARIAL
    [Documentation]  PORTABILIDADE CANAL - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO PJ EMPRESARIAL

    Dado  Usuário logou no sistema
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), sem Beneficiários  @{PORTABILIDADECANALPF02}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Portabilidade"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Portabilidade > Solicitar Portabilidade
    E     Clicou no menu Ações > Nova Solicitação de Portabilidade
    E     Selecionou o Contrato e clicou no botão "SALVAR"
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, sem pessoas na tabela "Pessoas"
    E     Clicou no botão "ADICIONAR" painel Pessoa
    E     Cadastrou 1 (UM) Pessoa TITULAR, com Produtos Asistencial (5045)  @{PORTABILIDADECANALPF02}
    E     Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge, com Produtos Asistencial (5048)  @{PORTABILIDADECANALPF02}
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, com pessoas na tabela "Pessoas"
    E     Anexou um arquivo no painel Documentos
    E     Clicou o menu "ENCAMINHAR PARA VALIDAÇÃO"
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação.", com "Situação" da Portabilidade e das Pessoas igual a AGUARDANDO VALIDAÇÃO
    
    E     Acessou a Solicitação de Portabilidade pelo CRM
    E     Validou a apresentação da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a AGUARDANDO VALIDAÇÃO
    E     Clicou no botão "VALIDAR EM MASSA"
    E     Selecionou as pessoas e clicou no botão "VALIDAR"
    E     Clicou aba "Checklist da Documentação"
    E     Selecionou opção "Presente" e clicou no botão "SALVAR"
    E     Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a DOCUMENTAÇÃO APROVADA
    E     Clicou o menu "SOLICITAR ASSINATURA DE PROPOSTA DE ADESÃO DE PORTABILIDADE" 
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    E     Apresentou mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente."
    E     Alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
      
    E     Acessou a Solicitação de Portabilidade pelo Canal do Contratante
    E     Validou a alteração da "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    E     Clicou no menu "EMITIR PROPOSTA DE ADESÃO PORTABILIDADE"
    E     Fechou a modal aberta
    E     Clicou o menu "REALIZAR UPLOAD DE PROPOSTA DE ADESÃO DE PORTABILIDADE"
    E     Anexou e gravou o documento
    E     Apresentou a mensagem "A solicitação de portabilidade foi enviada para análise da assinatura. Em breve você receberá um retorno de sua solicitação.", alterou a "Situação" para AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO e no campo "Proposta de Adesão de Portabilidade Assinada" incluiu um link "Baixar"
    
    E     Acessou Solicitação de Portabilidade pelo CRM
    E     Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO, preencheu os campos "Data Emissão Proposta de Adesão de Portabilidade" com a DATA E HORA, "Proposta de Adesão de Portabilidade Assinada" igual a PROPOSTA DE ADESÃO DE PORTABILIDADE ASSINADA (link) e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    E     Clicou o menu "ENCAMINHAR PARA ANÁLISE" 
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    E     Apresentou mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    E     Clicou o botão "ANALISAR" da primeira pessoa
    E     Clicou a aba "Questionário Elegibilidade"
    E     Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR" 
    E     Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    E     Clicou o botão "ANALISAR" da segunda pessoa
    E     Clicou na aba "Questionário Elegibilidade"
    E     Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    E     Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Quando     Clicar o menu "FINALIZAR PROTOCOLO"
    E     Clicar botão "SIM" da modal Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    Então     O CRM deve atualizar a tela "Solicitação de Portabilidade" + Protocolo, com a mensagem "Protocolo Finalizado.", a "Situação" igual a APROVADA, "Data Encerramento Protocolo" igual a data e hora atual
    E     No Canal do Contratante a Solicitação de Portabilidade, com a "Situação" igual a APROVADA, campo "Protocolo", "Data Solicitação", "Data/Hora Envio para Análise", "Responsável Envio para Análise" preenchidos e com o menu "GERAR MOV. CADASTRAL"


Teste de Regressão 04 - PORTABILIDADE CANAL - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO CAEPF ADESÃO
	[Documentation]  PORTABILIDADE CANAL - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO CAEPF ADESÃO
	Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), sem Beneficiários   @{PORTABILIDADECANALPF03}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Portabilidade"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Portabilidade > Solicitar Portabilidade
    E     Clicou no menu Ações > Nova Solicitação de Portabilidade
    E     Selecionou o Contrato e clicou no botão "SALVAR"
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, sem pessoas na tabela "Pessoas"
    E     Clicou no botão "ADICIONAR" painel Pessoa
    E     Cadastrou 1 (UM) Pessoa TITULAR, com Produtos Asistencial (5050)  @{PORTABILIDADECANALPF03}
    E     Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge, com Produtos Asistencial (5051)  @{PORTABILIDADECANALPF03}
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, com pessoas na tabela "Pessoas"
    E     Anexou um arquivo no painel Documentos
    E     Clicou o menu "ENCAMINHAR PARA VALIDAÇÃO"
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação.", com "Situação" da Portabilidade e das Pessoas igual a AGUARDANDO VALIDAÇÃO
    
    E     Acessou a Solicitação de Portabilidade pelo CRM
    E     Validou a apresentação da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a AGUARDANDO VALIDAÇÃO
    E     Clicou no botão "VALIDAR EM MASSA"
    E     Selecionou as pessoas e clicou no botão "VALIDAR"
    E     Clicou aba "Checklist da Documentação"
    E     Selecionou opção "Presente" e clicou no botão "SALVAR"
    E     Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a DOCUMENTAÇÃO APROVADA
    E     Clicou o menu "SOLICITAR ASSINATURA DE PROPOSTA DE ADESÃO DE PORTABILIDADE" 
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    E     Apresentou mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente."
    E     Alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
      
    E     Acessou a Solicitação de Portabilidade pelo Canal do Contratante
    E     Validou a alteração da "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    E     Clicou no menu "EMITIR PROPOSTA DE ADESÃO PORTABILIDADE"
    E     Fechou a modal aberta
    E     Clicou o menu "REALIZAR UPLOAD DE PROPOSTA DE ADESÃO DE PORTABILIDADE"
    E     Anexou e gravou o documento
    E     Apresentou a mensagem "A solicitação de portabilidade foi enviada para análise da assinatura. Em breve você receberá um retorno de sua solicitação.", alterou a "Situação" para AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO e no campo "Proposta de Adesão de Portabilidade Assinada" incluiu um link "Baixar"
    
    E     Acessou Solicitação de Portabilidade pelo CRM
    E     Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO, preencheu os campos "Data Emissão Proposta de Adesão de Portabilidade" com a DATA E HORA, "Proposta de Adesão de Portabilidade Assinada" igual a PROPOSTA DE ADESÃO DE PORTABILIDADE ASSINADA (link) e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    E     Clicou o menu "ENCAMINHAR PARA ANÁLISE" 
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    E     Apresentou mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    E     Clicou o botão "ANALISAR" da primeira pessoa
    E     Clicou a aba "Questionário Elegibilidade"
    E     Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR" 
    E     Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    E     Clicou o botão "ANALISAR" da segunda pessoa
    E     Clicou na aba "Questionário Elegibilidade"
    E     Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    E     Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Quando     Clicar o menu "FINALIZAR PROTOCOLO"
    E     Clicar botão "SIM" da modal Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    Então     O CRM deve atualizar a tela "Solicitação de Portabilidade" + Protocolo, com a mensagem "Protocolo Finalizado.", a "Situação" igual a APROVADA, "Data Encerramento Protocolo" igual a data e hora atual
    E     No Canal do Contratante a Solicitação de Portabilidade, com a "Situação" igual a APROVADA, campo "Protocolo", "Data Solicitação", "Data/Hora Envio para Análise", "Responsável Envio para Análise" preenchidos e com o menu "GERAR MOV. CADASTRAL"


Teste de Regressão 05 - PORTABILIDADE CANAL - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO CAEPF EMPRESARIAL
    [Documentation]  PORTABILIDADE CANAL - FINALIZAR PORTABILIDADE, COM TITULAR E DEPENDENTES APTOS E APTOS PARCIAIS - CONTRATO CAEPF EMPRESARIAL
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), sem Beneficiários  @{PORTABILIDADECANALPF04}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Portabilidade"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Portabilidade > Solicitar Portabilidade
    E     Clicou no menu Ações > Nova Solicitação de Portabilidade
    E     Selecionou o Contrato e clicou no botão "SALVAR"
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, sem pessoas na tabela "Pessoas"
    E     Clicou no botão "ADICIONAR" painel Pessoa
    E     Cadastrou 1 (UM) Pessoa TITULAR, com Produtos Asistencial (5045)  @{PORTABILIDADECANALPF04}
    E     Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge, com Produtos Asistencial (5048)  @{PORTABILIDADECANALPF04}
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, com pessoas na tabela "Pessoas"
    E     Anexou um arquivo no painel Documentos
    E     Clicou o menu "ENCAMINHAR PARA VALIDAÇÃO"
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    E     Validou a apresentação da tela "Solicitação de Portabilidade", com a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação.", com "Situação" da Portabilidade e das Pessoas igual a AGUARDANDO VALIDAÇÃO
    
    E     Acessou a Solicitação de Portabilidade pelo CRM
    E     Validou a apresentação da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a AGUARDANDO VALIDAÇÃO
    E     Clicou no botão "VALIDAR EM MASSA"
    E     Selecionou as pessoas e clicou no botão "VALIDAR"
    E     Clicou aba "Checklist da Documentação"
    E     Selecionou opção "Presente" e clicou no botão "SALVAR"
    E     Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a DOCUMENTAÇÃO APROVADA
    E     Clicou o menu "SOLICITAR ASSINATURA DE PROPOSTA DE ADESÃO DE PORTABILIDADE" 
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    E     Apresentou mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente."
    E     Alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
      
    E     Acessou a Solicitação de Portabilidade pelo Canal do Contratante
    E     Validou a alteração da "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    E     Clicou no menu "EMITIR PROPOSTA DE ADESÃO PORTABILIDADE"
    E     Fechou a modal aberta
    E     Clicou o menu "REALIZAR UPLOAD DE PROPOSTA DE ADESÃO DE PORTABILIDADE"
    E     Anexou e gravou o documento
    E     Apresentou a mensagem "A solicitação de portabilidade foi enviada para análise da assinatura. Em breve você receberá um retorno de sua solicitação.", alterou a "Situação" para AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO e no campo "Proposta de Adesão de Portabilidade Assinada" incluiu um link "Baixar"
    
    E     Acessou Solicitação de Portabilidade pelo CRM
    E     Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO, preencheu os campos "Data Emissão Proposta de Adesão de Portabilidade" com a DATA E HORA, "Proposta de Adesão de Portabilidade Assinada" igual a PROPOSTA DE ADESÃO DE PORTABILIDADE ASSINADA (link) e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    E     Clicou o menu "ENCAMINHAR PARA ANÁLISE" 
    E     Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    E     Apresentou mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    E     Clicou o botão "ANALISAR" da primeira pessoa
    E     Clicou a aba "Questionário Elegibilidade"
    E     Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR" 
    E     Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    E     Clicou o botão "ANALISAR" da segunda pessoa
    E     Clicou na aba "Questionário Elegibilidade"
    E     Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    E     Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    Quando     Clicar o menu "FINALIZAR PROTOCOLO"
    E     Clicar botão "SIM" da modal Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    Então     O CRM deve atualizar a tela "Solicitação de Portabilidade" + Protocolo, com a mensagem "Protocolo Finalizado.", a "Situação" igual a APROVADA, "Data Encerramento Protocolo" igual a data e hora atual
    E     No Canal do Contratante a Solicitação de Portabilidade, com a "Situação" igual a APROVADA, campo "Protocolo", "Data Solicitação", "Data/Hora Envio para Análise", "Responsável Envio para Análise" preenchidos e com o menu "GERAR MOV. CADASTRAL"
  		