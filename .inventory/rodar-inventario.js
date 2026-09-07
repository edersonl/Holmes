/**
 * SCRIPT PRINCIPAL - SISTEMA DE INVENTÁRIO E VALIDAÇÃO
 * 
 * Executa todas as fases de inventário e validação do CRM
 */

const { execSync } = require('child_process');
const path = require('path');

const PROJECT_DIR = 'C:\\Users\\elima\\OneDrive - Unimed Federação do Parana\\crm-unimed';
const SCRIPTS_DIR = path.join(PROJECT_DIR, '.inventory', 'scripts');

const fases = [
  { id: 1, nome: 'Mapeamento de Módulos', script: 'fase1-mapeamento/mapear-modulos.js' },
  { id: 2, nome: 'Sincronização EA', script: 'fase2-ea/sincronizar-ea.js' },
  { id: 3, nome: 'Inventário de Testes', script: 'fase3-testes/inventariar-testes.js' },
  { id: 4, nome: 'Validação de Cobertura', script: 'fase4-cobertura/validar-cobertura.js' },
  { id: 5, nome: 'Criação de Cenários', script: 'fase5-cenarios/criar-cenarios.js' },
  { id: 6, nome: 'Confronto EA x Código', script: 'fase6-confronto/confrontar-ea-codigo.js' },
  { id: 7, nome: 'Painel de Testes', script: 'fase7-painel/iniciar-painel.js' },
  { id: 8, nome: 'Geração de Evidências', script: 'fase8-evidencias/gerar-evidencias.js' },
  { id: 9, nome: 'Diretório de Evidências', script: 'fase9-diretorio/criar-diretorio.js' },
  { id: 10, nome: 'Relatório Final', script: 'fase10-relatorio/gerar-relatorio-final.js' }
];

// Informações do servidor
const SERVIDOR_IP = '192.168.1.78';
const SERVIDOR_PATH = '\\\\' + SERVIDOR_IP + '\\c$\\crm-unimed\\tests\\playwright\\backend';

function executarFase(fase) {
  const scriptPath = path.join(SCRIPTS_DIR, fase.script);
  
  console.log(`\n╔════════════════════════════════════════════════════════════════╗`);
  console.log(`║  FASE ${fase.id}: ${fase.nome.toUpperCase()}`);
  console.log(`╚════════════════════════════════════════════════════════════════╝\n`);
  
  try {
    execSync(`node "${scriptPath}"`, { stdio: 'inherit', cwd: PROJECT_DIR });
    console.log(`\n✅ FASE ${fase.id} CONCLUÍDA\n`);
    return true;
  } catch (err) {
    console.error(`\n❌ ERRO NA FASE ${fase.id}: ${err.message}\n`);
    return false;
  }
}

function main() {
  console.log(`╔══════════════════════════════════════════════════════════════════╗`);
  console.log(`║     SISTEMA DE INVENTÁRIO E VALIDAÇÃO - CRM UNIMED PR          ║`);
  console.log(`║     Execução de Todas as Fases                                  ║`);
  console.log(`╚══════════════════════════════════════════════════════════════════╝\n`);
  
  console.log(`Diretório do Projeto: ${PROJECT_DIR}\n`);
  console.log(`Iniciando execução das fases...\n`);
  
  let totalSucesso = 0;
  
  for (const fase of fases) {
    if (executarFase(fase)) {
      totalSucesso++;
    }
  }
  
  console.log(`\n╔══════════════════════════════════════════════════════════════════╗`);
  console.log(`║  RESUMO DA EXECUÇÃO                                              ║`);
  console.log(`╚══════════════════════════════════════════════════════════════════╝\n`);
  
  console.log(`Total de fases: ${fases.length}`);
  console.log(`Concluídas com sucesso: ${totalSucesso}`);
  console.log(`Falhas: ${fases.length - totalSucesso}\n`);
  
  if (totalSucesso === fases.length) {
    console.log(`✅ Todas as fases concluídas com sucesso!`);
  } else {
    console.log(`⚠️  Algumas fases falharam. Verifique os logs.`);
  }
  
  console.log(`\nRelatórios gerados em: ${PROJECT_DIR}/.inventory/data/\n`);
  
  // Painel de Testes
  console.log(`\n╔══════════════════════════════════════════════════════════════════╗`);
  console.log(`║  PAINEL DE TESTES                                                ║`);
  console.log(`╚══════════════════════════════════════════════════════════════════╝\n`);
  
  console.log(`Endpoint: http://${SERVIDOR_IP}/testesCRM`);
  console.log(`\nPara configurar o servidor:`);
  console.log(`  1. Copie tests\\playwright\\backend para ${SERVIDOR_PATH}`);
  console.log(`  2. Execute node src/server.js no servidor`);
  console.log(`  3. Acesse http://${SERVIDOR_IP}/testesCRM`);
}

main();