import 'package:app_lista_conta/screen/home/HomeController.dart';
import 'package:flutter/material.dart';

Widget pesquisaHome(HomeController con) => Expanded(
      child: TextField(
        onChanged: (v) {
          con.number = 0;
          con.filtrados = con.l
              .where((element) =>
                  element.motivo.toLowerCase().contains(v.toLowerCase()))
              .toList();
          con.filtrados.forEach((element) {
            con.number += element.valor;
          });
        },
        controller: con.valor,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
