# Migracao para Playwright Test

A automacao nova usa Playwright Test com Chromium. Os arquivos Robot existentes permanecem no repositorio durante a migracao para preservar regras, fluxos e massas de teste.

## Configuracao

Defina as variaveis no ambiente do terminal. Nao copie credenciais para arquivos versionados:

```powershell
$env:CRM_URL = 'http://servidor-crm/crm-qualidade/index.php'
$env:CRM_USER = 'usuario_crm'
$env:CRM_PASSWORD = 'senha_crm'
$env:CRM_USER_NAME = 'Nome exibido no CRM'
```

As URLs `CANAL_URL`, `GERADOR_URL` e `API_URL` podem ser adicionadas quando o fluxo correspondente for migrado.

## Execucao

```powershell
npm install
npx playwright install chromium
npm run test:e2e
```

O teste equivalente ao TR010 fica em `playwright/tests/CRM/contas.spec.ts`. Sem as variaveis de ambiente ele aparece como skipped, permitindo validar a instalacao sem acessar o CRM.

## Mapeamento

| Robot/Selenium | Playwright Test |
| --- | --- |
| `Open Browser` / `Go To` | `page.goto` |
| `Input Text` | `locator.fill` |
| `Click Element` / `Click Link` | `locator.click` ou `getByRole` |
| `Wait Until...` | assertions web-first (`expect(...).toBeVisible`) |
| Page Objects `.robot` | classes em `playwright/pages` |
| massa em `resources/**/data` | dados em `playwright/data` |

A migracao deve seguir por fatias de fluxo, mantendo os nomes dos cenarios e os arquivos de massa originais ate cada fatia ser validada em Chromium.
