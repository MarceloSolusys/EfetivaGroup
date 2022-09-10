import '../infra/database/db_configuration.dart';
import '../models/imagem_model.dart';
import 'dao.dart';

class ImagemDAO implements DAO<ImagemModel> {
  final DBConfiguration _dbConfiguration;
  ImagemDAO(this._dbConfiguration);

  @override
  Future<bool> create(ImagemModel value) async {
    var result = await _dbConfiguration.execQuery(
      'insert into imagens (link, titulo, link_thumb, codigo_imovel) ' +
          'values (?, ?, ?, ?)',
      [
        value.link,
        value.titulo,
        value.link_thumb,
        value.codigo_imovel,
      ],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> deleteOne(int id) async {
    var result = await _dbConfiguration
        .execQuery('DELETE from imagens where id = ?', [id]);
    return result.affectedRows > 0;
  }

  @override
  Future<bool> deleteAll() async {
    var result = await _dbConfiguration.execQuery('DELETE from imagens');
    return result.affectedRows > 0;
  }

  @override
  Future<List<ImagemModel>> findAll() async {
    var result = await _dbConfiguration.execQuery('SELECT * FROM imagens');
    return result
        .map((r) => ImagemModel.fromMap(r.fields))
        .toList()
        .cast<ImagemModel>();
  }

  @override
  Future<ImagemModel?> findOne(int codigo) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM imagens where codigo = ?', [codigo]);
    return result.isEmpty ? null : ImagemModel.fromMap(result.first.fields);
  }

  Future<List<ImagemModel>> findByImovel(int codigo) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM imagens where codigo_imovel = ?', [codigo]);
    return result
        .map((r) => ImagemModel.fromMap(r.fields))
        .toList()
        .cast<ImagemModel>();
  }

  @override
  Future<bool> update(ImagemModel value) async {
    var result = await _dbConfiguration.execQuery(
      'update imagens set link = ?, titulo= ?, link_thumb= ?, codido_imovel = ? ' +
          'where id = ?',
      [
        value.link,
        value.titulo,
        value.link_thumb,
        value.codigo_imovel,
        value.id,
      ],
    );
    return result.affectedRows > 0;
  }
}
