import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/network/api_service.dart'; // Caminho correto para seu ApiService
import 'repositories/servico_repository.dart';
import 'viewmodels/servico_viewmodel.dart';
import 'views/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService()),
        ProxyProvider<ApiService, ServicoRepository>(
          update: (_, apiService, __) => ServicoRepository(apiService),
        ),
        ChangeNotifierProxyProvider<ServicoRepository, ServicoViewModel>(
          create: (_) => ServicoViewModel(ServicoRepository(ApiService())),
          update: (_, repo, __) => ServicoViewModel(repo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PetShop Serviços',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}
