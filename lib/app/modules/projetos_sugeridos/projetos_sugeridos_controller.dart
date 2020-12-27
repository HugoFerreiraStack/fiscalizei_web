import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'projetos_sugeridos_controller.g.dart';

@Injectable()
class ProjetosSugeridosController = _ProjetosSugeridosControllerBase
    with _$ProjetosSugeridosController;

abstract class _ProjetosSugeridosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
