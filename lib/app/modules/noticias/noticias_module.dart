import 'noticias_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'noticias_page.dart';

class NoticiasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $NoticiasController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => NoticiasPage()),
      ];

  static Inject get to => Inject<NoticiasModule>.of();
}
