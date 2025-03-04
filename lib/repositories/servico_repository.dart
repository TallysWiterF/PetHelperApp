import '../core/network/api_service.dart';
import '../models/servico_model.dart';

class ServicoRepository {
  final ApiService apiService;

  ServicoRepository(this.apiService);

  Future<List<ServicoModel>> fetchServicosAtivos(int petShopId) async {
    final response =
        await apiService.get("Servico/petShopId/$petShopId/ativo/true");
    return (response as List)
        .map((json) => ServicoModel.fromJson(json))
        .toList();
  }
}
