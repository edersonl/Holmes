# Painel de Testes - Servidor 192.168.1.78

## 🎯 Ambiente CRM Unimed PR - Homologação

| Item | Valor |
|------|-------|
| **Servidor CRM** | 192.168.1.78 |
| **URL CRM** | http://192.168.1.78/crm-homologa-projeto-975/ |
| **Comparador** | http://192.168.1.78/comparador/ |
| **URL Painel** | http://192.168.1.78/testesCRM |
| **Banco MySQL** | homologa_mci_975 (192.168.1.79:3306) |

## Passo 1: Copiar o Backend para o Servidor

Execute este comando no seu computador (como Administrador):

```cmd
.\.inventory\scripts\copiar-backend-192.168.1.78.cmd
```

Ou manualmente:
1. Copie `tests\playwright\backend` do projeto
2. Cole para `\\192.168.1.78\c$\crm-unimed\tests\playwright\backend`

## Passo 2: Iniciar o Servidor no 192.168.1.78

### Opção A: Usando PowerShell Remoto (Recomendado)

```powershell
cd .inventory\scripts
.\iniciar-servidor-192.168.1.78.ps1 -Username "Administrator" -Password "sua_senha"
```

### Opção B: Acessar o Servidor Manualmente

1. RDP ou Acesso remoto ao servidor 192.168.1.78
2. Execute:

```cmd
cd c:\crm-unimed\tests\playwright\backend
node src/server.js
```

## Passo 3: Acessar o Painel

No navegador, acesse:

```
http://192.168.1.78/testesCRM
http://192.168.1.78/testesCRM/panel
http://192.168.1.78/testesCRM/api/docs
```

## Configuração do Backend

Antes de iniciar, verifique se o arquivo `.env` existe em `tests\playwright\backend\.env`:

```
PORT=3500
NODE_ENV=production
CRM_PROJECT_DIR=C:\crm-unimed
AZURE_DEVOPS_TOKEN=seu_token_aqui
ADMIN_TOKEN=seu_token_admin_aqui
```

## Status do Servidor

Após iniciar, o servidor mostrará:

```
╔══════════════════════════════════════════════════════╗
║  CRM Test Panel - Backend                           ║
║  Painel de Execução de Testes Automatizados         ║
╚══════════════════════════════════════════════════════╝

[server] ✓ Servidor rodando na porta 3500
[server]   Local:  http://localhost:3500/api/docs
[server]   Rede:   http://192.168.1.78:3500/api/docs
[server]   Socket: ws://192.168.1.78:3500
```

## Verificar Status do Servidor

```cmd
curl http://192.168.1.78:3500/api/docs
```

## Parar o Servidor

No terminal onde o servidor está rodando:
- Pressione `Ctrl + C`

Ou via PowerShell:

```powershell
Stop-Process -Name node -Id <PID_do_processo>
```

---

**Importante**: O servidor precisa estar rodando para que os usuários possam acessar o painel.