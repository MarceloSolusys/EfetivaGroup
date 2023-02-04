abstract class DBConfiguration {
  Future<dynamic> createConnection();
  Future<dynamic> get connection;
  Future<dynamic> execQuery(String sql, [List? params]);
}
