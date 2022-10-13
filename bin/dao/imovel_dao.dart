import '../infra/database/db_configuration.dart';
import '../models/imovel_model.dart';
import 'dao.dart';

class ImovelDAO implements DAO<ImovelModel> {
  final DBConfiguration _dbConfiguration;
  ImovelDAO(this._dbConfiguration);

  @override
  Future<bool> create(ImovelModel value) async {
    var result = await _dbConfiguration.execQuery(
      'insert into imoveis (codigo, observacoes, financiavel, medida, area_total, ' +
          'imovel_comodidades, status, valor_venda_visivel, valor_venda, atividade_rural, permuta, ' +
          'destaque, destaque_fim, endereco_estado, endereco_cidade, id_estado, id_cidade, titulo_anuncio, ' +
          'descricao_anuncio, endereco_logradouro, forma_pagamento ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )',
      [
        value.codigo,
        value.observacoes,
        value.financiavel,
        value.medida,
        value.area_total,
        value.imovel_comodidades,
        value.status,
        value.valor_venda_visivel,
        value.valor_venda,
        value.atividade_rural,
        value.permuta,
        value.destaque,
        value.destaque_fim,
        value.endereco_estado,
        value.endereco_cidade,
        value.id_estado,
        value.id_cidade,
        value.titulo_anuncio,
        value.descricao_anuncio,
        value.endereco_logradouro,
        value.forma_pagamento
      ],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> deleteOne(int id) async {
    var result = await _dbConfiguration
        .execQuery('DELETE from imoveis where id = ?', [id]);
    return result.affectedRows > 0;
  }

  @override
  Future<bool> deleteAll() async {
    var result = await _dbConfiguration.execQuery('DELETE from imoveis');
    return result.affectedRows > 0;
  }

  @override
  Future<List<ImovelModel>> findAll() async {
    var result = await _dbConfiguration.execQuery('SELECT * FROM imoveis');
    return result
        .map((r) => ImovelModel.fromMap(r.fields))
        .toList()
        .cast<ImovelModel>();
  }

  @override
  Future<ImovelModel?> findOne(int codigo) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM imoveis where codigo = ?', [codigo]);
    return result.isEmpty ? null : ImovelModel.fromMap(result.first.fields);
  }

  Future<List<ImovelModel>> findByEstado(int codigo) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM imoveis where id_estado = ?', [codigo]);
    return result
        .map((r) => ImovelModel.fromMap(r.fields))
        .toList()
        .cast<ImovelModel>();
  }

  String returnSqlCustomQuery(id_estado, id_cidade, finalidade, area_inicio,
      area_fim, valor_venda_inicio, valor_venda_fim) {
    String sql = "";
    if (id_estado > 0) {
      sql = "${sql} and id_estado = ${id_estado} ";
    }
    if (id_cidade > 0) {
      sql = "${sql} and id_cidade = ${id_cidade} ";
    }
    if (finalidade.isNotEmpty) {
      sql = "${sql} and atividade_rural like '%${finalidade}%'";
    }
    if (area_inicio > 0) {
      sql = "${sql} and area_total >= ${area_inicio} ";
    }
    if (area_fim > 0) {
      sql = "${sql} and area_total <=  ${area_fim} ";
    }
    if (valor_venda_inicio > 0) {
      sql =
          "${sql} and valor_venda >= ${valor_venda_inicio} and valor_venda_visivel = 1 ";
    }
    if (valor_venda_fim > 0) {
      sql =
          "${sql} and valor_venda <=  ${valor_venda_fim} and valor_venda_visivel = 1 ";
    }
    return sql;    
  }

  Future<int> countCustomQuery(
      int id_estado,
      int id_cidade,
      String finalidade,
      double area_inicio,
      double area_fim,
      double valor_venda_inicio,
      double valor_venda_fim) async {
    String sql = "select count(codigo) as length from imoveis where 1=1 ";
    sql =
        "${sql} ${returnSqlCustomQuery(id_estado, id_cidade, finalidade, area_inicio, area_fim, valor_venda_inicio, valor_venda_fim)}";

    var result = await _dbConfiguration.execQuery(sql);
    return result.first['length'];
  }

  Future<List<ImovelModel>> findByCustomQuery(
      id_estado,
      id_cidade,
      finalidade,
      area_inicio,
      area_fim,
      valor_venda_inicio,
      valor_venda_fim,
      limit,
      offset) async {
    String sql = "SELECT * FROM imoveis where 1=1";
    sql =
        "${sql} ${returnSqlCustomQuery(id_estado, id_cidade, finalidade, area_inicio, area_fim, valor_venda_inicio, valor_venda_fim)}";
    if (limit > 0) {
      sql = "${sql} limit ${limit} ";
    }
    if (offset > 0) {
      sql = "${sql} offset ${offset} ";
    }
    var result = await _dbConfiguration.execQuery(sql);
    return result
        .map((r) => ImovelModel.fromMap(r.fields))
        .toList()
        .cast<ImovelModel>();
  }

  @override
  Future<bool> update(ImovelModel value) async {
    var result = await _dbConfiguration.execQuery(
      'update imoveis set codigo = ?, observacoes= ?, financiavel= ?, medida= ?, area_total= ?, ' +
          'imovel_comodidades= ?, status= ?, valor_venda_visivel= ?, valor_venda= ?, atividade_rural= ?, permuta= ?, ' +
          'destaque= ?, destaque_fim= ?, endereco_estado= ?, endereco_cidade= ?, id_estado= ?, id_cidade= ?, titulo_anuncio= ?, ' +
          'descricao_anuncio= ?, endereco_logradouro= ?, forma_pagamento= ?',
      [
        value.codigo,
        value.observacoes,
        value.financiavel,
        value.medida,
        value.area_total,
        value.imovel_comodidades,
        value.status,
        value.valor_venda_visivel,
        value.valor_venda,
        value.atividade_rural,
        value.permuta,
        value.destaque,
        value.destaque_fim,
        value.endereco_estado,
        value.endereco_cidade,
        value.id_estado,
        value.id_cidade,
        value.titulo_anuncio,
        value.descricao_anuncio,
        value.endereco_logradouro,
        value.forma_pagamento
      ],
    );
    return result.affectedRows > 0;
  }
}
