import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/servico_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  final int petShopId = 1;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final servicoViewModel = Provider.of<ServicoViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Serviços da PetShop")),
      body: servicoViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: servicoViewModel.servicos.length,
              itemBuilder: (context, index) {
                final servico = servicoViewModel.servicos[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.pets),
                    title: Text(servico.nome),
                    subtitle: Text(servico.descricao),
                    trailing: Text("R\$ ${servico.preco.toStringAsFixed(2)}"),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => servicoViewModel.fetchServicos(petShopId),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
