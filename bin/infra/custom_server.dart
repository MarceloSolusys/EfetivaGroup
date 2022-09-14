import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  final ip = InternetAddress.anyIPv4;

  Future<void> initialize({
    required Handler handler,
    required String address,
    required int port,
  }) async {
    await shelf_io.serve(handler, ip, port);
    print('Servidor inicializado -> http://$address:$port');
  }
}
