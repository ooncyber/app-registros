import 'package:app_lista_conta/screen/home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Widget cabecalhoHome(HomeController con) => ListTile(
      title: Row(
        children: <Widget>[
          Text("Valor gasto: R\$"),
          Observer(
              builder: (_) =>
                  Text(con.number != null ? con.number.toString() : "00"))
        ],
      ),
    );
