*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   08
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav

*** Test Cases ***
Teste de Regressão 01 - CONTRATO - CRIAR CONTRATO VIA POTENCIAL PF
    [Documentation]  BENEFICIARIO - TR001: CRIAR CONTRATO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios    @{CONTRATOPOTPF01}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTRATOPOTPF01}
    E        Cadastrou uma Cotação  @{CONTRATOPOTPF01}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 02 - CONTRATO - CADASTRAR CONTRATO VIA POTENCIAL PF
    [Documentation]  BENEFICIARIO - TR002: CADASTRAR CONTRATO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios    @{CONTRATOPOTPF02}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTRATOPOTPF02}
    E        Cadastrou uma Cotação  @{CONTRATOPOTPF02}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato)  @{CONTRATOPOTPF02}
    E        Salvar o Contrato
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOPOTPF02}


Teste de Regressão 03 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA POTENCIAL PF
    [Documentation]  BENEFICIARIO - TR003: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios    @{CONTRATOPOTPF03}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTRATOPOTPF03}
    E        Cadastrou uma Cotação  @{CONTRATOPOTPF03}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios  @{CONTRATOPOTPF03}
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOPOTPF03}
    E        Cadastrou os Beneficiários    @{CONTRATOPOTPF03}
    E        Validar Processo de Declaração de Saude    @{CONTRATOPOTPF03}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"    @{CONTRATOPOTPF03}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 04 - CONTRATO - CRIAR CONTRATO VIA CONTA PF
    [Documentation]  BENEFICIARIO - TR004: CRIAR CONTRATO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios    @{CONTRATOCONTAPF04}
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTRATOCONTAPF04}
    E        Cadastrou uma Cotação    @{CONTRATOCONTAPF04}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 05 - CONTRATO - CADASTRAR CONTRATO VIA CONTA PF
    [Documentation]  BENEFICIARIO - TR005: CADASTRAR CONTRATO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios    @{CONTRATOCONTAPF05}
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTRATOCONTAPF05}
    E        Cadastrou uma Cotação    @{CONTRATOCONTAPF05}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato)  @{CONTRATOCONTAPF05}
    E        Salvar o Contrato
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCONTAPF05}


Teste de Regressão 06 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA CONTA PF
    [Documentation]  BENEFICIARIO - TR006: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios    @{CONTRATOCONTAPF06}
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTRATOCONTAPF06}
    E        Cadastrou uma Cotação    @{CONTRATOCONTAPF06}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios  @{CONTRATOCONTAPF06}
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCONTAPF06}
    E        Cadastrou os Beneficiários    @{CONTRATOCONTAPF06}
    E        Validar Processo de Declaração de Saude   @{CONTRATOCONTAPF06}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"    @{CONTRATOCONTAPF06}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 07 - CONTRATO - CRIAR CONTRATO VIA COTAÇÃO PF
    [Documentation]  BENEFICIARIO - TR007: CRIAR CONTRATO VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061 
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PF, Oportunidade e Cotação    @{CONTRATOCOTPF07}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 08 - CONTRATO - CADASTRAR CONTRATO VIA COTAÇÃO PF
    [Documentation]  BENEFICIARIO - TR008: CADASTRAR CONTRATO VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061 
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PF, Oportunidade e Cotação    @{CONTRATOCOTPF08}
    E        Usuário clicar no menu "Criar Contrato"
    Quando   Preencher os campos obrigatórios (Contrato)  @{CONTRATOCOTPF08}
    E        Salvar o Contrato
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCOTPF08}


Teste de Regressão 09 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO PF
    [Documentation]  BENEFICIARIO - TR009: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PF, Oportunidade e Cotação   @{CONTRATOCOTPF09}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios  @{CONTRATOCOTPF09}
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCOTPF09}
    E        Cadastrou os Beneficiários    @{CONTRATOCOTPF09}
    E        Validar Processo de Declaração de Saude   @{CONTRATOCOTPF09}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTRATOCOTPF09}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 10 - CONTRATO - CRIAR CONTRATO VIA POTENCIAL PJ (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR009: CRIAR CONTRATO VIA POTENCIAL PJ (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTPOTENCIALPJ10}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTPOTENCIALPJ10}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTPOTENCIALPJ10}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 11 - CONTRATO - CADASTRAR CONTRATO VIA POTENCIAL PJ (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR011: CADASTRAR CONTRATO VIA POTENCIAL PJ (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTPOTENCIALPJ11}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTPOTENCIALPJ11}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTPOTENCIALPJ11}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTPOTENCIALPJ11}
    E        Salvar o Contrato PJ
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTPOTENCIALPJ11}


