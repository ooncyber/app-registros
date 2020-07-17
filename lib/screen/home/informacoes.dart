import 'dart:developer';

import 'package:app_lista_conta/DAO/DAORegistros.dart';
import 'package:app_lista_conta/screen/components/boxDecoration.dart';
import 'package:app_lista_conta/screen/components/textStyle.dart';
import 'package:app_lista_conta/screen/home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Widget informacoes(HomeController con) {
  double valor = 0.0;
  con.buscaDados();
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 10),
        decoration: boxDecoration(cor: Colors.blue[900], borda: 10.0),
        child: textStyle("Informações", tamanho: 16.0),
      ),
      Expanded(
        child: Observer(builder: (_) {
          return ListView.builder(
              itemCount: con.listaInformacoes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 5),
                  color: Color(
                    int.parse(
                      con.listaInformacoes[index]['cor'],
                    ),
                  ),
                  child: ListTile(
                      title:
                          Text("R\$ ${con.listaInformacoes[index]['total']}")),
                );
              });
        }),
      ),
    ],
  );
}
