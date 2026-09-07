*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   09
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav


*** Test Cases ***
Teste de Regressão 01 - INTEGRACAO - VALIDAR DADOS CONTRATO VIA POTENCIAL PF
    [Documentation]  INTEGRACAO - TR001: VALIDAR DADOS CONTRATO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA FISICA com os campos obrigatórios   @{INTEGRACAOPOTPF01}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{INTEGRACAOPOTPF01}
    E        Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial    @{INTEGRACAOPOTPF01}
    E        Validar Processo de Declaração de Saude    @{INTEGRACAOPOTPF01}
    # E        Cadastrou um Contrato, preenchendo campos obrigatórios     @{INTEGRACAOPOTPF01}
    E        Cadastrou Beneficiários que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPF01}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPF01}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPF01}
    E        Clicou no botão "SIM" da modal de Confirmação
    Quando   Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPF01[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Então    CRM deve atualizar a tela Conferência » Titulo Contrato, aba "Resumo Conferência" com a situação "Validação Efetuada com Sucesso" na cor Azul    ${INTEGRACAOPOTPF01[1]}
    E        Campos "Quantidade de Vidas (Inconsistência Cadastral)" e "Quantidade de Vidas (Advertência)" com resultado zerado
    E        Campo "Quantidade de Vidas (Correto)" com resultado igual ao campo "Quantidade de Vidas"     ${INTEGRACAOPOTPF01[37]}


Teste de Regressão 02 - INTEGRACAO - APROVAR CONTRATO PF
    [Documentation]  INTEGRACAO - TR002: APROVAR CONTRATO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA FISICA com os campos obrigatórios   @{INTEGRACAOPOTPF02}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{INTEGRACAOPOTPF02}
    E        Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial    @{INTEGRACAOPOTPF02}
    E        Validar Processo de Declaração de Saude    @{INTEGRACAOPOTPF02}
    # E        Cadastrou um Contrato, preenchendo campos obrigatórios     @{INTEGRACAOPOTPF02}
    E        Cadastrou Beneficiários que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPF02}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPF02}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPF02}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPF02[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Quando   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPF02[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então    CRM deve atualizar a tela Conferência » Titulo Contrato, aba "Visão Geral" com a situação "Aprovado"
    E        Aba "Resumo Conferência" com o registro "Aprovado" no painel "Histórico de Revisões/Ajustes", com o "Parecer" e data e hora que foi realizada a ação
    E        Aba "Contrato" com a situação igual a "Aprovado" 
    E        Painel "Solicitações de Integração" com o registro "Integração Solicitada"


Teste de Regressão 03 - INTEGRACAO - INTEGRAR CONTRATO PF
    [Documentation]  INTEGRACAO - TR003: INTEGRAR CONTRATO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA FISICA com os campos obrigatórios   @{INTEGRACAOPOTPF03}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{INTEGRACAOPOTPF03}
    E        Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial    @{INTEGRACAOPOTPF03}
    E        Validar Processo de Declaração de Saude    @{INTEGRACAOPOTPF03}
    # E        Cadastrou um Contrato, preenchendo campos obrigatórios     @{INTEGRACAOPOTPF03}
    E        Cadastrou Beneficiários que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPF03}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPF03}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPF03}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPF03[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPF03[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPF03[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPF03}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje


Teste de Regressão 04 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Adesão) E BASE QUANTIDADE VIDAS MENSALIDADE = FAMILIA
    [Documentation]  INTEGRACAO - TR004: INTEGRAR CONTRATO PJ (Coletivo Adesão) E BASE QUANTIDADE VIDAS MENSALIDADE = FAMILIA
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
           
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ04}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ04} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO "Base Quantidade Vidas Mensalidade" FAMILIA, com 1 Produto Assistencial    @{INTEGRACAOPOTPJ04}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ04}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ04}
    E        Cadastrou Beneficiários PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ04}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ04}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ04}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ04[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ04[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ04[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ04}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje


Teste de Regressão 05 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Adesão), BASE QUANTIDADE VIDAS MENSALIDADE = BENEFICIÁRIO, TIPO DE LAYOUT = DISTRIBUIÇÃO DE VIDAS
    [Documentation]  INTEGRACAO - TR005: INTEGRAR CONTRATO PJ (Coletivo Adesão), BASE QUANTIDADE VIDAS MENSALIDADE = BENEFICIÁRIO, TIPO DE LAYOUT = DISTRIBUIÇÃO DE VIDAS
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
                 
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ05}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ05} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Tipo de Layout" DISTRIBUIÇÃO DE VIDAS, com 1 Produto Assistencial sem desconto e acréscimo    @{INTEGRACAOPOTPJ05}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ05}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ05}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ05}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ05}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ05}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ05[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ05[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ05[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ05}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário			


