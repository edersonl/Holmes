import { expect, Page } from '@playwright/test';

export class AccountsPage {
  constructor(private readonly page: Page) {}

  async expectSearchPage(): Promise<void> {
    await expect(this.page.getByText('Contas » Pesquisar')).toBeVisible();
  }

  async create(): Promise<void> {
    await this.page.locator('#create_link').click();
    await expect(this.page.locator('#name')).toBeVisible();
  }

  async fillPotentialPerson(name: string): Promise<void> {
    await this.page.locator('#account_type').selectOption({ label: 'Potencial Cliente (PF)' });
    await this.page.locator('#name').fill(name);
  }

  async save(): Promise<void> {
    await this.page.getByRole('button', { name: 'SALVAR', exact: true }).first().click({ noWaitAfter: true });
  }

  async expectDetails(name: string): Promise<void> {
    await expect(this.page.getByText(name, { exact: true })).toBeVisible();
  }
}
