import '../dao/imovel_dao.dart';
import '../models/imovel_model.dart';
import 'imovel_inteface.dart';

class ImovelService implements ImovelInterface {
  final ImovelDAO _imovelDAO;
  ImovelService(this._imovelDAO);

  @override
  Future<bool> deleteOne(int id) async {
    return _imovelDAO.deleteOne(id);
  }

  @override
  Future<bool> deleteAll() {
    return _imovelDAO.deleteAll();
  }

  @override
  Future<List<ImovelModel>> findAll() async {
    return _imovelDAO.findAll();
  }

  @override
  Future<ImovelModel?> findOne(int id) async {
    return _imovelDAO.findOne(id);
  }

  Future<List<ImovelModel>> findByEstado(int id) async {
    return _imovelDAO.findByEstado(id);
  }

  Future<List<ImovelModel>> findByCustomQuery(
      int id_estado,
      id_cidade,
      finalidade,
      area_inicio,
      area_fim,
      valor_venda_inicio,
      valor_venda_fim,
      limit,
      offset) async {
    return _imovelDAO.findByCustomQuery(
        id_estado,
        id_cidade,
        finalidade,
        area_inicio,
        area_fim,
        valor_venda_inicio,
        valor_venda_fim,
        limit,
        offset);
  }

  @override
  Future<bool> save(ImovelModel value) async {
    return await _imovelDAO.create(value);
  }

  @override
  Future countCustomQuery(
      int id_estado,
      int id_cidade,
      String finalidade,
      double area_inicio,
      double area_fim,
      double valor_venda_inicio,
      double valor_venda_fim) {
    return _imovelDAO.countCustomQuery(id_estado, id_cidade, finalidade,
        area_inicio, area_fim, valor_venda_inicio, valor_venda_fim);
  }
}
