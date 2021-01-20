import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiscalizei_web/app/modules/cadastro/cadastro_module.dart';
import 'package:fiscalizei_web/app/modules/feed/feed_module.dart';
import 'package:fiscalizei_web/app/modules/problemas_notificados/problemas_notificados_module.dart';
import 'package:fiscalizei_web/app/modules/projetos_de_lei/projetos_de_lei_module.dart';
import 'package:fiscalizei_web/app/modules/projetos_sugeridos/projetos_sugeridos_module.dart';
import 'package:fiscalizei_web/app/modules/usuarios/usuarios_module.dart';
import 'package:fiscalizei_web/app/modules/vereadores/vereadores_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_ink_well/image_ink_well.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  List widgetOptions = [
    FeedModule(),
    CadastroModule(),
    ProblemasNotificadosModule(),
    ProjetosDeLeiModule(),
    ProjetosSugeridosModule(),
    UsuariosModule(),
    VereadoresModule()
  ];

  int index;
  String _url = "";
  String _nomeUsuario = "";
  File _image;

  _verificarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db
        .collection("Usuarios-Painel_Admin")
        .doc(user.uid.toString())
        .get();
    String urlImage = snapshot.get("urlImage");
    String nome = snapshot.get("nome");

    setState(() {
      _url = urlImage;
      _nomeUsuario = nome;
      print(_url);
      print(user.uid);
    });
  }

  Widget _avatarUser() {
    if (_url == "") {
      return ImageInkWell(
        height: 100,
        width: 100,
        onPressed: () {},
        image: AssetImage("images/avatar.png"),
      );
    } else {
      return CircleAvatar(
        backgroundImage: NetworkImage(_url),
        radius: 40,
      );
    }
  }

  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: MultiLevelDrawer(
          backgroundColor: Colors.white,
          rippleColor: Colors.white,
          subMenuBackgroundColor: Colors.grey.shade100,
          divisionColor: Colors.grey,
          header: Container(
            height: size.height * 0.20,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _avatarUser(),
                SizedBox(
                  height: 5,
                ),
                Text(_nomeUsuario)
              ],
            )),
          ),
          children: [
            MLMenuItem(
                leading: Icon(
                  Icons.rss_feed,
                  size: 15,
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 15,
                ),
                content: Text(
                  "Feed",
                  style: TextStyle(fontSize: 12),
                ),
                onClick: () {
                  setState(() {
                    index = 0;
                    controller.upDateCurrentIndex(index);
                    Modular.to.pop(context);
                  });
                }),
            MLMenuItem(
              leading: Icon(
                Icons.person_add,
                size: 15,
              ),
              trailing: Icon(
                Icons.arrow_right,
                size: 15,
              ),
              content: Text(
                "Cadastro",
                style: TextStyle(fontSize: 12),
              ),
              onClick: () {
                setState(() {
                  index = 1;
                  controller.upDateCurrentIndex(index);
                  Modular.to.pop(context);
                });
              },
            ),
            MLMenuItem(
              leading: Icon(
                Icons.notifications,
                size: 15,
              ),
              trailing: Icon(
                Icons.arrow_right,
                size: 15,
              ),
              content: Text(
                "Problemas Notificados",
                style: TextStyle(fontSize: 12),
              ),
              onClick: () {
                setState(() {
                  index = 2;
                  controller.upDateCurrentIndex(index);
                  Modular.to.pop(context);
                });
              },
            ),
            MLMenuItem(
                leading: Icon(
                  Icons.table_view,
                  size: 15,
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 15,
                ),
                content: Text(
                  "Projetos de Lei",
                  style: TextStyle(fontSize: 12),
                ),
                onClick: () {
                  setState(() {
                    index = 3;
                    controller.upDateCurrentIndex(index);
                    Modular.to.pop(context);
                  });
                }),
            MLMenuItem(
                leading: Icon(
                  Icons.lightbulb,
                  size: 15,
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 15,
                ),
                content: Text(
                  "Projetos Sugeridos",
                  style: TextStyle(fontSize: 12),
                ),
                onClick: () {
                  setState(() {
                    index = 4;
                    controller.upDateCurrentIndex(index);
                    Modular.to.pop(context);
                  });
                }),
            MLMenuItem(
                leading: Icon(
                  Icons.person,
                  size: 15,
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 15,
                ),
                content: Text(
                  "Usuarios",
                  style: TextStyle(fontSize: 12),
                ),
                onClick: () {
                  setState(() {
                    index = 5;
                    controller.upDateCurrentIndex(index);
                    Modular.to.pop(context);
                  });
                }),
            MLMenuItem(
                leading: Icon(
                  Icons.person_add,
                  size: 15,
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 15,
                ),
                content: Text(
                  "Vereadores",
                  style: TextStyle(fontSize: 12),
                ),
                onClick: () {
                  setState(() {
                    index = 6;
                    controller.upDateCurrentIndex(index);
                    Modular.to.pop(context);
                  });
                }),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Fiscalizei Painel Admin",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Observer(
          builder: (_) {
            return widgetOptions.elementAt(controller.currentIndex);
          },
        ),
      ),
    );
  }
}
