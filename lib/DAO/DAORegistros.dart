import 'dart:developer';

import 'package:app_lista_conta/Db/Db.dart';
import 'package:app_lista_conta/model/Registro.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DAORegistros {
  static Future<bool> inserir(Registro reg) async {
    Database db = await Db.db;
    if (reg.id != null && reg.id != 0)
      db.update(Db.DB_TABLE, reg.toJson(), where: "id = ${reg.id}");
    else
      db.insert(Db.DB_TABLE, reg.toJson());
    log("inserir executado");
  }

  static Future<List<Registro>> listar() async {
    Database db = await Db.db;
    var s = await db.query(Db.DB_TABLE);
    List<Registro> f = [];
    s.toList().forEach((element) {
      var r = Registro();
      r.id = element['id'];
      r.data = element['data'];
      r.motivo = element['motivo'];
      r.valor = double.parse(
          element['valor'] == null ? '0' : element['valor'].toString());
      r.futuro = element['futuro'];
      r.cor = element['cor'];
      f.add(r);
    });
    return f;
  }

  static Future<int> excluir(Registro reg) async {
    Database db = await Db.db;
    int r = await db.delete(Db.DB_TABLE, where: "ID=${reg.id}");
    log("excluir executado");
    return r;
  }


  static teste() async{
    DAORegistros.inserir(Registro(motivo: 'teste1', valor: 10, ));
    DAORegistros.inserir(Registro(motivo: 'teste2', valor: 11, ));
    DAORegistros.inserir(Registro(motivo: 'teste3', valor: 12, ));
    DAORegistros.inserir(Registro(motivo: 'teste4', valor: 13, ));
    DAORegistros.inserir(Registro(motivo: 'teste5', valor: 14, ));
    DAORegistros.inserir(Registro(motivo: 'teste6', valor: 15, ));
  }
}
