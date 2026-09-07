# Scripts de Instalação - Servidor 192.168.1.78

## 🎯 Ambiente CRM Unimed PR - Homologação

| Item | Valor |
|------|-------|
| **Servidor CRM** | 192.168.1.78 |
| **URL CRM** | http://192.168.1.78/crm-homologa-projeto-975/ |
| **Comparador** | http://192.168.1.78/comparador/ |
| **URL Painel** | http://192.168.1.78/testesCRM |
| **Banco MySQL** | homologa_mci_975 (192.168.1.79:3306) |

---

## 📋 Passos para Instalação

### Opção 1: Instalação Manual (Recomendada)

**No seu computador:**

1. Copie o diretório `tests\playwright\backend` do projeto:
   ```
   c:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\tests\playwright\backend
   ```

2. Acesse o servidor 192.168.1.78 via RDP ou acesso remoto

3. Crie o diretório no servidor:
   ```
   C:\crm-unimed\tests\playwright\backend
   ```

4. Copie os arquivos para o servidor

**No servidor 192.168.1.78:**

1. Crie o arquivo `C:\crm-unimed\tests\playwright\backend\.env` com:
   ```
   PORT=3500
   NODE_ENV=production
   CRM_PROJECT_DIR=C:\crm-unimed
   AZURE_DEVOPS_TOKEN=seu_token_aqui
   ADMIN_TOKEN=seu_token_admin_aqui
   ```

2. Instale Node.js 22+ se não estiver instalado:
   - Baixe em: https://nodejs.org/

3. Execute o script de instalação:
   ```cmd
   cd c:\crm-unimed\tests\playwright\backend
   node src/server.js
   ```

---

### Opção 2: Usando Script PowerShell

**No seu computador:**

1. Execute o script para copiar os arquivos:
   ```powershell
   cd "c:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\.inventory\scripts"
   ./copiar-backend-para-servidor.ps1
   ```

**No servidor 192.168.1.78:**

1. Execute o script de instalação:
   ```powershell
   cd c:\crm-unimed\tests\playwright\backend
   node src/server.js
   ```

---

## ⚠️ Requisitos do Servidor

- **Node.js 22+** instalado
- Diretório `C:\crm-unimed\tests\playwright\backend` criado
- Arquivo `.env` configurado

---

## ✅ Acesso ao Painel

Após a instalação, acesse:

```
http://192.168.1.78:3500
http://192.168.1.78:3500/panel
http://192.168.1.78:3500/api/docs
```

---

## 📝 Resumo do que precisa ser feito

1. ✅ Copiar `tests\playwright\backend` para `C:\crm-unimed\tests\playwright\backend` no servidor
2. ✅ Criar arquivo `C:\crm-unimed\tests\playwright\backend\.env`
3. ✅ Instalar Node.js 22+ no servidor (se não estiver instalado)
4. ✅ Iniciar servidor: `node src/server.js`

---

**Importante**: O servidor 192.168.1.78 precisa ter Node.js 22+ instalado e o diretório `C:\crm-unimed\tests\playwright\backend` criado.