Teste de Regressão 12 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA POTENCIAL PJ (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR012: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA POTENCIAL PJ (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTPOTENCIALPJ12}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTPOTENCIALPJ12}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTPOTENCIALPJ12}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios   @{CONTPOTENCIALPJ12} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTPOTENCIALPJ12}
    E        Cadastrou os Beneficiários PJ    @{CONTPOTENCIALPJ12}
    E        Validar Processo de Declaração de Saude    @{CONTPOTENCIALPJ12}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTPOTENCIALPJ12}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 13 - CONTRATO - CRIAR CONTRATO VIA CONTA PJ (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR013: CRIAR CONTRATO VIA CONTA PJ (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTCONTAPJ13}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTCONTAPJ13}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTCONTAPJ13}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 14 - CONTRATO - CADASTRAR CONTRATO VIA CONTA PJ (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR014: CADASTRAR CONTRATO VIA CONTA PJ (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTCONTAPJ14}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTCONTAPJ14}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTCONTAPJ14}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTCONTAPJ14}
    E        Salvar o Contrato PJ
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTCONTAPJ14}


Teste de Regressão 15 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA CONTA PJ (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR015: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA CONTA PJ (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTCONTAPJ15}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTCONTAPJ15}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTCONTAPJ15}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios   @{CONTCONTAPJ15} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTCONTAPJ15}
    E        Cadastrou os Beneficiários PJ    @{CONTCONTAPJ15}
    E        Validar Processo de Declaração de Saude    @{CONTCONTAPJ15}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTCONTAPJ15}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 16 - CONTRATO - CRIAR CONTRATO VIA COTAÇÃO PJ (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR016: CRIAR CONTRATO VIA COTAÇÃO PJ (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PJ, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTRATOCOTPJ16}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 17 - CONTRATO - CADASTRAR CONTRATO VIA COTAÇÃO PJ (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR017: CADASTRAR CONTRATO VIA COTAÇÃO PJ (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PJ, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTRATOCOTPJ17}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTRATOCOTPJ17}
    E        Salvar o Contrato PJ
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCOTPJ17}


Teste de Regressão 18 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO PJ (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR018: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO PJ (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PJ, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTRATOCOTPJ18}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios   @{CONTRATOCOTPJ18} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCOTPJ18}
    E        Cadastrou os Beneficiários PJ    @{CONTRATOCOTPJ18}
    E        Validar Processo de Declaração de Saude    @{CONTRATOCOTPJ18}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTRATOCOTPJ18}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 19 - CONTRATO - CADASTRAR CONTRATO VIA POTENCIAL PJ (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR019: CADASTRAR CONTRATO VIA POTENCIAL PJ (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTPOTENCIALPJ19}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTPOTENCIALPJ19}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTPOTENCIALPJ19}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTPOTENCIALPJ19}
    E        Salvar o Contrato PJ
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTPOTENCIALPJ19}


Teste de Regressão 20 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA POTENCIAL PJ (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR020: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA POTENCIAL PJ (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061

    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTPOTENCIALPJ20}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTPOTENCIALPJ20}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTPOTENCIALPJ20}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios   @{CONTPOTENCIALPJ20} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTPOTENCIALPJ20}
    E        Cadastrou os Beneficiários PJ    @{CONTPOTENCIALPJ20}
    E        Validar Processo de Declaração de Saude    @{CONTPOTENCIALPJ20}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTPOTENCIALPJ20}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 21 - CONTRATO - CRIAR CONTRATO VIA CONTA PJ (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR021: CRIAR CONTRATO VIA CONTA PJ (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTCONTAPJ21}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTCONTAPJ21}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTCONTAPJ21}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 22 - CONTRATO - CADASTRAR CONTRATO VIA CONTA PJ (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR022: CADASTRAR CONTRATO VIA CONTA PJ (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTCONTAPJ22}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTCONTAPJ22}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTCONTAPJ22}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTCONTAPJ22}
    E        Salvar o Contrato PJ
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTCONTAPJ22}


