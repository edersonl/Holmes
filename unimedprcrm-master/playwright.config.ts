import { defineConfig } from '@playwright/test';

const { getAmbiente } = require('./playwright/ambientes');
const ambiente = getAmbiente();
process.env.CRM_URL = ambiente.baseUrl;

export default defineConfig({
  testDir: './playwright/tests',
  timeout: Number(process.env.E2E_TIMEOUT ?? 60_000),
  expect: { timeout: Number(process.env.E2E_EXPECT_TIMEOUT ?? 30_000) },
  fullyParallel: false,
  workers: 1,
  reporter: [
    ['list'],
    ['html', { outputFolder: 'playwright-report', open: 'never' }],
    ['./crm-unimed/.holmes/reporters/evidencia-reporter.js', { outputDir: 'crm-unimed/.holmes/data/evidencias' }],
  ],
  use: {
    baseURL: ambiente.baseUrl,
    browserName: 'chromium',
    headless: process.env.HEADLESS !== 'false',
    screenshot: 'only-on-failure',
    trace: 'retain-on-failure',
    video: 'retain-on-failure',
  },
});
