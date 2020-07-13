import 'package:flutter/material.dart';

Widget textStyle(String valor,
        {corFonte = Colors.white, corBackground, tamanho, peso, decoracao}) =>
    Text(
      valor,
      style: TextStyle(
        decoration: decoracao,
        color: corFonte,
        backgroundColor: corBackground,
        fontSize: tamanho,
        fontWeight: peso,
      ),
    );
