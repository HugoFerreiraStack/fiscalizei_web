// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'cadastro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cadastro_page.dart';

class CadastroModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        $CadastroController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => CadastroPage()),
      ];

  static Inject get to => Inject<CadastroModule>.of();

  @override
  Widget get view => CadastroPage();
}
