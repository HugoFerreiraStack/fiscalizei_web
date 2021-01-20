import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'noticias_controller.g.dart';

@Injectable()
class NoticiasController = _NoticiasControllerBase with _$NoticiasController;

abstract class _NoticiasControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
