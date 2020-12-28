// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'projetos_sugeridos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'projetos_sugeridos_page.dart';

class ProjetosSugeridosModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        $ProjetosSugeridosController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ProjetosSugeridosPage()),
      ];

  static Inject get to => Inject<ProjetosSugeridosModule>.of();

  @override
  Widget get view => ProjetosSugeridosPage();
}
