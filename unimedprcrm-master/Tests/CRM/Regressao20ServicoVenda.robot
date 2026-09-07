*** Settings ***
Resource    ../../main.resource

Suite Setup      Instancia Variaveis    20

*** Test Cases ***
Teste de Regressão 01 - SERVIÇO VENDA - EXECUTAR SERVIÇO DE VENDA DE CONTA PF
    [Documentation]  SERVIÇO VENDA - TR001: EXECUTAR SERVIÇO DE VENDA DE CONTA PF
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado   Usuario Conectar na Servico Vendas API
    E      Criou o POST e no Body colocou o JSON  @{SERVICOVENDAPF01}
    Então  Deve apresentar "200 OK"
    E      Validar o retorno


Teste de Regressão 02 - SERVIÇO VENDA - EXECUTAR SERVIÇO DE VENDA DE CONTA PJ COLETIVO EMPRESARIAL
    [Documentation]  SERVIÇO VENDA - TR002: EXECUTAR SERVIÇO DE VENDA DE CONTA PJ COLETIVO EMPRESARIAL
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado   Usuario Conectar na Servico Vendas API
    E      Criou o POST e no Body colocou o JSON  @{SERVICOVENDAPJ02}
    Então  Deve apresentar "200 OK"
    E      Validar o retorno


Teste de Regressão 03 - SERVIÇO VENDA - EXECUTAR SERVIÇO DE VENDA DE CONTA PJ COLETIVO POR ADESÃO
    [Documentation]  SERVIÇO VENDA - TR003: EXECUTAR SERVIÇO DE VENDA DE CONTA PJ COLETIVO POR ADESÃO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado   Usuario Conectar na Servico Vendas API
    E      Criou o POST e no Body colocou o JSON  @{SERVICOVENDAPJ03}
    Então  Deve apresentar "200 OK"
    E      Validar o retorno


Teste de Regressão 04 - SERVIÇO VENDA - EXECUTAR SERVIÇO DE VENDA DE CONTA CAEPF COLETIVO EMPRESARIAL
    [Documentation]  SERVIÇO VENDA - TR004: EXECUTAR SERVIÇO DE VENDA DE CONTA CAEPF COLETIVO EMPRESARIAL
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado   Usuario Conectar na Servico Vendas API
    E      Criou o POST e no Body colocou o JSON  @{SERVICOVENDACAEPF04}
    Então  Deve apresentar "200 OK"
    E      Validar o retorno


Teste de Regressão 05 - SERVIÇO VENDA - EXECUTAR SERVIÇO DE VENDA DE CONTA CAEPF COLETIVO POR ADESÃO
    [Documentation]  SERVIÇO VENDA - TR005: EXECUTAR SERVIÇO DE VENDA DE CONTA CAEPF COLETIVO POR ADESÃO
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado   Usuario Conectar na Servico Vendas API
    E      Criou o POST e no Body colocou o JSON  @{SERVICOVENDACAEPF05}
    Então  Deve apresentar "200 OK"
    E      Validar o retorno