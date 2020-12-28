// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'vereadores_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'vereadores_page.dart';

class VereadoresModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        $VereadoresController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => VereadoresPage()),
      ];

  static Inject get to => Inject<VereadoresModule>.of();

  @override
  Widget get view => VereadoresPage();
}
