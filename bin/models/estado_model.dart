import 'cidade_model.dart';

class EstadoModel {
  int? id;
  String? nome;
  String? sigla;
  List<CidadeModel>? cidades;

  EstadoModel({this.id, this.nome, this.sigla, this.cidades});

  factory EstadoModel.fromMap(Map map) {
    return EstadoModel()
      ..id = (map['id_estado'])
      ..nome = (map['endereco_estado']);
  }

  Map toJson() {
    return {'id': id, 'nome': nome, 'sigla': sigla, 'cidades': cidades};
  }
}
