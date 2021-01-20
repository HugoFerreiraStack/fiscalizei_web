import 'dart:async';

import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _controller = StreamController<QuerySnapshot>.broadcast();

  Future<Stream<QuerySnapshot>> _buscarUsuarios() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    Query query = db.collection("Usuarios");

    Stream<QuerySnapshot> stream = query.snapshots();
    //print(_selected);

    stream.listen((dados) {
      dados.docs.forEach((element) {
        print(element.data());
      });
      _controller.add(dados);
    });
  }

  @override
  void initState() {
    _buscarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var carregandoDados = Center(
      child: Column(
        children: <Widget>[CircularProgressIndicator()],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Usuarios",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: _controller.stream,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return carregandoDados;
                      break;
                    case ConnectionState.active:
                    case ConnectionState.done:
                      QuerySnapshot querySnapshot = snapshot.data;
                      if (querySnapshot.docs.length == 0) {
                        return Container(
                          padding: EdgeInsets.all(25),
                          child: Text(
                            "",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          padding: EdgeInsets.all(5),
                          itemBuilder: (context, i) {
                            return new AnimatedCard(
                                direction: AnimatedCardDirection
                                    .left, //Initial animation direction
                                initDelay: Duration(
                                    milliseconds:
                                        0), //Delay to initial animation
                                duration: Duration(seconds: 1), //Initial anima
                                curve: Curves.bounceOut,
                                child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Card(
                                        elevation: 2,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.person,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                          title: Container(
                                            height: 30,
                                            child: Text(
                                              snapshot.data.docs[i]
                                                  .data()['nome']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          subtitle: Text(
                                            snapshot.data.docs[i]
                                                .data()['email']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ))));
                          },
                        ),
                      );
                  }
                })
          ],
        ),
      ),
    );
  }
}
