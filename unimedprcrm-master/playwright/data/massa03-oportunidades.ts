export type OpportunityFixture = {
    testId: string;
    accountName: string;
    lives: number;
    type: string;
    source: string;
};

export function createOpportunityFixture(testId: string): OpportunityFixture {
    switch (testId) {
        case "TR022":
            return {
                testId,
                accountName: "CONTA PLAYWRIGHT",
                lives: 5,
                type: "Novos Negócios",
                source: "WhatsApp",
            };

        case "TR023":
            return {
                testId,
                accountName: "CONTA PLAYWRIGHT",
                lives: 10,
                type: "Novos Negócios",
                source: "WhatsApp",
            };

        case "TR024":
            return {
                testId,
                accountName: "CONTA PLAYWRIGHT",
                lives: 15,
                type: "Novos Negócios",
                source: "WhatsApp",
            };
        case "TR025":
            return {
                testId,
                accountName: "CONTA PJ",
                lives: 10,
                type: "Novos Negócios",
                source: "WhatsApp",
            };

        case "TR026":
            return {
                testId,
                accountName: "CLIENTE PJ",
                lives: 20,
                type: "Novos Negócios",
                source: "WhatsApp",
            };

        case "TR027":
            return {
                testId,
                accountName: "POTENCIAL PJ",
                lives: 25,
                type: "Novos Negócios",
                source: "WhatsApp",
            };

        case "TR028":
        case "TR029":
        case "TR030":
            return {
                testId,
                accountName: "PJ 30 VIDAS",
                lives: 30,
                type: "Novos Negócios",
                source: "WhatsApp",
            };

        case "TR031":
        case "TR032":
        case "TR033":
            return {
                testId,
                accountName: "PJ +30 VIDAS",
                lives: 50,
                type: "Novos Negócios",
                source: "WhatsApp",
            };
        case "TR034":
            return {
                testId,
                accountName: "CAEPF POTENCIAL",
                lives: 10,
                type: "Novos Negócios",
                source: "WhatsApp",
            };

        case "TR035":
            return {
                testId,
                accountName: "CAEPF CLIENTE",
                lives: 15,
                type: "Novos Negócios",
                source: "WhatsApp",
            };

        case "TR036":
            return {
                testId,
                accountName: "CAEPF +30",
                lives: 50,
                type: "Novos Negócios",
                source: "WhatsApp",
            };

        case "TR037":
        case "TR038":
        case "TR039":
        case "TR040":
        case "TR041":
        case "TR042":
            return {
                testId,
                accountName: "INTERESSE PF PJ",
                lives: 20,
                type: "Novos Negócios",
                source: "WhatsApp",
            };
        default:
            throw new Error(`TR não mapeado: ${testId}`);
    }
}