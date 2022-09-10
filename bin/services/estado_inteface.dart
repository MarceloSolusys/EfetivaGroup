import '../models/estado_model.dart';
import 'generic_service.dart';

abstract class EstadoInterface extends GenericService<EstadoModel> {
  Future findAllCities(int id);
}