Teste de Regressão 06 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Adesão), BASE QUANTIDADE VIDAS MENSALIDADE = BENEFICIÁRIO, TIPO DE LAYOUT = TABELA COMPLETA
    [Documentation]  INTEGRACAO - TR006: INTEGRAR CONTRATO PJ (Coletivo Adesão), BASE QUANTIDADE VIDAS MENSALIDADE = BENEFICIÁRIO, TIPO DE LAYOUT = TABELA COMPLETA
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
             
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ06}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ06} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Tipo de Layout" TABELA COMPLETA, com 1 Produto Assistencial sem desconto e acréscimo    @{INTEGRACAOPOTPJ06}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ06}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ06}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ06}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ06}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ06}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ06[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ06[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ06[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ06}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário			


Teste de Regressão 07 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial) E BASE QUANTIDADE VIDAS MENSALIDADE = FAMILIA
    [Documentation]  INTEGRACAO - TR007: INTEGRAR CONTRATO PJ (Coletivo Empresarial) E BASE QUANTIDADE VIDAS MENSALIDADE = FAMILIA
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ07}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ07} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" FAMILIA, com 1 Produto Assistencial    @{INTEGRACAOPOTPJ07}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ07}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ07}
    E        Cadastrou Beneficiários PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ07}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ07}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ07}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ07[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ07[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ07[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ07}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje			


Teste de Regressão 08 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial), BASE QUANTIDADE VIDAS MENSALIDADE = BENEFICIÁRIO, COTAÇÃO MAIOR DE 29 VIDAS E FIXAR TABELA DE ACORDO COM COTAÇÃO 
    [Documentation]  INTEGRACAO - TR008: INTEGRAR CONTRATO PJ (Coletivo Empresarial), BASE QUANTIDADE VIDAS MENSALIDADE = BENEFICIÁRIO, COTAÇÃO MAIOR DE 29 VIDAS E FIXAR TABELA DE ACORDO COM COTAÇÃO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ08}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ08} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" FIXAR DE ACORDO COM A QUANTIDADE DE VIDAS NA COTAÇÃO, com 1 Produto Assistencial sem desconto e acréscimo    @{INTEGRACAOPOTPJ08}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ08}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ08}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ08}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ08}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ08}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ08[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ08[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ08[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ08}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário


Teste de Regressão 09 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial) E BASE QUANTIDADE VIDAS MENSALIDADE = BENEFICIÁRIO, MENOR QUE 29 VIDAS E FIXAR DE ACORDO COM A NEGOCIAÇÃO
    [Documentation]  INTEGRACAO - TR009: INTEGRAR CONTRATO PJ (Coletivo Empresarial) E BASE QUANTIDADE VIDAS MENSALIDADE = BENEFICIÁRIO, MENOR QUE 29 VIDAS E FIXAR DE ACORDO COM A NEGOCIAÇÃO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ09}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{INTEGRACAOPOTPJ09} 
    E        Cadastrou uma Cotação, "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" FIXAR DE ACORDO COM A NEGOCIAÇÃO, com 1 Produto Assistencial    @{INTEGRACAOPOTPJ09}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ09}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ09}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ09}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ09}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ09}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ09[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ09[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ09[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ09}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário


Teste de Regressão 10 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial), BASE QUANTIDADE VIDAS MENSALIDADE = BENEFICIÁRIO, IGUAL A 29 VIDAS E NÃO FIXAR TABELA
    [Documentation]  INTEGRACAO - TR010: INTEGRAR CONTRATO PJ (Coletivo Empresarial), BASE QUANTIDADE VIDAS MENSALIDADE = BENEFICIÁRIO, IGUAL A 29 VIDAS E NÃO FIXAR TABELA
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ10}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" igual a 29    @{INTEGRACAOPOTPJ10} 
    E        Cadastrou uma Cotação, "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, com 1 Produto Assistencial sem desconto e acréscimo    @{INTEGRACAOPOTPJ10}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ10}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ10}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ10}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ10}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ10}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ10[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ10[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ10[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ10}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário


