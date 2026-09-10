import { expect, Page } from '@playwright/test';
import { AccountFixture } from '../data/massa02-conta';

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

  async fillAccount(account: AccountFixture): Promise<void> {
    await this.page.locator('#account_type').selectOption({ label: account.accountType });
    await this.page.locator('#name').fill(account.name);
    await this.fillIfPresent('#nome_social_c', account.socialName);
    await this.selectIfPresent('#genero_social_c', account.socialGender);
    await this.fillIfPresent('#razao_social_c', account.legalName);
    await this.fillIfPresent('#cnpj_mf_c', account.document);
    await this.fillIfPresent('#Accounts0emailAddress0', account.email);
    await this.fillIfPresent('#data_nasc_c', account.birthDate);
    await this.selectIfPresent('#sexo_c', account.sex);
    await this.fillIfPresent('#nome_mae_c', account.motherName);
    await this.fillIfPresent('#nome_pai_c', account.fatherName);
    await this.selectIfPresent('#estado_civil_c', account.maritalStatus);
    await this.fillIfPresent('#naturalidade_rel_c', account.naturality, true);
    await this.selectIfPresent('#registro_telefone_tel_tipo_aaaaa', account.phoneType);
    await this.fillIfPresent('#registro_telefone_name_aaaaa', account.phoneNumber);
    await this.selectIfPresent('#tipo_empresa_c', account.companySize);
    await this.selectIfPresent('#natureza_juridica_c', account.legalNature);
    await this.fillIfPresent('#inscricao_estadual_c', account.stateRegistration);
    await this.fillIfPresent('#inscricao_municipal_c', account.municipalRegistration);
    await this.fillIfPresent('#cpf_responsavel_cei_c', account.responsibleCpf);
  }

  async save(): Promise<void> {
    await this.page.getByRole('button', { name: 'Salvar', exact: true }).first().click({ noWaitAfter: true });
  }

  async expectDetails(name: string): Promise<void> {
    await expect(this.page.getByText(name, { exact: true })).toBeVisible();
  }

  private async fillIfPresent(selector: string, value: string | undefined, pressEnter = false): Promise<void> {
    if (!value) return;
    const field = this.page.locator(selector).first();
    if (await field.count() === 0 || !(await field.isVisible().catch(() => false))) return;
    await field.fill(value);
    if (pressEnter) await field.press('Enter');
  }

  private async selectIfPresent(selector: string, label: string | undefined): Promise<void> {
    if (!label) return;
    const field = this.page.locator(selector).first();
    if (await field.count() === 0 || !(await field.isVisible().catch(() => false))) return;
    await field.selectOption({ label }).catch(async () => {
      await field.selectOption({ index: 1 });
    });
  }
}
