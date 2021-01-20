import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'noticias_controller.dart';

class NoticiasPage extends StatefulWidget {
  final String title;
  const NoticiasPage({Key key, this.title = "Noticias"}) : super(key: key);

  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState
    extends ModularState<NoticiasPage, NoticiasController> {
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
