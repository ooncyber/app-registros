import 'package:app_lista_conta/helpers/data.dart';
import 'package:flutter/material.dart';

class Registro {
  int id;
  String data;
  double valor;
  String motivo;
  String cor;
  bool futuro;
  bool visivel;

  Registro(
      {this.id,
      this.data,
      this.valor,
      this.motivo,
      this.cor,
      this.futuro = false,
      this.visivel = true}) {
    data = data ?? Data.dataAtual();
  }

  toJson() {
    return {
      "data": data,
      "valor": valor,
      "motivo": motivo,
      "cor": cor
    };
  }

  fromJson(Map json) {
    this.id = json['id'];
    this.data = json['data'];
    this.valor = json['valor'];
    this.motivo = json['motivo'];
    this.cor = json['cor'];
    this.futuro = json['futuro'];
    return this;
  }
}
