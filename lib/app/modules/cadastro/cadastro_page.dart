import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fiscalizei_web/app/shared/model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  final formKey = GlobalKey<FormState>();
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  String _nome;
  String _email;
  String _senha;
  String _urlImage;
  String _tipoUsuario;
  String firebaseUserData;

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
            padding: EdgeInsets.all(25),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                  backgroundColor: Colors.black,
                  onPressed: () {},
                  label: Row(
                    children: [
                      Icon(Icons.file_upload),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Selecionar Foto",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
              RaisedButton(
                child: Text(
                  "SELECIONAR FOTO",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () async {},
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
                      color: Color(0xFF1E1C3F),
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
                      color: Color(0xFF1E1C3F),
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
                      color: Color(0xFF1E1C3F),
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
                color: Color(0xFF1E1C3F),
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

                      // _uploadImage();
                      // _validarCampos();
                      //_atualizarUrl();
                    });
                  }
                },
              )
            ],
          ),
        ));
  }
}
