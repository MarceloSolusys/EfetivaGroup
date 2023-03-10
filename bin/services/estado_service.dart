import '../dao/estado_dao.dart';
import '../models/estado_model.dart';
import 'estado_inteface.dart';

class EstadoService implements EstadoInterface {
  final EstadoDAO _estadoDAO;
  EstadoService(this._estadoDAO);

  @override
  Future<bool> deleteOne(int id) async {
    return _estadoDAO.deleteOne(id);
  }

  @override
  Future<bool> deleteAll() {
    return _estadoDAO.deleteAll();
  }

  @override
  Future<List<EstadoModel>> findAll() async {
    return _estadoDAO.findAll();
  }

  @override
  Future<List<EstadoModel>> findAllPorTipo(String tipo) async {
    return _estadoDAO.findAllPtipo(tipo);
  }

  @override
  Future findAllCities(int id_estado) {
    return _estadoDAO.findAllCities(id_estado);
  }

  @override
  Future findAllCitiesPorTipo(int id_estado, String tipo) {
    return _estadoDAO.findAllCitiesPorTipo(id_estado, tipo);
  }

  @override
  Future findAllBairros(int id_cidade) {
    return _estadoDAO.findAllBairros(id_cidade);
  }

  @override
  Future findAllBairrosPortipo(int id_cidade, String tipo) {
    return _estadoDAO.findAllBairrosPortipo(id_cidade, tipo);
  }

  @override
  Future<EstadoModel?> findOne(int id) async {
    return _estadoDAO.findOne(id);
  }

  @override
  Future<bool> save(value) async {
    return await _estadoDAO.create(value);
  }
}
