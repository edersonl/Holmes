import { test, expect } from '@playwright/test';
import { AccountsPage } from '../../pages/accounts.page';
import { LoginPage } from '../../pages/login.page';
import { MenuPage } from '../../pages/menu.page';
import { createAccountFixture, createPotentialPersonAccountName } from '../../data/massa02-conta';

const migratedAccountScenarios = [
  ['TR011', 'cadastra uma conta potencial PF com todos os dados'],
  ['TR012', 'cadastra uma conta cliente PF com dados obrigatórios'],
  ['TR013', 'cadastra uma conta cliente PF com todos os dados'],
  ['TR014', 'cadastra uma conta potencial PJ com dados obrigatórios'],
  ['TR015', 'cadastra uma conta potencial PJ com todos os dados'],
  ['TR016', 'cadastra uma conta cliente PJ com dados obrigatórios'],
  ['TR017', 'cadastra uma conta cliente PJ com todos os dados'],
  ['TR018', 'cadastra uma conta potencial CAEPF com dados obrigatórios'],
  ['TR019', 'cadastra uma conta potencial CAEPF com todos os dados'],
  ['TR020', 'cadastra uma conta cliente CAEPF com dados obrigatórios'],
  ['TR021', 'cadastra uma conta cliente CAEPF com todos os dados'],
] as const;

const requiredEnvironment = [
  'CRM_URL',
  'CRM_USER',
  'CRM_PASSWORD',
  'CRM_USER_NAME',
];
const missingEnvironment = requiredEnvironment.filter((name) => !process.env[name]);

test.describe('CRM - Contas', () => {
  // AzureSuite: Contratante e Contas
  // Origem: Regressao02Conta.robot
  // Executor: Playwright
  test.skip(
    missingEnvironment.length > 0,
    `Configure ${missingEnvironment.join(', ')} para executar os testes contra o CRM.`,
  );

  test('TR010 - cadastra uma conta potencial PF com nome', async ({ page }) => {
    const login = new LoginPage(page);
    const menu = new MenuPage(page);
    const accounts = new AccountsPage(page);
    const accountName = createPotentialPersonAccountName();

    await login.open();
    await login.login(process.env.CRM_USER!, process.env.CRM_PASSWORD!);
    await expect(page.locator('#usermenu')).toBeVisible();

    await menu.openAccounts();
    await accounts.expectSearchPage();
    await accounts.create();
    await accounts.fillPotentialPerson(accountName);
    await accounts.save();
    await accounts.expectDetails(accountName);
  });

  for (const [testId, description] of migratedAccountScenarios) {
    test(`${testId} - ${description}`, async ({ page }) => {
      const login = new LoginPage(page);
      const menu = new MenuPage(page);
      const accounts = new AccountsPage(page);
      const account = createAccountFixture(testId);

      await login.open();
      await login.login(process.env.CRM_USER!, process.env.CRM_PASSWORD!);
      await expect(page.locator('#usermenu')).toBeVisible();

      await menu.openAccounts();
      await accounts.expectSearchPage();
      await accounts.create();
      await accounts.fillAccount(account);
      await accounts.save();
      await accounts.expectDetails(account.name);
    });
  }
});
