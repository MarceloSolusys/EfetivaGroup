import 'estado_model.dart';

class CidadeModel {
  int? id;
  String? nome;
  EstadoModel? estado;

  CidadeModel({this.id, this.nome, this.estado});

  factory CidadeModel.fromMap(Map map) {
    return CidadeModel()
      ..id = (map['id_cidade'])
      ..nome = (map['endereco_cidade']);
  }

  Map toJson() {
    return {'id': id, 'nome': nome, 'estado': estado};
  }
}
