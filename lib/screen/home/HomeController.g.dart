// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$searchAtom = Atom(name: '_HomeControllerBase.search');

  @override
  bool get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(bool value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$numberAtom = Atom(name: '_HomeControllerBase.number');

  @override
  double get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(double value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$valorAtom = Atom(name: '_HomeControllerBase.valor');

  @override
  TextEditingController get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(TextEditingController value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  final _$filtradosAtom = Atom(name: '_HomeControllerBase.filtrados');

  @override
  List<dynamic> get filtrados {
    _$filtradosAtom.reportRead();
    return super.filtrados;
  }

  @override
  set filtrados(List<dynamic> value) {
    _$filtradosAtom.reportWrite(value, super.filtrados, () {
      super.filtrados = value;
    });
  }

  final _$lAtom = Atom(name: '_HomeControllerBase.l');

  @override
  List<Registro> get l {
    _$lAtom.reportRead();
    return super.l;
  }

  @override
  set l(List<Registro> value) {
    _$lAtom.reportWrite(value, super.l, () {
      super.l = value;
    });
  }

  final _$listaInformacoesAtom =
      Atom(name: '_HomeControllerBase.listaInformacoes');

  @override
  List<dynamic> get listaInformacoes {
    _$listaInformacoesAtom.reportRead();
    return super.listaInformacoes;
  }

  @override
  set listaInformacoes(List<dynamic> value) {
    _$listaInformacoesAtom.reportWrite(value, super.listaInformacoes, () {
      super.listaInformacoes = value;
    });
  }

  @override
  String toString() {
    return '''
search: ${search},
number: ${number},
valor: ${valor},
filtrados: ${filtrados},
l: ${l},
listaInformacoes: ${listaInformacoes}
    ''';
  }
}
