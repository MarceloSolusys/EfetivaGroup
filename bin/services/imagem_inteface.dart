import '../models/imagem_model.dart';
import 'generic_service.dart';

abstract class ImagemInterface extends GenericService<ImagemModel> {
  Future findByImovel(int id);
}