Teste de Regressão 23 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA CONTA PJ (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR023: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA CONTA PJ (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{CONTCONTAPJ23}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{CONTCONTAPJ23}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTCONTAPJ23}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios   @{CONTCONTAPJ23} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTCONTAPJ23}
    E        Cadastrou os Beneficiários PJ    @{CONTCONTAPJ23}
    E        Validar Processo de Declaração de Saude    @{CONTCONTAPJ23}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTCONTAPJ23}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 24 - CONTRATO - CRIAR CONTRATO VIA COTAÇÃO PJ (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR024: CRIAR CONTRATO VIA COTAÇÃO PJ (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PJ, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTRATOCOTPJ24}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 25 - CONTRATO - CADASTRAR CONTRATO VIA COTAÇÃO PJ (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR025: CADASTRAR CONTRATO VIA COTAÇÃO PJ (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PJ, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTRATOCOTPJ25}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTRATOCOTPJ25}
    E        Salvar o Contrato PJ
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCOTPJ25}


Teste de Regressão 26 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO PJ (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR026: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO PJ (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PJ, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTRATOCOTPJ26}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios   @{CONTRATOCOTPJ26} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCOTPJ26}
    E        Cadastrou os Beneficiários PJ    @{CONTRATOCOTPJ26}
    E        Validar Processo de Declaração de Saude    @{CONTRATOCOTPJ26}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTRATOCOTPJ26}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 27 - CONTRATO - CRIAR CONTRATO VIA POTENCIAL CAEPF (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR027: CRIAR CONTRATO VIA POTENCIAL CAEPF (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061 
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTPOTCAEPF27}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTPOTCAEPF27}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTPOTCAEPF27}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 28 - CONTRATO - CADASTRAR CONTRATO VIA POTENCIAL CAEPF (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR028: CADASTRAR CONTRATO VIA POTENCIAL CAEPF (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTPOTCAEPF28}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTPOTCAEPF28}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTPOTCAEPF28}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTPOTCAEPF28}
    E        Salvar o Contrato
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTPOTCAEPF28}


Teste de Regressão 29 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA POTENCIAL CAEPF (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR029: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA POTENCIAL CAEPF (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTPOTCAEPF29}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTPOTCAEPF29}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTPOTCAEPF29}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios   @{CONTPOTCAEPF29} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTPOTCAEPF29}
    E        Cadastrou os Beneficiários CAEPF    @{CONTPOTCAEPF29}
    E        Validar Processo de Declaração de Saude    @{CONTPOTCAEPF29}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTPOTCAEPF29}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 30 - CONTRATO - CRIAR CONTRATO VIA CONTA CAEPF (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR030: CRIAR CONTRATO VIA CONTA CAEPF (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTCONTACAEPF30}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTCONTACAEPF30}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTCONTACAEPF30}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 31 - CONTRATO - CADASTRAR CONTRATO VIA CONTA CAEPF (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR031: CADASTRAR CONTRATO VIA CONTA CAEPF (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTCONTACAEPF31}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTCONTACAEPF31}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTCONTACAEPF31}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTCONTACAEPF31}
    E        Salvar o Contrato
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTCONTACAEPF31}


Teste de Regressão 32 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA CONTA CAEPF (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR032: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA CONTA CAEPF (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTCONTACAEPF32}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTCONTACAEPF32}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTCONTACAEPF32}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios   @{CONTCONTACAEPF32} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTCONTACAEPF32}
    E        Cadastrou os Beneficiários CAEPF    @{CONTCONTACAEPF32}
    E        Validar Processo de Declaração de Saude    @{CONTCONTACAEPF32}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTCONTACAEPF32}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 33 - CONTRATO - CRIAR CONTRATO VIA COTAÇÃO CAEPF (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR023: CRIAR CONTRATO VIA COTAÇÃO CAEPF (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta CAEPF, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTRATOCONTCAEPF33}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 34 - CONTRATO - CADASTRAR CONTRATO VIA COTAÇÃO CAEPF (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR034: CADASTRAR CONTRATO VIA COTAÇÃO CAEPF (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta CAEPF, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTRATOCONTCAEPF34}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTRATOCONTCAEPF34}
    E        Salvar o Contrato
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCONTCAEPF34}


