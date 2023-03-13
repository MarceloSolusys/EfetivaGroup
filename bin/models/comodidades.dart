class ComodidadeModel {
  int? id;
  String? nome;

  ComodidadeModel({this.id, this.nome});

  factory ComodidadeModel.fromMap(Map map) {
    return ComodidadeModel()
      ..id = (map['id'])
      ..nome = (map['imovel_comodidades']);
  }

  Map toJson() {
    return {'id': id, 'nome': nome};
  }
}
