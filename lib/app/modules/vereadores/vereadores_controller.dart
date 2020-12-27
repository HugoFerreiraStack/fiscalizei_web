import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'vereadores_controller.g.dart';

@Injectable()
class VereadoresController = _VereadoresControllerBase
    with _$VereadoresController;

abstract class _VereadoresControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
