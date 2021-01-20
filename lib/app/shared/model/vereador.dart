import 'package:cloud_firestore/cloud_firestore.dart';

class Vereador {
  String _id;
  String _nome;
  String _email;
  String _senha;
  String _partido;
  String _biografia;
  String _cidade;
  String _tipoUsuario;
  String _urlImage;

  Vereador();

  Vereador.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.id = documentSnapshot.id;
    this.nome = documentSnapshot['nome'];
    this.email = documentSnapshot['email'];
    this.partido = documentSnapshot['partido'];
    this.biografia = documentSnapshot['biografia'];
    this.cidade = documentSnapshot['cidade'];
    this.tipoUsuario = documentSnapshot['tipoUsuario'];
    this.urlImage = documentSnapshot['urlImage'];
  }

  Vereador.gerarID() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference vereadores = db.collection("Vereadores");
    this.id = vereadores.doc().id;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.id,
      "nome": this.nome,
      "email": this.email,
      "partido": this.partido,
      "biografia": this.biografia,
      "cidade": this.cidade,
      "tipoUsuario": this.tipoUsuario,
      "urlImage": this.urlImage,
    };
    return map;
  }

  String get id => _id;
  set id(String value) {
    _id = value;
  }

  String get nome => _nome;
  set nome(String value) {
    _nome = value;
  }

  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String get senha => _senha;
  set senha(String value) {
    _senha = value;
  }

  String get partido => _partido;
  set partido(String value) {
    _partido = value;
  }

  String get cidade => _cidade;
  set cidade(String value) {
    _cidade = value;
  }

  String get biografia => _biografia;
  set biografia(String value) {
    _biografia = value;
  }

  String get tipoUsuario => _tipoUsuario;
  set tipoUsuario(String value) {
    _tipoUsuario = value;
  }

  String get urlImage => _urlImage;
  set urlImage(String value) {
    _urlImage = value;
  }
}
