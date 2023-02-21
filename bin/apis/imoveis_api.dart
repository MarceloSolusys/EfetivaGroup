import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../models/imovel_model.dart';
import '../services/http/imovel_out.dart';
import '../services/imagem_inteface.dart';
import '../services/imovel_inteface.dart';
import 'api.dart';

class ImovelApi extends Api {
  final ImovelInterface _imovelService;
  final ImagemInterface _imagemService;
  ImovelApi(this._imovelService, this._imagemService);

  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    Router router = Router();
    router.get('/imoveis', (Request req) async {
      String? tipo = (req.url.queryParameters['tipo'] != null)
          ? req.url.queryParameters['tipo']
          : '';
      int? id_estado = (req.url.queryParameters['id_estado'] != null)
          ? int.parse(req.url.queryParameters['id_estado']!)
          : 0;
      int? id_cidade = (req.url.queryParameters['id_cidade'] != null)
          ? int.parse(req.url.queryParameters['id_cidade']!)
          : 0;
      String? finalidade = (req.url.queryParameters['finalidade'] != null)
          ? req.url.queryParameters['finalidade']
          : '';
      double? area_inicio = (req.url.queryParameters['area_inicio'] != null)
          ? double.parse(req.url.queryParameters['area_inicio']!)
          : 0;
      double? area_fim = (req.url.queryParameters['area_fim'] != null)
          ? double.parse(req.url.queryParameters['area_fim']!)
          : 0;
      double? valor_venda_inicio =
          (req.url.queryParameters['valor_venda_inicio'] != null)
              ? double.parse(req.url.queryParameters['valor_venda_inicio']!)
              : 0;
      double? valor_venda_fim =
          (req.url.queryParameters['valor_venda_fim'] != null)
              ? double.parse(req.url.queryParameters['valor_venda_fim']!)
              : 0;
      int? limit = (req.url.queryParameters['limit'] != null)
          ? int.parse(req.url.queryParameters['limit']!)
          : 0;
      int? offset = (req.url.queryParameters['offset'] != null)
          ? int.parse(req.url.queryParameters['offset']!)
          : 0;

      List<Map> imoveisMap = [];
      List<ImovelModel> imoveis = [];
      imoveis = await _imovelService.findByCustomQuery(
          tipo!,
          id_estado,
          id_cidade,
          finalidade!,
          area_inicio,
          area_fim,
          valor_venda_inicio,
          valor_venda_fim,
          limit,
          offset);
      for (var imovel in imoveis) {
        imovel.imagens = await _imagemService.findByImovel(imovel.codigo!);
      }
      imoveisMap = imoveis.map((e) => e.toJson()).toList();
      int length = await _imovelService.countCustomQuery(
          tipo,
          id_estado,
          id_cidade,
          finalidade,
          area_inicio,
          area_fim,
          valor_venda_inicio,
          valor_venda_fim);
      return Response.ok(jsonEncode({'length': length, 'data': imoveisMap}));
    });

    router.post('/imoveis', (Request req) async {
      var body = await req.readAsString();
      var result = await _imovelService.save(
        ImovelModel.fromRequest(jsonDecode(body)),
      );
      return result ? Response(201) : Response(500);
    });

    router.put('/imoveis', (Request req) async {
      List<ImovelModel> imoveis = await ImovelOut().getImoveis();
      int updateLength = 0;
      var result;
      if (imoveis.isNotEmpty) {
        //deletando todos as imagens
        await _imagemService.deleteAll();
        //deletando todos os imoveis
        await _imovelService.deleteAll();
        for (var imovel in imoveis) {
          updateLength = updateLength + 1;
          result = await _imovelService.save(imovel);
          for (var imagem in imovel.imagens!) {
            imagem.codigo_imovel = imovel.codigo;
            await _imagemService.save(imagem);
          }
          /*if (imovel.tipo == 'Rural') {
            updateLength = updateLength + 1;
            result = await _imovelService.save(imovel);
            for (var imagem in imovel.imagens!) {
              imagem.codigo_imovel = imovel.codigo;
              await _imagemService.save(imagem);
            }
          }*/
        }
      }
      return result
          ? Response.ok(jsonEncode(
              {'result': '${updateLength} Imoveis Atualizados com Sucesso'}))
          : Response(500);
    });

    router.delete('/imoveis', (Request req) async {
      String? id = req.url.queryParameters['id'];
      if (id == null) return Response(400);
      var result = await _imovelService.deleteOne(int.parse(id));
      return result ? Response(200) : Response.internalServerError();
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
