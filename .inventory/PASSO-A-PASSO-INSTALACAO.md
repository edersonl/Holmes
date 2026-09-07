# Guia de Instalação Rápida - QA-crm-test-panel

## Credenciais do Servidor 192.168.1.78

| Item | Valor |
|------|-------|
| **Host** | 192.168.1.78 |
| **Usuário SSH** | crm |
| **Senha SSH** | Banco$975$med |

---

## Passo 1: Copiar Script para o Servidor

Use o WinSCP para copiar este arquivo para o servidor:
- Arquivo: `.inventory/scripts/instalar-tudo-linux.sh`
- Destino: `/tmp/instalar-tudo-linux.sh`

---

## Passo 2: Executar Instalação

Acesse o servidor via SSH:

```bash
ssh crm@192.168.1.78
```

Execute os comandos:

```bash
# Tornar script executável
chmod +x /tmp/instalar-tudo-linux.sh

# Executar instalação
bash /tmp/instalar-tudo-linux.sh
```

---

## O Que Este Script Faz

1. Instala Node.js 22 (se não estiver instalado)
2. Instala as dependências do Node.js (`npm install`)
3. Cria o arquivo `.env` com as configurações
4. Cria o serviço systemd `qa-crm-test-panel`
5. Inicia o serviço
6. Configura o Nginx para `/QA-crm-test-panel`
7. Recarrega o Nginx

---

## Acessar o Painel

Após a instalação, acesse:

```
http://192.168.1.78/QA-crm-test-panel
```

Ou diretamente na porta:

```
http://192.168.1.78:3500
```

---

## Comandos Úteis

```bash
# Ver status do serviço
sudo systemctl status qa-crm-test-panel

# Ver logs
sudo journalctl -u qa-crm-test-panel -f

# Reiniciar serviço
sudo systemctl restart qa-crm-test-panel

# Parar serviço
sudo systemctl stop qa-crm-test-panel

# Iniciar serviço
sudo systemctl start qa-crm-test-panel
```

---

## Solução de Problemas

### Se o script falhar

1. Verifique se o diretório `/var/www/html/QA-crm-test-panel/backend` existe
2. Copie o arquivo `.env-linux` manualmente para `/var/www/html/QA-crm-test-panel/backend/.env`
3. Execute manualmente:

```bash
cd /var/www/html/QA-crm-test-panel/backend
npm install --production

sudo systemctl daemon-reload
sudo systemctl enable qa-crm-test-panel
sudo systemctl start qa-crm-test-panel
```