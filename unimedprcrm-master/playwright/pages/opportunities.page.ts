import { expect, Page } from "@playwright/test";

export class OpportunitiesPage {
    constructor(private readonly page: Page) {}

    async create(): Promise<void> {
        await expect(this.page.locator("#name")).toBeVisible();
    }

    async fillOpportunity(lives: number, type: string): Promise<void> {
        await this.page.locator("#amount").fill(String(lives));

        await this.page.locator("#opportunity_type").selectOption({
            label: type,
        });
    }

    async save(): Promise<void> {
        await this.page
            .getByRole("button", {
                name: "Salvar",
            })
            .first()
            .click();
    }

    async expectDetails(accountName: string): Promise<void> {
        await expect(this.page.getByText(accountName)).toBeVisible();
    }
}
