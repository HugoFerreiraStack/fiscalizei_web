import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'projetos_de_lei_controller.dart';

class ProjetosDeLeiPage extends StatefulWidget {
  final String title;
  const ProjetosDeLeiPage({Key key, this.title = "ProjetosDeLei"})
      : super(key: key);

  @override
  _ProjetosDeLeiPageState createState() => _ProjetosDeLeiPageState();
}

class _ProjetosDeLeiPageState
    extends ModularState<ProjetosDeLeiPage, ProjetosDeLeiController> {
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
