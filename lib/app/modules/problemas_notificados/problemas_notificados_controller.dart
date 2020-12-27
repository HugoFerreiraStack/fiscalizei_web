import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'problemas_notificados_controller.g.dart';

@Injectable()
class ProblemasNotificadosController = _ProblemasNotificadosControllerBase
    with _$ProblemasNotificadosController;

abstract class _ProblemasNotificadosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
