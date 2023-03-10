import '../models/imovel_model.dart';
import 'generic_service.dart';

abstract class ImovelInterface extends GenericService<ImovelModel> {
  Future findByEstado(int id);
  Future countCustomQuery(
    String tipo,
    int id_estado,
    int id_cidade,
    String finalidade,
    double area_inicio,
    double area_fim,
    double valor_venda_inicio,
    double valor_venda_fim,
    int dormitorios,
    int suites,
    int banheiros,
    int garagens,
    String endereco_bairro,
  );
  Future findByCustomQuery(
      String tipo,
      int id_estado,
      int id_cidade,
      String finalidade,
      double area_inicio,
      double area_fim,
      double valor_venda_inicio,
      double valor_venda_fim,
      int dormitorios,
      int suites,
      int banheiros,
      int garagens,
      String endereco_bairro,
      int limit,
      int offset);
}
