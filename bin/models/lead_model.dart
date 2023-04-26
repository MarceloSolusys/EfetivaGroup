class Lead {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? assunto;
  String? mensagem;
  String? sendedAt;
  String? propertyCode;

  Lead(
      {this.id,
      this.nome,
      this.email,
      this.telefone,
      this.assunto,
      this.mensagem,
      this.sendedAt,
      this.propertyCode});

  Map toJson() {
    return {
      'full_name': nome,
      'email': email,
      'country_code': '55',
      'phone': telefone,
      'message': mensagem,
      'sended_at': sendedAt,
      'source': 'Site',
      'subject': assunto,
      'property_code': propertyCode,
      'property_contract': ''
    };
  }

  factory Lead.fromRequest(Map map) {
    return Lead()
      ..nome = (map['full_name'])
      ..email = (map['email'])
      ..telefone = (map['phone'])
      ..assunto = (map['subject'])
      ..mensagem = (map['message'])
      ..sendedAt = (map['sended_at'])
      ..propertyCode = (map['property_code']);
  }
}
