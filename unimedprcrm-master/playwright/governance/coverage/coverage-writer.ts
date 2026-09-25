export async function registerCoverage(
    testId: string,
    ruleId: string,
    status: "PASS" | "FAIL"
) {

    console.log(
        `[EA] ${testId} -> ${ruleId} => ${status}`
    );
}