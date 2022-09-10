import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/imovel_model.dart';
class ImovelOut {
  
  Future<List<ImovelModel>> getImoveis() async {
    final response = await http.get(
        Uri.parse(
            'https://api.jetimob.com/webservice/lTm3fBoFbKgWGuher1OPufrN3HbbukUDh6Q6rQJh2vcGTgLxpI1EPYr8AAyvvKXe/imoveis'),
        headers: {});
    List<ImovelModel> imoveis = parseImoveis(response.body);   
    print(imoveis[0].atividade_rural);
    return imoveis;
  }

  List<ImovelModel> parseImoveis(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ImovelModel>((json) => ImovelModel.fromRequest(json))
        .toList();
  }
}
