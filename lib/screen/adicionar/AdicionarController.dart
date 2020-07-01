import 'package:app_lista_conta/model/Registro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
part 'AdicionarController.g.dart';

class AdicionarController = _AdicionarControllerBase with _$AdicionarController;

abstract class _AdicionarControllerBase with Store {
  @observable
  Registro reg;

  @observable
  var motivo = TextEditingController();

  @observable
  String data = "";

  @observable
  var valor = TextEditingController();

  @observable
  bool futuro = false;

  @observable
  Color cor = Colors.white;
}
