import '../../apis/estado_api.dart';
import '../../apis/imoveis_api.dart';
import '../../apis/noticias_api.dart';
import '../../apis/login_api.dart';
import '../../apis/usuario_api.dart';
import '../../dao/estado_dao.dart';
import '../../dao/imagem_dao.dart';
import '../../dao/imovel_dao.dart';
import '../../dao/noticia_dao.dart';
import '../../dao/usuario_dao.dart';
import '../../models/estado_model.dart';
import '../../models/imagem_model.dart';
import '../../models/imovel_model.dart';
import '../../models/noticia_model.dart';
import '../../services/estado_service.dart';
import '../../services/generic_service.dart';
import '../../services/imagem_service.dart';
import '../../services/imovel_service.dart';
import '../../services/login_service.dart';
import '../../services/noticia_service.dart';
import '../../services/usuario_service.dart';
import '../database/db_configuration.dart';
import '../database/mysql_db_configuration.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<DBConfiguration>(() => MySqlDBConfiguration());
    di.register<SecurityService>(() => SecurityServiceImp());

    // noticias
    di.register<NoticiaDAO>(() => NoticiaDAO(di<DBConfiguration>()));
    di.register<GenericService<NoticiaModel>>(
      () => NoticiaService(di<NoticiaDAO>()),
    );
    di.register<NoticiasApi>(
      () => NoticiasApi(di<GenericService<NoticiaModel>>()),
    );

    // imoveis
    di.register<ImovelDAO>(() => ImovelDAO(di<DBConfiguration>()));
    di.register<GenericService<ImovelModel>>(
      () => ImovelService(di<ImovelDAO>()),
    );
    // imagens
    di.register<ImagemDAO>(() => ImagemDAO(di<DBConfiguration>()));
    di.register<GenericService<ImagemModel>>(
      () => ImagemService(di<ImagemDAO>()),
    );

    di.register<ImovelApi>(
      () => ImovelApi(
          di<GenericService<ImovelModel>>(), di<GenericService<ImagemModel>>()),
    );

    // Estados
    di.register<EstadoDAO>(() => EstadoDAO(di<DBConfiguration>()));
    di.register<GenericService<EstadoModel>>(
      () => EstadoService(di<EstadoDAO>()),
    );
    di.register<EstadoApi>(
      () => EstadoApi(di<GenericService<EstadoModel>>()),
    );

    // usuario
    di.register<UsuarioDAO>(() => UsuarioDAO(di<DBConfiguration>()));
    di.register<UsuarioService>(() => UsuarioService(di<UsuarioDAO>()));
    di.register<UsuarioApi>(() => UsuarioApi(di<UsuarioService>()));

    // login
    di.register<LoginService>(() => LoginService(di<UsuarioService>()));
    di.register<LoginApi>(
      () => LoginApi(di<SecurityService>(), di<LoginService>()),
    );

    return di;
  }
}
