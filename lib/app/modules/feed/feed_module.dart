// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'feed_page.dart';

class FeedModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        $FeedController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => FeedPage()),
      ];

  static Inject get to => Inject<FeedModule>.of();

  @override
  Widget get view => FeedPage();
}
