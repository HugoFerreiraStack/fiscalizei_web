import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fiscalizei_web/app/shared/model/projetos_de_lei.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'projetos_de_lei_controller.dart';

class ProjetosDeLeiPage extends StatefulWidget {
  final String title;
  const ProjetosDeLeiPage({Key key, this.title = "ProjetosDeLei"})
      : super(key: key);

  @override
  _ProjetosDeLeiPageState createState() => _ProjetosDeLeiPageState();
}

class _ProjetosDeLeiPageState
    extends ModularState<ProjetosDeLeiPage, ProjetosDeLeiController> {
  //use 'controller' variable to access controller

  final formKey = GlobalKey<FormState>();
  TextEditingController _controllerNomeProjeto = TextEditingController();
  TextEditingController _controllerDescricaoProjeto = TextEditingController();
  TextEditingController _controllerAutorProjeto = TextEditingController();
  TextEditingController _controllerAndamentoProjeto = TextEditingController();

  String _nomeProjeto;
  String _descricaoProjeto;
  String _autorProjeto;
  String _andamentoProjeto;
  String _urlFile = "";
  String _mensagem = "";
  ProjetoDeLei _projetoDeLei;
  File file;

  _upload() async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("Projetos de Lei")
        .child(_projetoDeLei.id);

    final UploadTask task = ref.putFile(file);
    firebase_storage.TaskSnapshot taskSnapshot = await task;

    _urlFile = await taskSnapshot.ref.getDownloadURL();
  }

  _validarCampos() async {
    _nomeProjeto = _controllerNomeProjeto.text;
    _descricaoProjeto = _controllerDescricaoProjeto.text;
    _autorProjeto = _controllerAutorProjeto.text;
    _andamentoProjeto = _controllerAndamentoProjeto.text;

    ProjetoDeLei projetoDeLei = ProjetoDeLei();
    projetoDeLei.id = _projetoDeLei.id;
    projetoDeLei.nomeProjeto = _nomeProjeto;
    projetoDeLei.descricaoProjeto = _descricaoProjeto;
    projetoDeLei.autorProjeto = _autorProjeto;
    projetoDeLei.andamentoProjeto = _andamentoProjeto;
    projetoDeLei.urlFile = _urlFile;
    DateTime selectedDT = DateTime.now();
    projetoDeLei.dataPublicacao = selectedDT;
    FirebaseFirestore db = FirebaseFirestore.instance;
    db
        .collection('Projetos-de-Lei')
        .doc(_projetoDeLei.id)
        .set(projetoDeLei.toMap());
  }

  @override
  void initState() {
    _projetoDeLei = ProjetoDeLei.gerarID();
    print(_projetoDeLei.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Projetos de Lei",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: _controllerNomeProjeto,
              onSaved: (nome) {
                _nomeProjeto = nome;
                print(_nomeProjeto);
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
                  hintText: "Digite o nome do projeto",
                  labelText: "Nome"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controllerDescricaoProjeto,
              onSaved: (descricao) {
                _descricaoProjeto = descricao;
                print(_descricaoProjeto);
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
                  hintText: "Digite a descrição do projeto",
                  labelText: "Descrição"),
              maxLines: 6,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controllerAutorProjeto,
              onSaved: (autor) {
                _autorProjeto = autor;
                print(_autorProjeto);
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
                  hintText: "Digite o nome do autor do projeto",
                  labelText: "Autor"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controllerAndamentoProjeto,
              onSaved: (andamento) {
                _andamentoProjeto = andamento;
                print(_andamentoProjeto);
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
                  hintText: "Descreva o andamento do projeto",
                  labelText: "Andamento"),
              maxLines: 3,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton.icon(
              color: Colors.purple,
              onPressed: () async {
                File pickedFile = await FilePicker.getFile(
                    allowedExtensions: ['pdf'], type: FileType.custom);
                setState(() {
                  file = pickedFile;
                  _upload();
                });
              },
              icon: Icon(
                Icons.cloud_upload,
                color: Colors.white,
                size: 30,
              ),
              label: Text(
                "Upload do arquivo",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                  borderRadius: BorderRadius.circular(15)),
              padding:
                  EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
              onPressed: () async {
                if (formKey.currentState.validate()) {
                  setState(() {
                    _nomeProjeto = _controllerNomeProjeto.text;
                    _descricaoProjeto = _controllerDescricaoProjeto.text;
                    _autorProjeto = _controllerAutorProjeto.text;
                    _andamentoProjeto = _controllerAndamentoProjeto.text;

                    formKey.currentState.save();
                    _validarCampos();

                    formKey.currentState.reset();
                  });
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(_mensagem)
          ],
        ),
      ),
    );
  }
}
