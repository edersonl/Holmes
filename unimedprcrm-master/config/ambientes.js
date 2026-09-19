/**
 * =============================================================================
 * Registro central de ambientes do CRM (multi-MCI)
 * =============================================================================
 *
 * Ponto único de configuração dos ambientes onde os testes rodam. Cada ambiente
 * possui a URL base do CRM e as credenciais de login. Isso permite executar o
 * mesmo teste em qualquer singular/ambiente apenas trocando a variável de
 * ambiente CRM_ENV.
 *
 * Seleção do ambiente (ordem de precedência):
 *   1. Parâmetro explícito passado para getAmbiente('chave')
 *   2. Variável de ambiente CRM_ENV
 *   3. Ambiente padrão (AMBIENTE_PADRAO) = 'qualidade-mci'
 *
 * Overrides via env var (aplicados sobre o ambiente selecionado):
 *   CRM_BASE_URL  - sobrescreve a URL base
 *   CRM_USER      - sobrescreve o usuário de login
 *   CRM_PASSWORD  - sobrescreve a senha de login
 *
 * Uso:
 *   const { getAmbiente } = require('./ambientes');
 *   const amb = getAmbiente();                 // usa CRM_ENV ou padrão
 *   const amb = getAmbiente('homologa-975');   // força um ambiente
 *   await page.goto(amb.loginUrl);
 *
 * Exemplos (PowerShell):
 *   $env:CRM_ENV = "homologa-975"; npx playwright test
 *   $env:CRM_ENV = "apucarana-151"; npx playwright test
 *
 * Fonte das URLs: tests/playwright/fixtures/GFI/singulares.json
 * =============================================================================
 */

const AMBIENTE_PADRAO = 'qualidade-mci';

// Login padrão usado nos ambientes (pode ser sobrescrito por ambiente ou env var).
const LOGIN_PADRAO = { user: 'kautomatico', password: 'Unimed975@', name: 'Kiro Automatizador' };

// URLs do RabbitMQ por ambiente
const RABBITMQ_POR_AMBIENTE = {
    'qualidade-mci': {
        managementUrl: 'http://192.168.1.78:15672/#/',
    },
    'homologa-975': {
        managementUrl: 'http://192.168.90.30:15690/#/queues',
    },
    'apucarana-151': {
        managementUrl: 'http://192.168.90.30:15698/#/',
    },
    'francisco-beltrao-168': {
        managementUrl: 'http://rabbitdev.notus.tec.br:15685/#/',
    },
    'norte-147': {
        managementUrl: 'http://192.168.90.30:15693/#',
    },
    'curitiba-032': null,
    'homologa-183': null,
    'develop': null,
};

/**
 * Registro de ambientes. A chave é o identificador usado em CRM_ENV.
 * Cada entrada: { nome, codigo, crmBase, login: { user, password }, banco, rabbitMq }
 * - crmBase: URL raiz do CRM (sem /index.php)
 * - banco: nome do schema MySQL correspondente (para helpers de massa via banco)
 * - rabbitMq: URL do painel RabbitMQ (ou null se não houver)
 */
