export function createPotentialPersonAccountName(): string {
  const suffix = Date.now().toString().slice(-6);
  return `CONTA PLAYWRIGHT ${suffix}`;
}
