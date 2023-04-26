import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/lead_model.dart';

class LeadOut {
  Future<int> postLead(Lead lead) async {
    final response = await http.post(
        Uri.parse(
            'https://api.jetimob.com/leads/JSBdYYGYRZpJWML58vNTi0OM86xutbNU4Rt6IPz19mA817ufXQhLdwQ94x6ucAuY'),
        headers: {
          'Authorization-Key':
              'hmxqdAvxL2NsCX4xPF16ALm6flYoUwkFvtiipSD8Cun5VTJtas4RPKglsNFqQxEj',
          "Content-type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(lead.toJson()));
    if (response.statusCode == 200) {
      return json.decode((response.body))['id'];
    } else {
      print('deu erro' + json.decode((response.body))['id']);
      throw Exception(json.decode((response.body))['error']);
    }
  }
}
