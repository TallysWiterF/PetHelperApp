class ServicoModel {
  final int id;
  final int petShopId;
  final String nome;
  final String descricao;
  final double preco;
  final String? logoServico;
  final bool ativo;
  final DateTime dataCriacao;
  final DateTime dataAtualizacao;

  ServicoModel({
    required this.id,
    required this.petShopId,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.logoServico,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
  });

  factory ServicoModel.fromJson(Map<String, dynamic> json) {
    return ServicoModel(
      id: json['id'],
      petShopId: json['petShopId'],
      nome: json['nome'],
      descricao: json['descricao'],
      preco: (json['preco'] as num).toDouble(),
      logoServico: json['logoServico'],
      ativo: json['ativo'],
      dataCriacao: DateTime.parse(json['dataCriacao']),
      dataAtualizacao: DateTime.parse(json['dataAtualizacao']),
    );
  }
}
