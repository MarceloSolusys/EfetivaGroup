import '../infra/database/db_configuration.dart';
import '../models/bairros_model.dart';
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

  Future<List<EstadoModel>> findAllPtipo(String tipo) async {
    String query = '';
    if (tipo.isNotEmpty) {
      query = 'where tipo = $tipo';
    }
    var result = await _dbConfiguration.execQuery(
        'select id_estado, endereco_estado FROM imoveis $query GROUP BY id_estado ');
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

  Future<List<CidadeModel>> findAllCitiesPorTipo(
      int id_estado, String tipo) async {
    String query = '';
    if (tipo.isNotEmpty) {
      query = 'and tipo = $tipo';
    }
    var result = await _dbConfiguration.execQuery(
        'select id_cidade, endereco_cidade FROM imoveis WHERE id_estado = ? $query GROUP BY id_cidade ',
        [id_estado]);
    return result
        .map((r) => CidadeModel.fromMap(r.fields))
        .toList()
        .cast<CidadeModel>();
  }

  Future<List<BairroModel>> findAllBairros(int id_cidade) async {
    var result = await _dbConfiguration.execQuery(
        'select endereco_bairro FROM imoveis WHERE id_cidade = ? GROUP BY endereco_bairro ',
        [id_cidade]);
    return result
        .map((r) => BairroModel.fromMap(r.fields))
        .toList()
        .cast<BairroModel>();
  }

  Future<List<BairroModel>> findAllBairrosPortipo(
      int id_cidade, String tipo) async {
    String query = '';
    if (tipo.isNotEmpty) {
      query = 'and tipo = $tipo';
    }
    var result = await _dbConfiguration.execQuery(
        'select endereco_bairro FROM imoveis WHERE id_cidade = ? $query GROUP BY endereco_bairro ',
        [id_cidade]);
    return result
        .map((r) => BairroModel.fromMap(r.fields))
        .toList()
        .cast<BairroModel>();
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
