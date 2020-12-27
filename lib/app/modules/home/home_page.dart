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
            height: size.height * 0.25,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/dp_default.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("RetroPortal Studio")
              ],
            )),
          ),
          children: [
            MLMenuItem(
                leading: Icon(Icons.rss_feed),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "Feed",
                ),
                onClick: () {
                  setState(() {
                    index = 0;
                    controller.upDateCurrentIndex(index);
                    Modular.to.pop(context);
                  });
                }),
            MLMenuItem(
              leading: Icon(Icons.person_add),
              trailing: Icon(Icons.arrow_right),
              content: Text("Cadastro"),
              onClick: () {
                setState(() {
                  index = 1;
                  controller.upDateCurrentIndex(index);
                  Modular.to.pop(context);
                });
              },
            ),
            MLMenuItem(
              leading: Icon(Icons.notifications),
              content: Text("Problemas Notificados"),
              onClick: () {
                setState(() {
                  index = 2;
                  controller.upDateCurrentIndex(index);
                  Modular.to.pop(context);
                });
              },
            ),
            MLMenuItem(
                leading: Icon(Icons.table_view),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "Projetos de Lei",
                ),
                onClick: () {
                  setState(() {
                    index = 3;
                    controller.upDateCurrentIndex(index);
                    Modular.to.pop(context);
                  });
                }),
            MLMenuItem(
                leading: Icon(Icons.lightbulb),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "Projetos Sugeridos",
                ),
                onClick: () {
                  setState(() {
                    index = 4;
                    controller.upDateCurrentIndex(index);
                    Modular.to.pop(context);
                  });
                }),
            MLMenuItem(
                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "Usuarios",
                ),
                onClick: () {
                  setState(() {
                    index = 5;
                    controller.upDateCurrentIndex(index);
                    Modular.to.pop(context);
                  });
                }),
            MLMenuItem(
                leading: Icon(Icons.person_add),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "Vereadores",
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
            "Fiscalizei Painel WEB",
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