Teste de Regressão 35 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO CAEPF (COLETIVO EMPRESARIAL)
    [Documentation]  BENEFICIARIO - TR035: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO CAEPF (COLETIVO EMPRESARIAL)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta CAEPF, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL    @{CONTRATOCONTCAEPF35}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios   @{CONTRATOCONTCAEPF35} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCONTCAEPF35}
    E        Cadastrou os Beneficiários CAEPF    @{CONTRATOCONTCAEPF35}
    E        Validar Processo de Declaração de Saude    @{CONTRATOCONTCAEPF35}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTRATOCONTCAEPF35}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 36 - CONTRATO - CADASTRAR CONTRATO VIA POTENCIAL CAEPF (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR036: CADASTRAR CONTRATO VIA POTENCIAL CAEPF (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTPOTCAEPF36}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTPOTCAEPF36}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTPOTCAEPF36}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTPOTCAEPF36}
    E        Salvar o Contrato
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTPOTCAEPF36}


Teste de Regressão 37 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA POTENCIAL CAEPF (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR037: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO CAEPF (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTPOTCAEPF37}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTPOTCAEPF37}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTPOTCAEPF37}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios   @{CONTPOTCAEPF37} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTPOTCAEPF37}
    E        Cadastrou os Beneficiários CAEPF    @{CONTPOTCAEPF37}
    E        Validar Processo de Declaração de Saude    @{CONTPOTCAEPF37}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTPOTCAEPF37}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 38 - CONTRATO - CRIAR CONTRATO VIA CONTA CAEPF (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR038: CRIAR CONTRATO VIA CONTA CAEPF (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTPOTCAEPF38}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTPOTCAEPF38}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTPOTCAEPF38}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 39 - CONTRATO - CADASTRAR CONTRATO VIA CONTA CAEPF (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR039: CADASTRAR CONTRATO VIA CONTA CAEPF (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTPOTCAEPF39}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTPOTCAEPF39}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTPOTCAEPF39}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTPOTCAEPF39}
    E        Salvar o Contrato
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTPOTCAEPF39}


Teste de Regressão 40 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA CONTA CAEPF (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR040: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA CONTA CAEPF (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{CONTPOTCAEPF40}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{CONTPOTCAEPF40}
    E        Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTPOTCAEPF40}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios   @{CONTPOTCAEPF40} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTPOTCAEPF40}
    E        Cadastrou os Beneficiários CAEPF    @{CONTPOTCAEPF40}
    E        Validar Processo de Declaração de Saude    @{CONTPOTCAEPF40}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTPOTCAEPF40}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Teste de Regressão 41 - CONTRATO - CRIAR CONTRATO VIA COTAÇÃO CAEPF (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR041: CRIAR CONTRATO VIA COTAÇÃO CAEPF (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta CAEPF, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTRATOCONTCAEPF41}
    Quando   Usuário clicar no menu "Criar Contrato"
    Então    CRM deve apresentar a tela Contrato » Criar


Teste de Regressão 42 - CONTRATO - CADASTRAR CONTRATO VIA COTAÇÃO CAEPF (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR042: CADASTRAR CONTRATO VIA COTAÇÃO CAEPF (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta CAEPF, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTRATOCONTCAEPF42}
    E        Clicou no menu "Criar Contrato" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Contrato PJ)  @{CONTRATOCONTCAEPF42}
    E        Salvar o Contrato
    Então    CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCONTCAEPF42}


Teste de Regressão 43 - CONTRATO - ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO CAEPF (COLETIVO POR ADESÃO)
    [Documentation]  BENEFICIARIO - TR043: ENCAMINHAR CONTRATO PARA CONFERÊNCIA VIA COTAÇÃO CAEPF (COLETIVO POR ADESÃO)
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta CAEPF, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO    @{CONTRATOCONTCAEPF43}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios   @{CONTRATOCONTCAEPF43} 
    E        CRM deve apresentar a tela Contrato » Titulo  @{CONTRATOCONTCAEPF43}
    E        Cadastrou os Beneficiários CAEPF    @{CONTRATOCONTCAEPF43}
    E        Validar Processo de Declaração de Saude    @{CONTRATOCONTCAEPF43}
    Quando   Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"   @{CONTRATOCONTCAEPF43}
    Então    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO