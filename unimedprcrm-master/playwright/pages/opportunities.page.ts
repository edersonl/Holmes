import { test, expect } from "@playwright/test";

import { LoginPage } from "../../pages/login.page";
import { MenuPage } from "../../pages/menu.page";
import { AccountsPage } from "../../pages/accounts.page";
import { OpportunitiesPage } from "../../pages/opportunities.page";

import { createOpportunityFixture } from "../../data/massa03-oportunidades";

test.describe("CRM - Oportunidades", () => {
    test("TR022 - Criar oportunidade", async ({ page }) => {
        const fixture = createOpportunityFixture("TR022");

        const login = new LoginPage(page);
        const menu = new MenuPage(page);
        const accounts = new AccountsPage(page);
        const opportunities = new OpportunitiesPage(page);

        expect(process.env.CRM_USER).toBeTruthy();
        expect(process.env.CRM_PASSWORD).toBeTruthy();

        await login.open();

        await login.login(
            process.env.CRM_USER!,
            process.env.CRM_PASSWORD!
        );

        await menu.openAccounts();

        await accounts.expectSearchPage();

        await accounts.searchAccount(
            fixture.accountName
        );

        await accounts.openFirstResult();

        await accounts.openOpportunityCreation();

        await opportunities.create();

        await opportunities.fillOpportunity(
            fixture.lives,
            fixture.type
        );

        await opportunities.save();

        // Aguarda conclusão do salvamento

        await expect(page).not.toHaveURL(/edit/i);

        // Mantém página carregada após salvar

        await expect(page.locator("body")).toBeVisible();
    });
});