const AMBIENTES = {
    'qualidade-mci': {
        nome: 'Federação do Paraná - Qualidade MCI',
        codigo: '975',
        crmBase: 'http://192.168.1.78/crm-qualidade-mci',
        login: { ...LOGIN_PADRAO },
        banco: 'homologa_mci_975',
        rabbitMq: RABBITMQ_POR_AMBIENTE['qualidade-mci'],
    },
    'homologa-975': {
        nome: 'Federação do Paraná - Homologa Projeto',
        codigo: '975',
        crmBase: 'http://192.168.1.78/crm-homologa-projeto-975',
        login: { ...LOGIN_PADRAO },
        banco: 'homologa_mci_975',
        rabbitMq: RABBITMQ_POR_AMBIENTE['homologa-975'],
    },
    'apucarana-151': {
        nome: 'Apucarana',
        codigo: '151',
        crmBase: 'http://192.168.1.78/crm-homologa-projeto-151',
        login: { ...LOGIN_PADRAO },
        banco: 'homologa_mci_151',
        rabbitMq: RABBITMQ_POR_AMBIENTE['apucarana-151'],
    },
    'norte-147': {
        nome: 'Norte do Paraná',
        codigo: '147',
        crmBase: 'http://192.168.1.78/crm-homologa-projeto-147',
        login: { ...LOGIN_PADRAO },
        banco: 'homologa_mci_147',
        rabbitMq: RABBITMQ_POR_AMBIENTE['norte-147'],
    },
    'francisco-beltrao-168': {
        nome: 'Francisco Beltrão',
        codigo: '168',
        crmBase: 'http://192.168.1.78/crm-homologa-projeto-168',
        login: { ...LOGIN_PADRAO },
        banco: 'homologa_mci_168',
        rabbitMq: RABBITMQ_POR_AMBIENTE['francisco-beltrao-168'],
    },
    'curitiba-032': {
        nome: 'Curitiba',
        codigo: '032',
        crmBase: 'http://192.168.1.78/crm-homologa-projeto-032',
        login: { ...LOGIN_PADRAO },
        banco: 'homologa_mci_032',
        rabbitMq: RABBITMQ_POR_AMBIENTE['curitiba-032'],
    },
    'homologa-183': {
        nome: 'Singular 183',
        codigo: '183',
        crmBase: 'http://192.168.1.78/crm-homologa-projeto-183',
        login: { ...LOGIN_PADRAO },
        banco: 'homologa_mci_183',
        rabbitMq: RABBITMQ_POR_AMBIENTE['homologa-183'],
    },
    'develop': {
        nome: 'Develop MCI',
        codigo: 'develop',
        crmBase: 'http://localhost/crm-develop-mci',
        login: { ...LOGIN_PADRAO },
        banco: 'develop_mci',
        rabbitMq: RABBITMQ_POR_AMBIENTE['develop'],
    },
};

/**
 * Resolve a chave do ambiente a partir do argumento, env var ou padrão.
 * @param {string} [chave]
 * @returns {string}
 */
function resolverChave(chave) {
    return chave || process.env.CRM_ENV || AMBIENTE_PADRAO;
}

/**
 * Retorna a configuração completa de um ambiente, já com URLs derivadas e
 * overrides de env var aplicados.
 *
 * @param {string} [chave] - Chave do ambiente (ver AMBIENTES). Default: CRM_ENV ou 'qualidade-mci'.
 * @returns {{
 *   chave: string, nome: string, codigo: string, banco: string,
 *   crmBase: string, baseUrl: string, loginUrl: string,
 *   login: { user: string, password: string, name: string },
 *   detailUrl: (module: string, record: string) => string,
 *   moduleUrl: (module: string, action?: string, extra?: string) => string,
 *   rabbitMq: { managementUrl: string } | null
 * }}
 */
function getAmbiente(chave) {
    const key = resolverChave(chave);
    const base = AMBIENTES[key];

    if (!base) {
        const disponiveis = Object.keys(AMBIENTES).join(', ');
        throw new Error(
            `[ambientes] Ambiente desconhecido: "${key}". ` +
            `Defina CRM_ENV com um dos valores: ${disponiveis}.`
        );
    }

    // Overrides via env var
    const crmBase = process.env.CRM_BASE_URL || base.crmBase;
    const user = process.env.CRM_USER || base.login.user;
    const password = process.env.CRM_PASSWORD || base.login.password;
    const userName = process.env.CRM_USER_NAME || base.login.name;

    const baseUrl = `${crmBase.replace(/\/+$/, '')}/index.php`;

    return {
        chave: key,
        nome: base.nome,
        codigo: base.codigo,
        banco: base.banco,
        crmBase,
        baseUrl,
        loginUrl: `${baseUrl}?action=Login&module=Users`,
        login: { user, password, name: userName },
        detailUrl: (module, record) => `${baseUrl}?module=${module}&action=DetailView&record=${record}`,
        moduleUrl: (module, action = 'index', extra = '') =>
            `${baseUrl}?module=${module}&action=${action}${extra ? `&${extra}` : ''}`,
        rabbitMq: base.rabbitMq,
    };
}

/** Lista as chaves de ambiente disponíveis. */
function listarAmbientes() {
    return Object.keys(AMBIENTES);
}

module.exports = {
    getAmbiente,
    listarAmbientes,
    AMBIENTES,
    AMBIENTE_PADRAO,
    LOGIN_PADRAO,
    RABBITMQ_POR_AMBIENTE,
};