import 'package:app_lista_conta/screen/components/cabecalhoHome.dart';
import 'package:app_lista_conta/screen/components/listaHome.dart';
import 'package:app_lista_conta/screen/home/HomeController.dart';
import 'package:flutter/material.dart';

Widget listagem(HomeController con) {
  return Column(
    children: <Widget>[
      cabecalhoHome(con),
      Divider(),
      Expanded(
        child: RefreshIndicator(
            onRefresh: () async {
              Duration();
              con.sincronizar();
            },
            child: listaHome(con)),
      )
    ],
  );
}
