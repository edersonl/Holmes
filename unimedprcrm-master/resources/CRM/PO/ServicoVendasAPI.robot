*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_API}         ${API_URL}
${login_api}  ${API_USER}
${pass_api}  ${API_PASSWORD}

*** Keywords ***
Conectar na Servico Vendas API
    &{HEADERS}  Create Dictionary
    ...    Content-Type=application/json
    ...    codUnimed=qualidade

    ${AUTH}  Create List  ${login_api}  ${pass_api}
    Create Session    conectarAPI    ${URL_API}  auth=${AUTH}
    Set Test Variables    &{HEADERS}


Criar o POST e no Body colocou o JSON
    [Arguments]  @{arg1}
    Run Keyword If  '${arg1[0]}' == 'Prospect'   POST com Body PF    @{arg1}
    Run Keyword If  '${arg1[0]}' == 'Prospect_PJ'   POST com Body PJ    @{arg1}
    Run Keyword If  '${arg1[0]}' == 'Prospect_CAEPF'   POST com Body PJ    @{arg1}


POST com Body PF
    [Arguments]  @{arg1}
    ${json_string}=  catenate
    ...    {
    ...        "tipo": "${arg1[0]}",
    ...        "cpfCnpj": "${arg1[2]}",
    ...        "nomeConta": "${arg1[1]}",
    ...        "nome": "${arg1[1]}",
    ...        "numeroVidas": "${arg1[3]}",
    ...        "email": [
    ...            {
    ...                "email": "${arg1[4]}"
    ...            }
    ...        ],
    ...        "telefones": [
    ...            {
    ...                "tipo": "${arg1[5]}",
    ...                "numero": "${arg1[6]}"
    ...            }
    ...        ],
    ...        "status": "New",
    ...        "origemPotencial": "ecommerce",
    ...        "criadoPor": "primeautomacao",
    ...        "atribuidoA": "primeautomacao",
    ...        "oportunidade": [
    ...            {
    ...                "nome": "${arg1[1]}",
    ...                "dataPrevista": "${arg1[8]}",
    ...                "tipo": "${arg1[7]}",
    ...                "faseVenda": "Prospecting",
    ...                "cotacao": {
    ...                    "nome": "${arg1[1]}",
    ...                    "faseCotacao": "${arg1[9]}",
    ...                    "validoAte": "${arg1[10]}",
    ...                    "dataTabela": "${arg1[11]}",
    ...                    "tipoContratacao": "${arg1[14]}",
    ...                    "tipoCotacao": "${arg1[15]}",
    ...                    "simulacoes": [
    ...                        {
    ...                            "ordem": 1,
    ...                            "idProduto": "${arg1[12]}",
    ...                            "aprovar": true,
    ...                            "distribuicaoVidas": [
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "00",
    ...                                    "faixaAte": "18"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "19",
    ...                                    "faixaAte": "23"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "24",
    ...                                    "faixaAte": "28"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "29",
    ...                                    "faixaAte": "33"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "34",
    ...                                    "faixaAte": "38"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "39",
    ...                                    "faixaAte": "43"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "44",
    ...                                    "faixaAte": "48"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "49",
    ...                                    "faixaAte": "53"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "54",
    ...                                    "faixaAte": "58"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "59",
    ...                                    "faixaAte": "999"
    ...                                }
    ...                            ],
    ...                            "acessorios": [
    ...                                {
    ...                                    "idAcessorio": "${arg1[13]}"
    ...                                }
    ...                            ]
    ...                        }
    ...                    ]
    ...                }
    ...            }
    ...        ]
    ...    }

    ${json_string}  Convert String to JSON  ${json_string}
    Log  ${json_string}

    ${RESPOSTA}    POST On Session   conectarAPI  ${empty}
    ...     json=${json_string}
    ...     headers=&{HEADERS}

    Log            ${RESPOSTA.text}
    Set Test Variables    ${RESPOSTA}


