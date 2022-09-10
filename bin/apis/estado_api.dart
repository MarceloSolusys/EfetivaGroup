import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../models/cidade_model.dart';
import '../models/estado_model.dart';
import '../services/estado_inteface.dart';
import 'api.dart';

class EstadoApi extends Api {
  final EstadoInterface _service;
  EstadoApi(this._service);

  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    Router router = Router();

    router.get('/estados', (Request req) async {
      List<EstadoModel> estados = await _service.findAll();
      List<Map> estadosMap = estados.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(estadosMap));
    });

    router.get('/cidades', (Request req) async {
      String? id_estado = req.url.queryParameters['id_estado'];
      if (id_estado == null) return Response(400);
      List<CidadeModel> cidades =
          await _service.findAllCities(int.parse(id_estado));
      List<Map> cidadesMap = cidades.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(cidadesMap));
    });

    router.post('/estados', (Request req) async {});

    router.put('/estados', (Request req) async {});

    router.delete('/imoveis', (Request req) async {});

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
