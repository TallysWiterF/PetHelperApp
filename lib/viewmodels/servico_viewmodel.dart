import 'package:flutter/material.dart';
import '../models/servico_model.dart';
import '../repositories/servico_repository.dart';

class ServicoViewModel extends ChangeNotifier {
  final ServicoRepository servicoRepository;

  ServicoViewModel(this.servicoRepository);

  List<ServicoModel> _servicos = [];
  bool _isLoading = false;

  List<ServicoModel> get servicos => _servicos;
  bool get isLoading => _isLoading;

  Future<void> fetchServicos(int petShopId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _servicos = await servicoRepository.fetchServicosAtivos(petShopId);
    } catch (e) {
      print("Erro ao buscar serviços: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
