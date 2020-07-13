import 'package:app_lista_conta/DAO/DAORegistros.dart';
import 'package:app_lista_conta/model/Registro.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'HomeController.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  bool search = false;

  @observable
  double number = 0;

  @observable
  var valor = TextEditingController();

  @observable
  List filtrados = List();

  @observable
  List<Registro> l = [];

  sincronizar() async {
    number = 0;
    var f = await DAORegistros.listar();
    l.clear();
    f.forEach((element) {
      l.add(element);
    });
    filtrados = l;
    filtrados.forEach((element) {
      number += element.valor;
    });
  }

  @observable
  var listaInformacoes = List();

  buscaDados() async {
    var dados = await DAORegistros.listar();
    for (var i = 0; i < dados.length; i++) {
      
    }
    lista.add({"cor": element.cor, "valor": element.valor});
    listaInformacoes = lista;
  }
}
