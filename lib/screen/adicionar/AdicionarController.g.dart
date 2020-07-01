// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdicionarController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdicionarController on _AdicionarControllerBase, Store {
  final _$regAtom = Atom(name: '_AdicionarControllerBase.reg');

  @override
  Registro get reg {
    _$regAtom.reportRead();
    return super.reg;
  }

  @override
  set reg(Registro value) {
    _$regAtom.reportWrite(value, super.reg, () {
      super.reg = value;
    });
  }

  final _$motivoAtom = Atom(name: '_AdicionarControllerBase.motivo');

  @override
  TextEditingController get motivo {
    _$motivoAtom.reportRead();
    return super.motivo;
  }

  @override
  set motivo(TextEditingController value) {
    _$motivoAtom.reportWrite(value, super.motivo, () {
      super.motivo = value;
    });
  }

  final _$dataAtom = Atom(name: '_AdicionarControllerBase.data');

  @override
  String get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$valorAtom = Atom(name: '_AdicionarControllerBase.valor');

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

  final _$futuroAtom = Atom(name: '_AdicionarControllerBase.futuro');

  @override
  bool get futuro {
    _$futuroAtom.reportRead();
    return super.futuro;
  }

  @override
  set futuro(bool value) {
    _$futuroAtom.reportWrite(value, super.futuro, () {
      super.futuro = value;
    });
  }

  final _$corAtom = Atom(name: '_AdicionarControllerBase.cor');

  @override
  Color get cor {
    _$corAtom.reportRead();
    return super.cor;
  }

  @override
  set cor(Color value) {
    _$corAtom.reportWrite(value, super.cor, () {
      super.cor = value;
    });
  }

  @override
  String toString() {
    return '''
reg: ${reg},
motivo: ${motivo},
data: ${data},
valor: ${valor},
futuro: ${futuro},
cor: ${cor}
    ''';
  }
}