POST com Body PJ
    [Arguments]  @{arg1}
    ${json_string}=  catenate
    ...    {
    ...        "tipo": "${arg1[0]}",
    ...        "cpfCnpj": "${arg1[2]}",
    ...        "nomeConta": "${arg1[1]}",
    ...        "nome": "${arg1[1]}",
    ...        "numeroVidas": "${arg1[3]}",
    ...        "email": [
    ...            {
    ...                "email": "${arg1[4]}"
    ...            }
    ...        ],
    ...        "telefones": [
    ...            {
    ...                "tipo": "${arg1[5]}",
    ...                "numero": "${arg1[6]}"
    ...            }
    ...        ],
    ...        "status": "New",
    ...        "origemPotencial": "ecommerce",
    ...        "criadoPor": "primeautomacao",
    ...        "atribuidoA": "primeautomacao",
    ...        "oportunidade": [
    ...            {
    ...                "nome": "${arg1[1]}",
    ...                "dataPrevista": "${arg1[8]}",
    ...                "tipo": "${arg1[7]}",
    ...                "faseVenda": "Prospecting",
    ...                "cotacao": {
    ...                    "nome": "${arg1[1]}",
    ...                    "faseCotacao": "${arg1[9]}",
    ...                    "validoAte": "${arg1[10]}",
    ...                    "dataTabela": "${arg1[11]}",
    ...                    "tipoContratacao": "${arg1[16]}",
    ...                    "tipoCotacao": "${arg1[17]}",
    ...                    "simulacoes": [
    ...                        {
    ...                            "ordem": 1,
    ...                            "idProduto": "${arg1[12]}",
    ...                            "aprovar": true,
    ...                            "distribuicaoVidas": [
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "00",
    ...                                    "faixaAte": "18"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "19",
    ...                                    "faixaAte": "23"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "24",
    ...                                    "faixaAte": "28"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "29",
    ...                                    "faixaAte": "33"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "34",
    ...                                    "faixaAte": "38"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "39",
    ...                                    "faixaAte": "43"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "44",
    ...                                    "faixaAte": "48"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "49",
    ...                                    "faixaAte": "53"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "54",
    ...                                    "faixaAte": "58"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "59",
    ...                                    "faixaAte": "999"
    ...                                }
    ...                            ],
    ...                            "acessorios": [
    ...                                {
    ...                                    "idAcessorio": "${arg1[13]}"
    ...                                }
    ...                            ]
    ...                        },
    ...                        {
    ...                            "ordem": 2,
    ...                            "idProduto": "${arg1[14]}",
    ...                            "aprovar": true,
    ...                            "distribuicaoVidas": [
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "00",
    ...                                    "faixaAte": "18"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "19",
    ...                                    "faixaAte": "23"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "24",
    ...                                    "faixaAte": "28"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "29",
    ...                                    "faixaAte": "33"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "34",
    ...                                    "faixaAte": "38"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "39",
    ...                                    "faixaAte": "43"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "44",
    ...                                    "faixaAte": "48"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "49",
    ...                                    "faixaAte": "53"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "54",
    ...                                    "faixaAte": "58"
    ...                                },
    ...                                {
    ...                                    "vidas": "1",
    ...                                    "faixaDe": "59",
    ...                                    "faixaAte": "999"
    ...                                }
    ...                            ],
    ...                            "acessorios": [
    ...                                {
    ...                                    "idAcessorio": "${arg1[15]}"
    ...                                }
    ...                            ]
    ...                        }
    ...                    ]
    ...                }
    ...            }
    ...        ]
    ...    }

    ${json_string}  Convert String to JSON  ${json_string}
    Log  ${json_string}

    ${RESPOSTA}    POST On Session   conectarAPI  ${empty}
    ...     json=${json_string}
    ...     headers=&{HEADERS}

    Log            ${RESPOSTA.text}
    Set Test Variables    ${RESPOSTA}
    

Conferir o status code
    [Arguments]  ${arg1}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${arg1}


Validou o retorno
    ${objetoConta}  Set Variables  ${RESPOSTA.json()['retorno'][0]['objeto']}
    ${mensagemConta}  Set Variables  ${RESPOSTA.json()['retorno'][0]['mensagens']}
    ${idCRMConta}  Set Variables  ${RESPOSTA.json()['retorno'][0]['idCRM']}
    ${identificadorConta}  Set Variables  ${RESPOSTA.json()['retorno'][0]['identificador']}
    Should Be Equal  ${mensagemConta[0]}  Conta Gravada com sucesso
    Log  A <b>${objetoConta}</b> foi gravada apresentando a mensagem <b>${mensagemConta[0]}</b>, possui o ID CRM <b>${idCRMConta}</b> e o Identificador <b>${identificadorConta}</b>.  INFO  True

    ${objetoOportunidade}  Set Variables  ${RESPOSTA.json()['retorno'][1]['objeto']}
    ${mensagemOportunidade}  Set Variables  ${RESPOSTA.json()['retorno'][1]['mensagens']}
    ${idCRMOportunidade}  Set Variables  ${RESPOSTA.json()['retorno'][1]['idCRM']}
    ${identificadorOportunidade}  Set Variables  ${RESPOSTA.json()['retorno'][1]['identificador']}
    Should Be Equal  ${mensagemOportunidade[0]}  Oportunidade Gravada com sucesso
    Log  A <b>${objetoOportunidade}</b> foi gravada apresentando a mensagem <b>${mensagemOportunidade[0]}</b>, possui o ID CRM <b>${idCRMOportunidade}</b> e o Identificador <b>${identificadorOportunidade}</b>.  INFO  True

    ${objetoCotacao}  Set Variables  ${RESPOSTA.json()['retorno'][2]['objeto']}
    ${mensagemCotacao}  Set Variables  ${RESPOSTA.json()['retorno'][2]['mensagens']}
    ${idCRMCotacao}  Set Variables  ${RESPOSTA.json()['retorno'][2]['idCRM']}
    ${identificadorCotacao}  Set Variables  ${RESPOSTA.json()['retorno'][2]['identificador']}
    Should Be Equal  ${mensagemCotacao[0]}  Cotação Gravada com sucesso
    Log  A <b>${objetoCotacao}</b> foi gravada apresentando a mensagem <b>${mensagemCotacao[0]}</b>, possui o ID CRM <b>${idCRMCotacao}</b> e o Identificador <b>${identificadorCotacao}</b>.  INFO  True