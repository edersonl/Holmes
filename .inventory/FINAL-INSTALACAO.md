# Instalação QA-crm-test-panel - Passo a Passo

## Credenciais do Servidor 192.168.1.78

| Item | Valor |
|------|-------|
| **Host** | 192.168.1.78 |
| **Porta SSH** | 22 |
| **Usuário** | crm |
| **Senha** | [AGUARDANDO CONFIRMAÇÃO] |

---

## O Que Foi Preparado

1. ✅ Script de instalação: `.inventory/scripts/instalar-tudo-linux.sh`
2. ✅ Arquivo .env: `.inventory/scripts/.env-linux`
3. ✅ Configuração Nginx: `.inventory/nginx/qa-crm-test-panel.conf`

---

## O Que Você Precisa Fazer

### Opção 1: Manual via WinSCP (Recomendado)

1. **Abra o WinSCP**
2. **Conecte-se:**
   - Host: 192.168.1.78
   - Port: 22
   - User: crm
   - Password: [SUA SENHA]

3. **Copie os arquivos:**
   - `instalar-tudo-linux.sh` → `/tmp/instalar-tudo-linux.sh`
   - `.env-linux` → `/var/www/html/QA-crm-test-panel/backend/.env`

4. **No Terminal do WinSCP, execute:**
```bash
chmod +x /tmp/instalar-tudo-linux.sh
bash /tmp/instalar-tudo-linux.sh
```

### Opção 2: Manual via SSH

```bash
# Acessar o servidor
ssh -P 22 crm@192.168.1.78

# Copiar o script manualmente
# (use WinSCP ou outro método para copiar os arquivos)

# Executar instalação
chmod +x /tmp/instalar-tudo-linux.sh
bash /tmp/instalar-tudo-linux.sh
```

---

## O Script de Instalação Faz

1. Instala Node.js 22 (se não estiver instalado)
2. Instala as dependências do Node.js
3. Cria o arquivo .env se não existir
4. Cria o serviço systemd `qa-crm-test-panel`
5. Inicia o serviço
6. Configura o Nginx para `/QA-crm-test-panel`
7. Recarrega o Nginx

---

## Acessar o Painel

Após a instalação:
```
http://192.168.1.78/QA-crm-test-panel
```

Ou diretamente:
```
http://192.168.1.78:3500
```

---

## Comandos Úteis

```bash
# Verificar status do serviço
sudo systemctl status qa-crm-test-panel

# Ver logs
sudo journalctl -u qa-crm-test-panel -f

# Reiniciar serviço
sudo systemctl restart qa-crm-test-panel
```

---

**Por favor, informe a senha correta do servidor para que eu possa executar a instalação automaticamente.**