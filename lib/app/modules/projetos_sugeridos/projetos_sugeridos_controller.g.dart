// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projetos_sugeridos_controller.dart';

final $ProjetosSugeridosController = BindInject(
  (i) => ProjetosSugeridosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjetosSugeridosController on _ProjetosSugeridosControllerBase, Store {
  final _$valueAtom = Atom(name: '_ProjetosSugeridosControllerBase.value');

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

  final _$_ProjetosSugeridosControllerBaseActionController =
      ActionController(name: '_ProjetosSugeridosControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ProjetosSugeridosControllerBaseActionController
        .startAction(name: '_ProjetosSugeridosControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ProjetosSugeridosControllerBaseActionController
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
