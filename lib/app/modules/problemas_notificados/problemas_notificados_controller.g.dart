// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problemas_notificados_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

final $ProblemasNotificadosController = BindInject(
  (i) => ProblemasNotificadosController(),
  singleton: true,
  lazy: true,
);

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProblemasNotificadosController
    on _ProblemasNotificadosControllerBase, Store {
  final _$valueAtom = Atom(name: '_ProblemasNotificadosControllerBase.value');

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

  final _$_ProblemasNotificadosControllerBaseActionController =
      ActionController(name: '_ProblemasNotificadosControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ProblemasNotificadosControllerBaseActionController
        .startAction(name: '_ProblemasNotificadosControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ProblemasNotificadosControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
