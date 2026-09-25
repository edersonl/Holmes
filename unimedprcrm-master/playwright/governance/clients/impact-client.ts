export class ImpactClient {

    constructor(
        private readonly baseUrl: string
    ) {}

    async getRule(ruleId: string) {
        const response = await fetch(
            `${this.baseUrl}/impacto/${ruleId}`
        );

        return response.json();
    }

    async getTests(ruleId: string) {
        const response = await fetch(
            `${this.baseUrl}/testes/${ruleId}`
        );

        return response.json();
    }
}