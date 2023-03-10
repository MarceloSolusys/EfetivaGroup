import 'cidade_model.dart';

class BairroModel {
  int? id;
  String? nome;
  CidadeModel? cidade;

  BairroModel({this.id, this.nome, this.cidade});

  factory BairroModel.fromMap(Map map) {
    return BairroModel()..nome = (map['endereco_bairro']);
  }

  Map toJson() {
    return {'id': id, 'nome': nome, 'cidade': cidade};
  }
}
