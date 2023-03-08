class ImagemModel {
  int? id;
  String? link;
  String? titulo;
  String? link_thumb;
  int? codigo_imovel;

  ImagemModel();

  factory ImagemModel.fromRequest(Map map) {
    return ImagemModel()
      ..link = (map['link'])
      ..titulo = (map['titulo'])
      ..link_thumb = (map['link_thumb']);
  }

  factory ImagemModel.fromMap(Map map) {
    return ImagemModel()
      ..id = (map['id'])
      ..link = (map['link'])
      ..titulo = (map['titulo'])
      ..link_thumb = (map['link_thumb'])
      ..codigo_imovel = (map['codigo_imovel']);
  }

  Map toJson() {
    return {
      'id': id,
      'link': link,
      'titulo': titulo,
      'link_thumb': link_thumb,
      'codigo_imovel': codigo_imovel,
    };
  }
}
