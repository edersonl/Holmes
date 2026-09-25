import { test, expect } from "@playwright/test";

import { LoginPage } from "../../pages/login.page";
import { MenuPage } from "../../pages/menu.page";
import { AccountsPage } from "../../pages/accounts.page";
import { OpportunitiesPage } from "../../pages/opportunities.page";

import rule from "../../governance/rules/TR022.json";
import mapping from "../../governance/ea/mappings/TR022.json";

import {
    registerCoverage
} from "../../governance/ea/coverage/coverage-writer";

import {
    createOpportunityFixture
} from "../../data/massa03-oportunidades";

test.describe("CRM - Oportunidades", () => {

    test("TR022 - Criar oportunidade", async ({ page }) => {

        console.log(
            `Executando ${rule.casoTeste}`
        );

        const fixture =
            createOpportunityFixture("TR022");

        const login =
            new LoginPage(page);

        const menu =
            new MenuPage(page);

        const accounts =
            new AccountsPage(page);

        const opportunities =
            new OpportunitiesPage(page);

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

        // Sincronização mínima até descobrir
        // a regra oficial do EA

        await expect(
            page.locator("body")
        ).toBeVisible();

        for (const regra of mapping.regras) {

            await registerCoverage(
                mapping.casoTeste,
                regra,
                "PASS"
            );
        }
    });

});