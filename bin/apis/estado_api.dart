import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../models/bairros_model.dart';
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
      String? tipo = req.url.queryParameters['tipo'];
      tipo == null ? tipo = '' : tipo = tipo;
      List<EstadoModel> estados = await _service.findAllPorTipo(tipo!);
      List<Map> estadosMap = estados.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(estadosMap));
    });

    router.get('/cidades', (Request req) async {
      String? id_estado = req.url.queryParameters['id_estado'];
      String? tipo = req.url.queryParameters['tipo'];
      tipo == null ? tipo = '' : tipo = tipo;
      if (id_estado == null) return Response(400);
      List<CidadeModel> cidades =
          await _service.findAllCitiesPorTipo(int.parse(id_estado), tipo!);
      List<Map> cidadesMap = cidades.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(cidadesMap));
    });

    router.get('/bairros', (Request req) async {
      String? id_cidade = req.url.queryParameters['id_cidade'];
      String? tipo = req.url.queryParameters['tipo'];
      tipo == null ? tipo = '' : tipo = tipo;
      if (id_cidade == null) return Response(400);
      List<BairroModel> bairros =
          await _service.findAllBairrosPortipo(int.parse(id_cidade), tipo);
      List<Map> bairrosMap = bairros.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(bairrosMap));
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
