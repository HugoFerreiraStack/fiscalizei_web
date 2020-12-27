import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'projetos_sugeridos_controller.dart';

class ProjetosSugeridosPage extends StatefulWidget {
  final String title;
  const ProjetosSugeridosPage({Key key, this.title = "ProjetosSugeridos"})
      : super(key: key);

  @override
  _ProjetosSugeridosPageState createState() => _ProjetosSugeridosPageState();
}

class _ProjetosSugeridosPageState
    extends ModularState<ProjetosSugeridosPage, ProjetosSugeridosController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
