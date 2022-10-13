import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/imovel_model.dart';
import '../../utils/custom_env.dart';

class ImovelOut {
  Future<List<ImovelModel>> getImoveis() async {
    CustomEnv.fromFile('.env-dev');
    String token = await CustomEnv.getKey(key: 'jet_key');
    final response = await http.get(
        Uri.parse('https://api.jetimob.com/webservice/${token}/imoveis'),
        headers: {});
    List<ImovelModel> imoveis = parseImoveis(response.body);
    return imoveis;
  }

  List<ImovelModel> parseImoveis(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ImovelModel>((json) => ImovelModel.fromRequest(json))
        .toList();
  }
}
