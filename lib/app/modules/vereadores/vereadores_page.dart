import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'vereadores_controller.dart';

class VereadoresPage extends StatefulWidget {
  final String title;
  const VereadoresPage({Key key, this.title = "Vereadores"}) : super(key: key);

  @override
  _VereadoresPageState createState() => _VereadoresPageState();
}

class _VereadoresPageState
    extends ModularState<VereadoresPage, VereadoresController> {
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
