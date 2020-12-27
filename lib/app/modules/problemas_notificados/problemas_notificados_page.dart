import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'problemas_notificados_controller.dart';

class ProblemasNotificadosPage extends StatefulWidget {
  final String title;
  const ProblemasNotificadosPage({Key key, this.title = "ProblemasNotificados"})
      : super(key: key);

  @override
  _ProblemasNotificadosPageState createState() =>
      _ProblemasNotificadosPageState();
}

class _ProblemasNotificadosPageState extends ModularState<
    ProblemasNotificadosPage, ProblemasNotificadosController> {
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
