/**
 * Fonte oficial dos ambientes homologados aceitos pelo Holmes.
 */
const ORACLE_COMPARTILHADO = {
  host: '192.168.91.15',
  port: 10110,
  sid: 'crm975',
};

const RABBITMQ_POR_AMBIENTE = {
  'qualidade-mci': {
    managementUrl: 'http://192.168.1.78:15672/#/',
  },
};

const AMBIENTES = {
  'qualidade-mci': {
    nome: 'Federação do Paraná - Qualidade MCI',
    codigo: '975',
    crmBase: 'http://192.168.1.78/crm-qualidade-mci',
    banco: 'homologa_mci_975',
  },
  'curitiba-032': {
    nome: 'Curitiba',
    codigo: '032',
    crmBase: 'http://192.168.1.78/crm-homologa-projeto-032',
    banco: 'homologa_mci_032',
  },
  'norte-147': {
    nome: 'Norte do Paraná',
    codigo: '147',
    crmBase: 'http://192.168.1.78/crm-homologa-projeto-147',
    banco: 'homologa_mci_147',
  },
  'apucarana-151': {
    nome: 'Apucarana',
    codigo: '151',
    crmBase: 'http://192.168.1.78/crm-homologa-projeto-151',
    banco: 'homologa_mci_151',
  },
  'francisco-beltrao-168': {
    nome: 'Francisco Beltrão',
    codigo: '168',
    crmBase: 'http://192.168.1.78/crm-homologa-projeto-168',
    banco: 'homologa_mci_168',
  },
  'homologa-975': {
    nome: 'Federação do Paraná - Homologa Projeto',
    codigo: '975',
    crmBase: 'http://192.168.1.78/crm-homologa-projeto-975',
    banco: 'homologa_mci_975',
  },
};

function getAmbiente(chave) {
  const key = chave || process.env.CRM_ENV;
  if (!key) {
    throw new Error('[ambientes] CRM_ENV é obrigatório para executar o Holmes.');
  }

  const ambiente = AMBIENTES[key];
  if (!ambiente) {
    throw new Error(`[ambientes] Ambiente não permitido: "${key}". Valores aceitos: ${Object.keys(AMBIENTES).join(', ')}.`);
  }

  const crmBase = ambiente.crmBase;
  const baseUrl = `${crmBase.replace(/\/+$/, '')}/index.php`;

  return {
    chave: key,
    ...ambiente,
    crmBase,
    baseUrl,
    oracle: ORACLE_COMPARTILHADO,
    rabbitMq: RABBITMQ_POR_AMBIENTE[key],
    loginUrl: `${baseUrl}?action=Login&module=Users`,
    detailUrl: (module, record) => `${baseUrl}?module=${module}&action=DetailView&record=${record}`,
    moduleUrl: (module, action = 'index', extra = '') =>
      `${baseUrl}?module=${module}&action=${action}${extra ? `&${extra}` : ''}`,
  };
}

function listarAmbientes() {
  return Object.keys(AMBIENTES);
}

module.exports = { AMBIENTES, getAmbiente, listarAmbientes };