// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'problemas_notificados_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'problemas_notificados_page.dart';

class ProblemasNotificadosModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        $ProblemasNotificadosController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ProblemasNotificadosPage()),
      ];

  static Inject get to => Inject<ProblemasNotificadosModule>.of();

  @override
  Widget get view => ProblemasNotificadosPage();
}
