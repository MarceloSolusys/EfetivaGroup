import 'imagem_model.dart';

class ImovelModel {
  int? codigo;
  String? observacoes;
  int? financiavel;
  String? medida;
  double? area_total;
  String? imovel_comodidades;
  String? status;
  bool? valor_venda_visivel;
  double? valor_venda;
  String? forma_pagamento;
  String? atividade_rural;
  bool? permuta;
  String? destaque;
  DateTime? destaque_fim;
  String? endereco_estado;
  String? endereco_cidade;
  int? id_estado;
  int? id_cidade;
  String? titulo_anuncio;
  String? descricao_anuncio;
  String? endereco_logradouro; //Utilizado para breve descrição do imóvel
  List<ImagemModel>? imagens;

  ImovelModel();

  factory ImovelModel.fromRequest(Map map) {
    List<ImagemModel> imagens = [];
    List itens = (map['imagens']) != null ? map['imagens'] : [];
    for (var item in itens) {
      imagens.add(ImagemModel.fromRequest(item));
    }

    return ImovelModel()
      ..codigo = int.parse(map['codigo'])
      ..observacoes = (map['observacoes'])
      ..financiavel = (map['financiavel'])
      ..medida = (map['medida'])
      ..area_total = (map['area_total'])
      ..imovel_comodidades = (map['imovel_comodidades'])
      ..status = (map['status'])
      ..valor_venda_visivel = (map['valor_venda_visivel'])
      ..valor_venda = double.parse(map['valor_venda'].toString())
      ..forma_pagamento = (map['endereco_complemento'])
      ..atividade_rural = (map['rural']['atividade_rural'])
      ..permuta = (map['permuta'])
      ..destaque = (map['destaque'])
      ..destaque_fim = (map['destaque_fim'])
      ..endereco_estado = (map['endereco_estado'])
      ..endereco_cidade = (map['endereco_cidade'])
      ..id_estado = (map['id_estado'])
      ..id_cidade = (map['id_cidade'])
      ..titulo_anuncio = (map['titulo_anuncio'])
      ..descricao_anuncio = (map['descricao_anuncio'])
      ..endereco_logradouro = (map['endereco_logradouro'])
      ..imagens = imagens;
  }

  factory ImovelModel.fromMap(Map map) {
    return ImovelModel()
      ..codigo = (map['codigo'])
      ..observacoes = (map['observacoes']).toString()
      ..financiavel = (map['financiavel'])
      ..medida = (map['medida'])
      ..area_total = (map['area_total'])
      ..imovel_comodidades = (map['imovel_comodidades'])
      ..status = (map['status'])
      ..valor_venda_visivel = (map['valor_venda_visivel'] == '1') ? true : false
      ..valor_venda = double.parse(map['valor_venda'].toString())
      ..forma_pagamento = (map['forma_pagamento'])
      ..atividade_rural = (map['atividade_rural'])
      ..permuta = (map['permuta'] == '0') ? true : false
      ..destaque = (map['destaque'])
      ..destaque_fim = (map['destaque_fim'])
      ..endereco_estado = (map['endereco_estado'])
      ..endereco_cidade = (map['endereco_cidade'])
      ..id_estado = (map['id_estado'])
      ..id_cidade = (map['id_cidade'])
      ..titulo_anuncio = (map['titulo_anuncio'])
      ..descricao_anuncio = (map['descricao_anuncio']).toString()
      ..endereco_logradouro = (map['endereco_logradouro']).toString();
  }

  Map toJson() {
    return {
      'codigo': codigo,
      'observacoes': observacoes,
      'financiavel': financiavel,
      'medida': medida,
      'area_total': area_total,
      'imovel_comodidades': imovel_comodidades,
      'status': status,
      'valor_venda_visivel': valor_venda_visivel,
      'valor_venda': valor_venda,
      'forma_pagamento':forma_pagamento,
      'atividade_rural': atividade_rural,
      'permuta': permuta,
      'destaque': destaque,
      'destaque_fim': destaque_fim,
      'endereco_estado': endereco_estado,
      'endereco_cidade': endereco_cidade,
      'id_estado': id_estado,
      'id_cidade': id_cidade,
      'titulo_anuncio': titulo_anuncio,
      'descricao_anuncio': descricao_anuncio,
      'endereco_logradouro': endereco_logradouro,
      'imagens': imagens
    };
  }
}
