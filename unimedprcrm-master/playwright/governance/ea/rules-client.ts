import rules from "./rules/opportunities.rules.json";

export function getRule(id: string) {
    return rules.find(
        rule => rule.id === id
    );
}