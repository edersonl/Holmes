import { test, expect } from '@playwright/test';
import { AccountsPage } from '../../pages/accounts.page';
import { LoginPage } from '../../pages/login.page';
import { MenuPage } from '../../pages/menu.page';
import { createPotentialPersonAccountName } from '../../data/massa02-conta';

const requiredEnvironment = [
  'CRM_URL',
  'CRM_USER',
  'CRM_PASSWORD',
  'CRM_USER_NAME',
];
const missingEnvironment = requiredEnvironment.filter((name) => !process.env[name]);

test.describe('CRM - Contas', () => {
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
});
