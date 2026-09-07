# Relatório de Confronto EA x Código

**Data**: 2026-09-02T03:56:54.847Z

## Resumo

| Status | Quantidade |
|--------|------------|
| CONFORME | 0 |
| NÃO CONFORME | 3 |

## Detalhamento

### Validação de CPF (R001)

| Item | Status |
|------|--------|
| EA Enterprise | Existe |
| Código | Não existe |
| Banco | beneficiarios.cpf |
| Integração | API/ValidaCPF |
| Resultado | true/false |

**Status Final**: NÃO CONFORME

**Justificativa**: Arquivo modules/Beneficiarios/service/ValidacaoService.php não encontrado

### Cálculo de Comissão (R002)

| Item | Status |
|------|--------|
| EA Enterprise | Existe |
| Código | Não existe |
| Banco | comissionamento.valores |
| Integração | API/CalculaComissao |
| Resultado | valor_monetário |

**Status Final**: NÃO CONFORME

**Justificativa**: Arquivo modules/Comissionamento/service/ComissaoService.php não encontrado

### Validação de Portabilidade (R003)

| Item | Status |
|------|--------|
| EA Enterprise | Existe |
| Código | Não existe |
| Banco | portabilidade.solicitacoes |
| Integração | API/ValidaPortabilidade |
| Resultado | aprovado/rejeitado |

**Status Final**: NÃO CONFORME

**Justificativa**: Arquivo modules/Portabilidade/service/ValidacaoService.php não encontrado

