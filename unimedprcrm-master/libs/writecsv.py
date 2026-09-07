import csv
from robot.api.deco import keyword

@keyword(name='Write CSV File')
def write_csv_file(filename, input):
    with open(f'{filename}.csv', 'w', newline='') as file:
        writer = csv.writer(file, delimiter=';')
        writer.writerows([['nome', 'CPF', 'tipo', 'tipoDependencia', 'grauDependencia', 'titularCPF', 'numeroMatricula',
        'dataAdmissaoEmpresa', 'dataNascimento', 'sexo', 'raca', 'estadoCivil', 'nomeMae', 'nomePai', 'CNS', 'CBO',
        'recemNato', 'numeroDeclaracaoNascidoVivo', 'tipoDocumento', 'documentoIdentificacao', 'orgaoExpedidor',
        'orgaoExpedidorUF', 'dataExpedicao', 'naturalidadeCidade', 'naturalidadeEstado', 'cnhValidade', 'cnhCategoria',
        'pisPasepNit', 'tituloEleitoral', 'certidaoCasamento', 'produtoAcessorio', 'produtoAssistencial', 'tipoEndereco',
        'correspondencia', 'cartaoMagnetico', 'cep', 'endereco', 'numero', 'complemento', 'bairro', 'cidade', 'uf', 'pais',
        'telefoneResidencial', 'telefoneComercial', 'telefoneCelular', 'dataBaseCarencia', 'dataVinculoComTitular',
        'dataInicioVigencia'], input])
        
        
        