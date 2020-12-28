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

  // ignore: unnecessary_getters_setters
  String get id => _id;
  // ignore: unnecessary_getters_setters
  set id(String value) {
    _id = value;
  }

  // ignore: unnecessary_getters_setters
  String get nome => _nome;
  // ignore: unnecessary_getters_setters
  set nome(String value) {
    _nome = value;
  }

  // ignore: unnecessary_getters_setters
  String get email => _email;
  // ignore: unnecessary_getters_setters
  set email(String value) {
    _email = value;
  }

  // ignore: unnecessary_getters_setters
  String get senha => _senha;
  // ignore: unnecessary_getters_setters
  set senha(String value) {
    _senha = value;
  }

  // ignore: unnecessary_getters_setters
  String get tipoUsuario => _tipoUsuario;
  // ignore: unnecessary_getters_setters
  set tipoUsuario(String value) {
    _tipoUsuario = value;
  }

  // ignore: unnecessary_getters_setters
  String get urlImage => _urlImage;
  // ignore: unnecessary_getters_setters
  set urlImage(String value) {
    _urlImage = value;
  }
}
