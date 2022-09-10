import '../infra/database/db_configuration.dart';
import '../models/cidade_model.dart';
import '../models/estado_model.dart';
import 'dao.dart';

class EstadoDAO implements DAO<EstadoModel> {
  final DBConfiguration _dbConfiguration;
  EstadoDAO(this._dbConfiguration);

  @override
  Future<List<EstadoModel>> findAll() async {
    var result = await _dbConfiguration.execQuery(
        'select id_estado, endereco_estado FROM imoveis GROUP BY id_estado');
    return result
        .map((r) => EstadoModel.fromMap(r.fields))
        .toList()
        .cast<EstadoModel>();
  }

  Future<List<CidadeModel>> findAllCities(int id_estado) async {
    var result = await _dbConfiguration.execQuery(
        'select id_cidade, endereco_cidade FROM imoveis WHERE id_estado = ? GROUP BY id_cidade ',
        [id_estado]);
    return result
        .map((r) => CidadeModel.fromMap(r.fields))
        .toList()
        .cast<CidadeModel>();
  }

  @override
  Future<EstadoModel> findOne(int codigo) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> create(EstadoModel value) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteOne(int id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAll() async {
    throw UnimplementedError();
  }

  @override
  Future<bool> update(EstadoModel value) async {
    throw UnimplementedError();
  }
}
