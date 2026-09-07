# Instruções de Instalação - Painel de Testes 192.168.1.78

## 🎯 Ambiente CRM Unimed PR - Homologação

| Item | Valor |
|------|-------|
| Servidor CRM | 192.168.1.78 |
| URL CRM | http://192.168.1.78/crm-homologa-projeto-975/ |
| Comparador | http://192.168.1.78/comparador/ |
| URL Painel | http://192.168.1.78/testesCRM |
| Banco MySQL | homologa_mci_975 (192.168.1.79:3306) |

---

## ⚠️ Nota Importante

A instalação automática não está disponível devido às restrições de acesso remoto no servidor.

Você precisará realizar os seguintes passos **no servidor 192.168.1.78**:

---

## 📋 Passos para Instalação

### Passo 1: Copiar os arquivos para o servidor

**No seu computador:**
1. Copie o diretório `tests\playwright\backend` do projeto
2. Acesse o servidor 192.168.1.78 via RDP
3. Cole os arquivos em: `C:\crm-unimed\tests\playwright\backend`

**Ou via Explorer:**
```
Origem: c:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\tests\playwright\backend
Destino: \\192.168.1.78\c$\crm-unimed\tests\playwright\backend
```

---

### Passo 2: Criar o arquivo .env

No servidor 192.168.1.78, crie o arquivo:
`C:\crm-unimed\tests\playwright\backend\.env`

Com o seguinte conteúdo:
```
PORT=3500
NODE_ENV=production
CRM_PROJECT_DIR=C:\crm-unimed
```

---

### Passo 3: Instalar Node.js (se necessário)

Acesse o servidor e verifique se Node.js 22+ está instalado:

```cmd
node --version
```

Se não estiver instalado, baixe e instale:
**https://nodejs.org/** (versão 22+)

---

### Passo 4: Iniciar o servidor

No servidor 192.168.1.78:
```cmd
cd c:\crm-unimed\tests\playwright\backend
node src/server.js
```

O servidor iniciará na porta 3500.

---

## ✅ Acesso ao Painel

Após a instalação, acesse:

```
http://192.168.1.78:3500
http://192.168.1.78:3500/panel
http://192.168.1.78:3500/api/docs
```

---

## 📁 Scripts Disponíveis

| Script | Função |
|--------|--------|
| `copiar-backend-para-servidor.ps1` | Copiar backend para servidor |
| `instalar-servidor-local.ps1` | Instalar e iniciar no servidor |

---

## 🔧 Requisitos do Servidor

- Node.js 22+ instalado
- Diretório `C:\crm-unimed\tests\playwright\backend` criado
- Arquivo `.env` configurado

---

**Para mais detalhes, consulte:**
- `.inventory\README.md` - Documentação geral do sistema
- `.inventory\README-SERVIDOR-192.168.1.78.md` - Documentação do servidor