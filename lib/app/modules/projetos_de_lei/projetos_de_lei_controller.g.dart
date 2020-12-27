// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projetos_de_lei_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

final $ProjetosDeLeiController = BindInject(
  (i) => ProjetosDeLeiController(),
  singleton: true,
  lazy: true,
);

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjetosDeLeiController on _ProjetosDeLeiControllerBase, Store {
  final _$valueAtom = Atom(name: '_ProjetosDeLeiControllerBase.value');

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

  final _$_ProjetosDeLeiControllerBaseActionController =
      ActionController(name: '_ProjetosDeLeiControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ProjetosDeLeiControllerBaseActionController
        .startAction(name: '_ProjetosDeLeiControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ProjetosDeLeiControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
