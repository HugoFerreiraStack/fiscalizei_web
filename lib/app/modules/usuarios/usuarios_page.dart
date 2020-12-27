import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'usuarios_controller.dart';

class UsuariosPage extends StatefulWidget {
  final String title;
  const UsuariosPage({Key key, this.title = "Usuarios"}) : super(key: key);

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState
    extends ModularState<UsuariosPage, UsuariosController> {
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
