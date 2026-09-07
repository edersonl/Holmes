import { defineConfig } from '@playwright/test';

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
    baseURL: process.env.CRM_URL,
    browserName: 'chromium',
    headless: process.env.HEADLESS !== 'false',
    screenshot: 'only-on-failure',
    trace: 'retain-on-failure',
    video: 'retain-on-failure',
  },
});
