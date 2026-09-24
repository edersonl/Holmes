import { test, expect } from "@playwright/test";

import { LoginPage } from "../../pages/login.page";
import { MenuPage } from "../../pages/menu.page";
import { AccountsPage } from "../../pages/accounts.page";
import { OpportunitiesPage } from "../../pages/opportunities.page";

import { createOpportunityFixture } from "../../data/massa03-oportunidades";

test.describe("CRM - Oportunidades", () => {
    test("TR022", async ({ page }) => {
        const fixture = createOpportunityFixture("TR022");

        const login = new LoginPage(page);

        const menu = new MenuPage(page);

        const accounts = new AccountsPage(page);

        const opportunities = new OpportunitiesPage(page);

        await login.open();

        console.log("CRM_URL =", process.env.CRM_URL);
        console.log("CRM_USER =", process.env.CRM_USER);
        console.log("CRM_PASSWORD =", process.env.CRM_PASSWORD);
        await login.login(process.env.CRM_USER!, process.env.CRM_PASSWORD!);

        await menu.openAccounts();

        await accounts.expectSearchPage();

        await accounts.searchAccount(fixture.accountName);

        await accounts.openFirstResult();

        await accounts.openOpportunityCreation();

        await opportunities.create();

        await opportunities.fillOpportunity(fixture.lives, fixture.type);

        await opportunities.save();
    });
});
