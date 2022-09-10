import '../dao/imagem_dao.dart';
import '../models/imagem_model.dart';
import 'imagem_inteface.dart';

class ImagemService implements ImagemInterface {
  final ImagemDAO _imagemDAO;
  ImagemService(this._imagemDAO);

  @override
  Future<bool> deleteOne(int id) async {
    return _imagemDAO.deleteOne(id);
  }

  @override
  Future<bool> deleteAll() {
    return _imagemDAO.deleteAll();
  }

  @override
  Future<List<ImagemModel>> findAll() async {
    return _imagemDAO.findAll();
  }

  @override
  Future<ImagemModel?> findOne(int id) async {
    return _imagemDAO.findOne(id);
  }

  @override
  Future<bool> save(ImagemModel value) async {
    return await _imagemDAO.create(value);
  }

  @override
  Future findByImovel(int id) {
    return _imagemDAO.findByImovel(id);
  }
}
