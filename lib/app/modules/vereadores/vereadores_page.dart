import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_ink_well/image_ink_well.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'vereadores_controller.dart';
import 'package:fiscalizei_web/app/shared/model/vereador.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class VereadoresPage extends StatefulWidget {
  final String title;
  const VereadoresPage({Key key, this.title = "Vereadores"}) : super(key: key);

  @override
  _VereadoresPageState createState() => _VereadoresPageState();
}

class _VereadoresPageState
    extends ModularState<VereadoresPage, VereadoresController> {
  //use 'controller' variable to access controller
  File _image;
  final picker = ImagePicker();
  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  var partidoSelecionado;
  var cidadeSelecionada;
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerBiografia = TextEditingController();

  String _nome;
  String _email;
  String _senha;
  String _partido;
  String _urlImage = "";
  String _cidade;
  String _tipoUsuario;
  String firebaseUserData;
  String _biografia;
  Vereador _vereador;

  String countryValue;
  String stateValue;
  String cityValue;

  List<String> _partidos = <String>[
    "MDB",
    "PT",
    "PSDB",
    "PP",
    "PDT",
    "PTB",
    "DEM",
    "PL",
    "PSB",
    "PSL",
    "PSC",
    "PODE",
    "PCdoB",
    "PSD",
    "PV",
    "PSOL",
    "PMN",
    "PTC",
    "DC",
    "PRTB",
    "PROS",
    "PMB",
    "NOVO",
    "REDE",
    "PSTU",
    "PCB",
    "PCO",
    "UP",
    "Avante",
    "Cidadania",
    "Republicanos",
    "Patriota",
    "Solidariedade",
  ];

  _validarCampos() {
    _nome = _controllerNome.text;
    _email = _controllerEmail.text;
    _senha = _controllerSenha.text;
    _partido = partidoSelecionado.toString();
    _biografia = _controllerBiografia.text;

    if (_email.isNotEmpty && _email.contains("@")) {
      if (_senha.isNotEmpty && _senha.length > 5) {
      } else {
        setState(() {});
      }
      Vereador vereador = Vereador();
      vereador.id = _vereador.id;
      vereador.nome = _nome;
      vereador.email = _email;
      vereador.senha = _senha;
      vereador.partido = _partido;
      vereador.cidade = _cidade;
      vereador.biografia = _biografia;
      vereador.tipoUsuario = "VEREADOR";
      vereador.urlImage = _urlImage;

      _cadastrarVereador(vereador);
    } else {
      setState(() {});
    }
  }

  _cadastrarVereador(Vereador vereador) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    auth
        .createUserWithEmailAndPassword(
            email: vereador.email, password: vereador.senha)
        .then((firebaseUser) {
      setState(() {
        FirebaseFirestore db = FirebaseFirestore.instance;
        db.collection("Vereadores").doc(_vereador.id).set(vereador.toMap());

        firebaseUserData = firebaseUser.user.uid;
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  _uploadImage() async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child(_vereador.id)
        .child('/profile.png');

    final UploadTask task = ref.putFile(_image);
    firebase_storage.TaskSnapshot taskSnapshot = await task;

    _urlImage = await taskSnapshot.ref.getDownloadURL();
  }

  _openGalery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _uploadImage();
      } else {
        print('No image selected.');
      }
    });
  }

  Widget _avatarUser() {
    if (_image == null) {
      return ImageInkWell(
        height: 100,
        width: 100,
        onPressed: () {
          //_showChoiceDialog(context)
          _openGalery(context);
        },
        image: AssetImage("images/avatar.png"),
      );
    } else {
      return CircleAvatar(
        backgroundImage: FileImage(_image),
        radius: 80,
      );
    }
  }

  _atualizarUrl() async {
    FirebaseFirestore db = await FirebaseFirestore.instance;
    db
        .collection("Vereadores")
        .doc(_vereador.id)
        .update({"urlImage": _urlImage});
  }

  Future<Void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Selecionar o Estado"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Acre"),
                    onTap: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {},
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    _vereador = Vereador.gerarID();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.grey,
          backgroundColor: Colors.black,
          title: Text("Cadastro de Vereadores"),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _avatarUser(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                child: Text(
                  "SELECIONAR FOTO",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () async {
                  _openGalery(context);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _controllerNome,
                onSaved: (nome) {
                  _nome = nome;
                  print(_nome);
                },
                validator: (valor) {
                  if (valor.isEmpty) {
                    return "Este campo é obrigatorio";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    hintText: "Digite o nome do usuario",
                    labelText: "Nome"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _controllerEmail,
                onSaved: (email) {
                  _email = email;
                  print(_email);
                },
                validator: (valor) {
                  if (valor.isEmpty) {
                    return "Este campo é obrigatorio";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    hintText: "Digite o e-mail do usuario",
                    labelText: "E-Mail"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _controllerSenha,
                onSaved: (senha) {
                  _senha = senha;
                  print(_senha);
                },
                validator: (valor) {
                  if (valor.isEmpty) {
                    return "Este campo é obrigatorio";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    hintText: "Digite a senha do usuario",
                    labelText: "Senha"),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _controllerBiografia,
                onSaved: (bio) {
                  _biografia = bio;
                  print(_biografia);
                },
                validator: (valor) {
                  if (valor.isEmpty) {
                    return "Este campo é obrigatorio";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                maxLines: 5,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    hintText: "Digite a biografia",
                    labelText: "Biografia"),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton(
                    items: _partidos
                        .map((value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 12),
                              ),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (_partidoSelecionado) {
                      setState(() {
                        partidoSelecionado = _partidoSelecionado;
                      });
                    },
                    value: partidoSelecionado,
                    hint: Text("Selecione o Partido"),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SelectState(
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          stateValue = value;
                        });
                      },
                      onCityChanged: (value) {
                        setState(() {
                          cityValue = value;
                          _cidade = cityValue.toString();
                          print(_cidade);
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text(
                  "CADASTRAR",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    setState(() {
                      _nome = _controllerNome.text;
                      _email = _controllerEmail.text;
                      _senha = _controllerSenha.text;
                      _biografia = _controllerBiografia.text;
                      _partido = partidoSelecionado.toString();
                      _tipoUsuario = "VEREADOR";
                      formKey.currentState.save();
                      _validarCampos();
                      _atualizarUrl();
                      formKey.currentState.reset();
                      _image = null;

                      partidoSelecionado = null;
                      _controllerNome.clear();
                      _controllerEmail.clear();
                      _controllerSenha.clear();
                    });
                  }
                },
              )
            ],
          ),
        ));
  }
}
