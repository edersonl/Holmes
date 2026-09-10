export type AccountFixture = {
  accountType: string;
  name: string;
  socialName?: string;
  socialGender?: string;
  document?: string;
  email?: string;
  birthDate?: string;
  sex?: string;
  motherName?: string;
  fatherName?: string;
  maritalStatus?: string;
  naturality?: string;
  phoneType?: string;
  phoneNumber?: string;
  legalName?: string;
  companySize?: string;
  legalNature?: string;
  stateRegistration?: string;
  municipalRegistration?: string;
  responsibleCpf?: string;
};

export function createPotentialPersonAccountName(): string {
  const suffix = Date.now().toString().slice(-6);
  return `CONTA PLAYWRIGHT ${suffix}`;
}

function suffix(): string {
  return Date.now().toString().slice(-6);
}

function onlyDigits(value: string): string {
  return value.replace(/\D/g, '');
}

function formatCpf(digits: string): string {
  const normalized = onlyDigits(digits).padStart(11, '0').slice(-11);
  return `${normalized.slice(0, 3)}.${normalized.slice(3, 6)}.${normalized.slice(6, 9)}-${normalized.slice(9)}`;
}

function formatCnpj(digits: string): string {
  const normalized = onlyDigits(digits).padStart(14, '0').slice(-14);
  return `${normalized.slice(0, 2)}.${normalized.slice(2, 5)}.${normalized.slice(5, 8)}/${normalized.slice(8, 12)}-${normalized.slice(12)}`;
}

function createBaseName(prefix: string): string {
  return `${prefix} PLAYWRIGHT ${suffix()}`;
}

function createPersonFields(accountType: string, full = false): AccountFixture {
  const accountSuffix = suffix();
  const fixture: AccountFixture = {
    accountType,
    name: createBaseName('CONTA'),
  };

  if (accountType === 'Cliente (PF)' || full) {
    fixture.document = formatCpf(`39053344${accountSuffix}`);
  }

  if (full) {
    fixture.socialName = `NOME SOCIAL ${accountSuffix}`;
    fixture.socialGender = 'Masculino';
    fixture.email = `conta${accountSuffix}@example.com`;
    fixture.birthDate = '01/01/1985';
    fixture.sex = 'Masculino';
    fixture.motherName = `MAE PLAYWRIGHT ${accountSuffix}`;
    fixture.fatherName = `PAI PLAYWRIGHT ${accountSuffix}`;
    fixture.maritalStatus = 'Solteiro(a)';
    fixture.naturality = 'Curitiba';
    fixture.phoneType = 'Celular';
    fixture.phoneNumber = `4199${accountSuffix}`.slice(0, 11);
  }

  return fixture;
}

function createCompanyFields(accountType: string, full = false): AccountFixture {
  const accountSuffix = suffix();
  const fixture: AccountFixture = {
    accountType,
    name: createBaseName('EMPRESA'),
  };

  if (accountType === 'Cliente (PJ)' || full) {
    fixture.legalName = `${fixture.name} LTDA`;
    fixture.document = formatCnpj(`11222333${accountSuffix}`);
  }

  if (full) {
    fixture.companySize = 'ME';
    fixture.legalNature = '101-5 - Órgão Público do Poder Executivo Federal';
    fixture.stateRegistration = `11${accountSuffix}`;
    fixture.municipalRegistration = `22${accountSuffix}`;
    fixture.email = `empresa${accountSuffix}@example.com`;
    fixture.phoneType = 'Celular';
    fixture.phoneNumber = `4198${accountSuffix}`.slice(0, 11);
  }

  return fixture;
}

function createCaepfFields(accountType: string, full = false): AccountFixture {
  const accountSuffix = suffix();
  const fixture: AccountFixture = {
    accountType,
    name: createBaseName('CAEPF'),
  };

  if (accountType === 'Cliente (CAEPF)' || full) {
    fixture.legalName = `${fixture.name} RURAL`;
    fixture.document = formatCnpj(`55666777${accountSuffix}`);
    fixture.responsibleCpf = formatCpf(`25874136${accountSuffix}`);
  }

  if (full) {
    fixture.stateRegistration = `33${accountSuffix}`;
    fixture.municipalRegistration = `44${accountSuffix}`;
    fixture.email = `caepf${accountSuffix}@example.com`;
    fixture.phoneType = 'Celular';
    fixture.phoneNumber = `4197${accountSuffix}`.slice(0, 11);
  }

  return fixture;
}

export function createAccountFixture(testId: string): AccountFixture {
  switch (testId) {
    case 'TR011':
      return createPersonFields('Potencial Cliente (PF)', true);
    case 'TR012':
      return createPersonFields('Cliente (PF)');
    case 'TR013':
      return createPersonFields('Cliente (PF)', true);
    case 'TR014':
      return createCompanyFields('Potencial Cliente (PJ)');
    case 'TR015':
      return createCompanyFields('Potencial Cliente (PJ)', true);
    case 'TR016':
      return createCompanyFields('Cliente (PJ)');
    case 'TR017':
      return createCompanyFields('Cliente (PJ)', true);
    case 'TR018':
      return createCaepfFields('Potencial Cliente (CAEPF)');
    case 'TR019':
      return createCaepfFields('Potencial Cliente (CAEPF)', true);
    case 'TR020':
      return createCaepfFields('Cliente (CAEPF)');
    case 'TR021':
      return createCaepfFields('Cliente (CAEPF)', true);
    default:
      throw new Error(`Massa de conta não mapeada para ${testId}.`);
  }
}
