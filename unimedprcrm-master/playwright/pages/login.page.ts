import { expect, Page } from '@playwright/test';

export class LoginPage {
  readonly page: Page;
  readonly userName;
  readonly password;
  readonly submit;

  constructor(page: Page) {
    this.page = page;
    this.userName = page.locator('#user_name');
    this.password = page.locator('#user_password');
    this.submit = page.locator('#bigbutton');
  }

  async open(): Promise<void> {
    await this.page.goto(process.env.CRM_URL ?? '/');
    await expect(this.userName).toBeVisible();
    await expect(this.password).toBeVisible();
    await expect(this.submit).toBeVisible();
  }

  async login(userName: string, password: string): Promise<void> {
    await this.userName.fill(userName);
    await this.password.fill(password);
    await this.submit.click();
  }
}
