import { expect, Page } from '@playwright/test';

export class MenuPage {
  constructor(private readonly page: Page) {}

  async openAccounts(): Promise<void> {
    const commercial = this.page.locator('#grouptab_0');
    await expect(commercial).toBeVisible();
    await commercial.hover();
    await this.page.getByRole('link', { name: 'Contas', exact: true }).click();
  }
}
