import '../dao/noticia_dao.dart';
import '../models/noticia_model.dart';
import 'generic_service.dart';

class NoticiaService implements GenericService<NoticiaModel> {
  final NoticiaDAO _noticiaDAO;
  NoticiaService(this._noticiaDAO);

  @override
  Future<bool> deleteOne(int id) async {
    return _noticiaDAO.deleteOne(id);
  }

  @override
  Future<List<NoticiaModel>> findAll() async {
    return _noticiaDAO.findAll();
  }

  @override
  Future<NoticiaModel?> findOne(int id) async {
    return _noticiaDAO.findOne(id);
  }

  @override
  Future<bool> save(NoticiaModel value) async {
    if (value.id != null) {
      return _noticiaDAO.update(value);
    } else {
      return _noticiaDAO.create(value);
    }
  }
  
  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }
}
