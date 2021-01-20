import 'package:cloud_firestore/cloud_firestore.dart';

class ProjetoDeLei {
  String _id;
  String _nomeProjeto;
  String _descricaoProjeto;
  String _autorProjeto;
  String _andamentoProjeto;
  String _urlFile;
  DateTime _dataPublicacao;

  ProjetoDeLei();

  ProjetoDeLei.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.nomeProjeto = documentSnapshot['nomeProjeto'];
    this.descricaoProjeto = documentSnapshot['descricaoProjeto'];
    this.autorProjeto = documentSnapshot['autorProjeto'];
    this.andamentoProjeto = documentSnapshot['andamentoProjeto'];
    this.urlFile = documentSnapshot['urlFile'];
    this.dataPublicacao = documentSnapshot['dataPublicacao'];
  }

  ProjetoDeLei.gerarID() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference projetos = db.collection("Projetos-de-Lei");
    this.id = projetos.doc().id;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.id,
      "nomeProjeto": this.nomeProjeto,
      "descricaoProjeto": this.descricaoProjeto,
      "autorProjeto": this.autorProjeto,
      "andamentoProjeto": this.andamentoProjeto,
      "urlFile": this.urlFile,
      "dataPublicacao": this.dataPublicacao,
    };
    return map;
  }

  String get id => _id;
  set id(String value) {
    _id = value;
  }

  String get nomeProjeto => _nomeProjeto;
  set nomeProjeto(String value) {
    _nomeProjeto = value;
  }

  String get descricaoProjeto => _descricaoProjeto;
  set descricaoProjeto(String value) {
    _descricaoProjeto = value;
  }

  String get autorProjeto => _autorProjeto;
  set autorProjeto(String value) {
    _autorProjeto = value;
  }

  String get andamentoProjeto => _andamentoProjeto;
  set andamentoProjeto(String value) {
    _andamentoProjeto = value;
  }

  String get urlFile => _urlFile;
  set urlFile(String value) {
    _urlFile = value;
  }

  DateTime get dataPublicacao => _dataPublicacao;
  set dataPublicacao(DateTime value) {
    _dataPublicacao = value;
  }
}
