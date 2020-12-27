import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String _id;
  String _nome;
  String _email;
  String _senha;
  String _tipoUsuario;
  String _urlImage;

  Usuario();

  Usuario.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.id = documentSnapshot.id;
    this.nome = documentSnapshot['nome'];
    this.email = documentSnapshot['email'];
    this.tipoUsuario = documentSnapshot['tipoUsuario'];
    this.urlImage = documentSnapshot['urlImage'];
  }

  Usuario.gerarID() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference condominios = db.collection("Usuarios-Admin");
    this.id = condominios.doc().id;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.id,
      "nome": this.nome,
      "email": this.email,
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

  String get tipoUsuario => _tipoUsuario;
  set tipoUsuario(String value) {
    _tipoUsuario = value;
  }

  String get urlImage => _urlImage;
  set urlImage(String value) {
    _urlImage = value;
  }
}
