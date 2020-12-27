import 'package:flutter/src/widgets/framework.dart';

import 'projetos_de_lei_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'projetos_de_lei_page.dart';

class ProjetosDeLeiModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        $ProjetosDeLeiController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ProjetosDeLeiPage()),
      ];

  static Inject get to => Inject<ProjetosDeLeiModule>.of();

  @override
  // TODO: implement view
  Widget get view => ProjetosDeLeiPage();
}
