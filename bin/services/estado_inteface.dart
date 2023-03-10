import '../models/estado_model.dart';
import 'generic_service.dart';

abstract class EstadoInterface extends GenericService<EstadoModel> {
  Future findAllCities(int id_estado);
  Future findAllCitiesPorTipo(int id_estado, String tipo);
  Future findAllPorTipo(String tipo);
  Future findAllBairros(int id_cidade);
  Future findAllBairrosPortipo(int id_cidade, String tipo);
}
