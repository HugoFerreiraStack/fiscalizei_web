// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noticias_controller.dart';

final $NoticiasController = BindInject(
  (i) => NoticiasController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoticiasController on _NoticiasControllerBase, Store {
  final _$valueAtom = Atom(name: '_NoticiasControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_NoticiasControllerBaseActionController =
      ActionController(name: '_NoticiasControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_NoticiasControllerBaseActionController.startAction(
        name: '_NoticiasControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_NoticiasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
