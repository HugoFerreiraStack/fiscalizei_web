import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'projetos_de_lei_controller.g.dart';

@Injectable()
class ProjetosDeLeiController = _ProjetosDeLeiControllerBase
    with _$ProjetosDeLeiController;

abstract class _ProjetosDeLeiControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
