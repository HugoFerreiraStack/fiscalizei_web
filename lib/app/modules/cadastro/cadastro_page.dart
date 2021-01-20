import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fiscalizei_web/app/shared/model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_ink_well/image_ink_well.dart';
import 'package:image_picker/image_picker.dart';
import 'cadastro_controller.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  //use 'controller' variable to access controller

  File _image;
  final picker = ImagePicker();
  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  String _nome;
  String _email;
  String _senha;
  String _urlImage = "";
  String _tipoUsuario;
  String firebaseUserData;
  Usuario _usuario;

  _validarCampos() {
    _nome = _controllerNome.text;
    _email = _controllerEmail.text;
    _senha = _controllerSenha.text;

    if (_email.isNotEmpty && _email.contains("@")) {
      if (_senha.isNotEmpty && _senha.length > 5) {
      } else {
        setState(() {});
      }
      Usuario usuario = Usuario();
      usuario.nome = _nome;
      usuario.email = _email;
      usuario.senha = _senha;
      usuario.tipoUsuario = "ADMIN";
      usuario.urlImage = _urlImage;

      _cadastrarUsuario(usuario);
    } else {
      setState(() {});
    }
  }

  _cadastrarUsuario(Usuario usuario) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      setState(() {
        FirebaseFirestore db = FirebaseFirestore.instance;
        db
            .collection("Usuarios-Painel_Admin")
            .doc(firebaseUser.user.uid)
            .set(usuario.toMap());

        firebaseUserData = firebaseUser.user.uid;
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  _uploadImage() async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child(_usuario.id)
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
        .collection("Usuarios-Painel_Admin")
        .doc(_usuario.id)
        .update({"urlImage": _urlImage});
  }

  @override
  void initState() {
    _usuario = Usuario.gerarID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.grey,
          backgroundColor: Colors.black,
          title: Text("Cadastro de Usuarios"),
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
                      _tipoUsuario = "ADMIN";
                      formKey.currentState.save();

                      _validarCampos();
                      _atualizarUrl();
                      formKey.currentState.reset();
                      _image = null;
                    });
                  }
                },
              )
            ],
          ),
        ));
  }
}