Teste de Regressão 11 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial) E CONVÊNIO
    [Documentation]  INTEGRACAO - TR011: INTEGRAR CONTRATO PJ (Coletivo Empresarial) E CONVÊNIO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ11}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ11} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, com CONVÊNIO, com 1 Produto Assistencial sem desconto e acréscimo    @{INTEGRACAOPOTPJ11}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ11}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ11}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ11}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ11}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ11}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ11[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ11[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ11[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ11}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário


Teste de Regressão 12 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial) E DESCONTO
    [Documentation]  INTEGRACAO - TR012: INTEGRAR CONTRATO PJ (Coletivo Empresarial) E DESCONTO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ12}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ12} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, sem CONVÊNIO, com 1 Produto Assistencial com desconto e sem acréscimo    @{INTEGRACAOPOTPJ12}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ12}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ12}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ12}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ12}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ12}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ12[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ12[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ12[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ12}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário


Teste de Regressão 13 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial) E ACRÉSCIMO
    [Documentation]  INTEGRACAO - TR013: INTEGRAR CONTRATO PJ (Coletivo Empresarial) E ACRÉSCIMO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ13}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ13} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, sem CONVÊNIO, com 1 Produto Assistencial sem desconto e com acréscimo    @{INTEGRACAOPOTPJ13}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ13}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ13}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ13}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ13}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ13}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ13[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ13[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ13[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ13}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário


Teste de Regressão 14 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial) E CALCULA VALOR
    [Documentation]  INTEGRACAO - TR014: INTEGRAR CONTRATO PJ (Coletivo Empresarial) E CALCULA VALOR
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ14}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ14} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, sem CONVÊNIO, com 1 Produto Assistencial selecionou no campo "Negociação" CALCULA VALOR, selecionou a opção Faixa Etária, preencheu o campo "Valor Final" igual a 150,00, clicou no botão "APLICAR"    @{INTEGRACAOPOTPJ14}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ14}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ14}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ14}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ14}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ14}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ14[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ14[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ14[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ14}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário


Teste de Regressão 15 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial) E DESCONTO/ACRÉSCIMO EM ACESSÓRIO
    [Documentation]  INTEGRACAO - TR015: INTEGRAR CONTRATO PJ (Coletivo Empresarial) E DESCONTO/ACRÉSCIMO EM ACESSÓRIO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ15}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ15} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, sem convênio, com 1 Produto Assistencial sem desconto e sem acréscimo, 2 Produtos Acessórios com DESCONTO e com ACRÉSCIMO   @{INTEGRACAOPOTPJ15}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ15}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ15}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ15}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ15}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ15}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ15[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ15[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ15[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ15}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário


Teste de Regressão 16 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial), COM CONVÊNIO, ACRÉSCIMO NO ASSISTENCIAL E DESCONTO/ACRÉSCIMO NO ACESSÓRIO
    [Documentation]  INTEGRACAO - TR016: INTEGRAR CONTRATO PJ (Coletivo Empresarial), COM CONVÊNIO, ACRÉSCIMO NO ASSISTENCIAL E DESCONTO/ACRÉSCIMO NO ACESSÓRIO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ16}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ16} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, com CONVÊNIO, com 1 Produto Assistencial sem desconto e com ACRÉSCIMO, 2 Produtos Acessórios com DESCONTO e com ACRÉSCIMO   @{INTEGRACAOPOTPJ16}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ16}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ16}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ16}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ16}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ16}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ16[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ16[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ16[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ16}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário


Teste de Regressão 17 - INTEGRACAO - INTEGRAR CONTRATO PJ (Coletivo Empresarial), COM BENEFICIÁRIOS COM PORTABILIDADE
    [Documentation]  INTEGRACAO - TR017: INTEGRAR CONTRATO PJ (Coletivo Empresarial), COM BENEFICIÁRIOS COM PORTABILIDADE
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{INTEGRACAOPOTPJ17}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{INTEGRACAOPOTPJ17} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO   @{INTEGRACAOPOTPJ17}
    E        Validar Processo de Declaração de Saude (Integração)    @{INTEGRACAOPOTPJ17}
    E        Cadastrou uma Portabilidade  @{INTEGRACAOPOTPJ17}
    E        Realizou o processo de Portabilidade, com questionário APTO(A) AO EXERCÍCIO DA PORTABILIDADE  @{INTEGRACAOPOTPJ17}
    E        Realizou o processo de Portabilidade, com questionário APTO(A) PARCIAL AO EXERCÍCIO DA PORTABILIDADE  @{INTEGRACAOPOTPJ17}
    E        Realizou o processo de Portabilidade, com questionário INAPTO(A) AO EXERCÍCIO DA PORTABILIDADE  @{INTEGRACAOPOTPJ17}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{INTEGRACAOPOTPJ17}
    E        Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail    @{INTEGRACAOPOTPJ17}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGRACAOPOTPJ17}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{INTEGRACAOPOTPJ17}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ17[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${INTEGRACAOPOTPJ17[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGRACAOPOTPJ17[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    @{INTEGRACAOPOTPJ17}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário



# ------- IMPORT DE BENEF CONTRATO ------- #
Teste de Regressão 01 - IMPORT DE BENEF - INTEGRAR CONTRATO PF, COM BENEFICIÁRIOS IMPORTADOS
    [Documentation]  INTEGRACAO - TR001: INTEGRAR CONTRATO PF, COM BENEFICIÁRIOS IMPORTADOS
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA FISICA com os campos obrigatórios   @{IMPORTBENEFINTEG01}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{IMPORTBENEFINTEG01}
    E        Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial    @{IMPORTBENEFINTEG01}
    E        Validar Processo de Declaração de Saude    @{IMPORTBENEFINTEG01}
    # E        Cadastrou um Contrato, preenchendo campos obrigatórios     @{IMPORTBENEFINTEG01}
    E        Gerou um arquivo com 3 vidas    @{IMPORTBENEFINTEG01}
    E        Importou o arquivo gerado  @{IMPORTBENEFINTEG01}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{IMPORTBENEFINTEG01}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{IMPORTBENEFINTEG01}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${IMPORTBENEFINTEG01[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${IMPORTBENEFINTEG01[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${IMPORTBENEFINTEG01[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Importação Vidas   @{IMPORTBENEFINTEG01}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - Importação Vidas


Teste de Regressão 02 - IMPORT DE BENEF - INTEGRAR CONTRATO PJ (Coletivo Empresarial), COM BENEFICIÁRIOS IMPORTADOS
    [Documentation]  INTEGRACAO - TR002: INTEGRAR CONTRATO PF, COM BENEFICIÁRIOS IMPORTADOS
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{IMPORTBENEFINTEG02}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{IMPORTBENEFINTEG02} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{IMPORTBENEFINTEG02}
    E        Validar Processo de Declaração de Saude (Integração)    @{IMPORTBENEFINTEG02}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{IMPORTBENEFINTEG02}
    E        Gerou um arquivo com 10 vidas   @{IMPORTBENEFINTEG02}
    E        Importou o arquivo gerado   @{IMPORTBENEFINTEG02}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{IMPORTBENEFINTEG02}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{IMPORTBENEFINTEG02}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${IMPORTBENEFINTEG02[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${IMPORTBENEFINTEG02[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${IMPORTBENEFINTEG02[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Importação Vidas    @{IMPORTBENEFINTEG02}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - Importação Vidas


Teste de Regressão 03 - IMPORT DE BENEF - INTEGRAR CONTRATO PJ (Coletivo Adesão), COM BENEFICIÁRIOS IMPORTADOS
    [Documentation]  INTEGRACAO - TR003: INTEGRAR CONTRATO PJ (Coletivo Adesão), COM BENEFICIÁRIOS IMPORTADOS
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios   @{IMPORTBENEFINTEG03}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{IMPORTBENEFINTEG03} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{IMPORTBENEFINTEG03}
    E        Validar Processo de Declaração de Saude (Integração)    @{IMPORTBENEFINTEG03}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{IMPORTBENEFINTEG03}
    E        Gerou um arquivo com 10 vidas   @{IMPORTBENEFINTEG03}
    E        Importou o arquivo gerado   @{IMPORTBENEFINTEG03}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{IMPORTBENEFINTEG03}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{IMPORTBENEFINTEG03}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${IMPORTBENEFINTEG03[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${IMPORTBENEFINTEG03[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${IMPORTBENEFINTEG03[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Importação Vidas    @{IMPORTBENEFINTEG03}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - Importação Vidas


Teste de Regressão 04 - IMPORT DE BENEF - INTEGRAR CONTRATO CAEPF (Coletivo Empresarial), COM BENEFICIÁRIOS IMPORTADOS
    [Documentation]  INTEGRACAO - TR004: INTEGRAR CONTRATO CAEPF (Coletivo Empresarial), COM BENEFICIÁRIOS IMPORTADOS
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CAEPF) com os campos obrigatórios   @{IMPORTBENEFINTEG04}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{IMPORTBENEFINTEG04} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{IMPORTBENEFINTEG04}
    E        Validar Processo de Declaração de Saude (Integração)    @{IMPORTBENEFINTEG04}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{IMPORTBENEFINTEG04}
    E        Gerou um arquivo com 10 vidas   @{IMPORTBENEFINTEG04}
    E        Importou o arquivo gerado   @{IMPORTBENEFINTEG04}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{IMPORTBENEFINTEG04}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{IMPORTBENEFINTEG04}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${IMPORTBENEFINTEG04[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${IMPORTBENEFINTEG04[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${IMPORTBENEFINTEG04[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Importação Vidas    @{IMPORTBENEFINTEG04}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - Importação Vidas


Teste de Regressão 05 - IMPORT DE BENEF - INTEGRAR CONTRATO CAEPF (Coletivo Adesão), COM BENEFICIÁRIOS IMPORTADOS
    [Documentation]  INTEGRACAO - TR005: INTEGRAR CONTRATO CAEPF (Coletivo Adesão), COM BENEFICIÁRIOS IMPORTADOS
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CAEPF) com os campos obrigatórios   @{IMPORTBENEFINTEG05}
    E        Clicou no menu "Solicitar Reserva de Mercado"   
    E        Clicou no link "Nome da Conta"   
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29    @{IMPORTBENEFINTEG05} 
    E        Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{IMPORTBENEFINTEG05}
    E        Validar Processo de Declaração de Saude (Integração)    @{IMPORTBENEFINTEG05}
    #   E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{IMPORTBENEFINTEG05}
    E        Gerou um arquivo com 10 vidas   @{IMPORTBENEFINTEG05}
    E        Importou o arquivo gerado   @{IMPORTBENEFINTEG05}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{IMPORTBENEFINTEG05}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" do Contrato em Conferência     @{IMPORTBENEFINTEG05}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicar no menu "VALIDAR DADOS"    ${IMPORTBENEFINTEG05[1]}
    E        Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${IMPORTBENEFINTEG05[1]}
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${IMPORTBENEFINTEG05[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    E        No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Importação Vidas    @{IMPORTBENEFINTEG05}
    E        Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - Importação Vidas
