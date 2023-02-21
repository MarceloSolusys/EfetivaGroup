import 'package:mysql1/mysql1.dart';
import '../../utils/custom_env.dart';
import 'db_configuration.dart';

class MySqlDBConfiguration implements DBConfiguration {
  MySqlConnection? _connection;

  @override
  Future<MySqlConnection> get connection async {
    if (_connection == null) {
      print('conexao criada');
      _connection = await createConnection();
    }
    if (_connection == null)
      throw Exception('[ERROR/DB] -> Failed Create Connection');
    return _connection!;
  }

  @override
  Future<MySqlConnection> createConnection() async =>
      await MySqlConnection.connect(
        ConnectionSettings(
          host: await CustomEnv.getKey(key: 'db_host'),
          port: await CustomEnv.getKey(key: 'db_port'),
          user: await CustomEnv.getKey(key: 'db_user'),
          password: await CustomEnv.getKey(key: 'db_pass'),
          db: await CustomEnv.getKey(key: 'db_schema'),
        ),
      );

  /*@override
  Future<Results> execQuery(String sql, [List? params]) async {
    var conn = await this.connection;
    return await conn.query(sql, params);
  }*/

  @override
  Future<Results> execQuery(String sql, [List? params]) async {
    var conn = await createConnection();
    var results = await conn.query(sql, params);
    conn.close();
    return results;
  }
}
