# Instruções de Instalação QA-crm-test-panel

## Requisitos

- Servidor Linux Debian/Ubuntu
- Node.js 22 ou superior
- Apache2
- Acesso SSH com permissões de root

## Credenciais do Servidor

- **IP:** 192.168.1.78
- **Usuário SSH:** treinamento
- **Senha:** (fornecida pelo administrador)

## Como Instalar

### Opção 1: Copiar e Executar Manualmente

1. **Copiar o script para o servidor:**
   ```powershell
   scp "c:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\.inventory\scripts\instalar-tudo-linux.sh" treinamento@192.168.1.78:/tmp/
   ```

2. **Conectar via SSH:**
   ```powershell
   ssh treinamento@192.168.1.78
   ```

3. **Executar a instalação:**
   ```bash
   cd /tmp
   chmod +x instalar-tudo-linux.sh
   bash instalar-tudo-linux.sh
   ```

### Opção 2: Executar Diretamente via SSH

No seu computador Windows (PowerShell):

```powershell
type "c:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\.inventory\scripts\instalar-tudo-linux.sh" | ssh treinamento@192.168.1.78 "bash -s"
```

Ou:

```powershell
ssh treinamento@192.168.1.78 "bash -s" < "c:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\.inventory\scripts\instalar-tudo-linux.sh"
```

## Pós-Instalação

Acesse o sistema em:
```
http://192.168.1.78/testesCRM/
```

## Configurações do Sistema

### Backend
- Porta: 3500
- Diretório: `/var/www/html/QA-crm-test-panel/backend`
- Serviço: `qa-crm-test-panel` (systemd)
- Node.js: `/usr/local/bin/node` (versão 22)

### Apache2
- Configuração: `/etc/apache2/sites-available/testesCRM.conf`
- Site habilitado: `/etc/apache2/sites-enabled/testesCRM.conf`
- Logs: `/var/log/apache2/testesCRM-*.log`

### Banco de Dados CRM
- **CRM032 (Produção):** 192.168.18.210
- **CRM975 (Produção):** 192.168.18.189
- **CRM_OUTROS (Produção):** 192.168.18.152

Usuário: `desenv`
Senha: `rotzooi`

## Serviços Relacionados

- **Test Panel (Interface):** `http://192.168.1.78/testesCRM/`
- **API Health:** `http://192.168.1.78/testesCRM/api/health`
- **Swagger Docs:** `http://192.168.1.78/testesCRM/api/docs`

## Verificação da Instalação

Após a instalação, verifique se está tudo funcionando:

1. **Teste a API diretamente:**
   ```bash
   curl http://127.0.0.1:3500/api/health
   ```

2. **Acesse o painel pelo navegador:**
   ```
   http://192.168.1.78/testesCRM/
   ```

3. **Verifique o status do serviço:**
   ```bash
   systemctl status qa-crm-test-panel
   ```

## Contato

Para suporte, entre em contato com a equipe de desenvolvimento.