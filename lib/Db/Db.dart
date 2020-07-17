import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class Db {
  static String DB_NAME = "db.db";
  static String DB_TABLE = "registros";
  static get db async => await openDatabase(DB_NAME);

  incializaDb() async {
    Database db =
        await openDatabase(DB_NAME, version: 1, onCreate: (db, version) {
          db.execute('''create table $DB_TABLE (
            id integer primary key,
            data TEXT,
            motivo TEXT,
            valor NUMERIC(18,0),
            futuro bit,
            cor TEXT,
            destino TEXT)
            ''');
      log("---DB CRIADO---");
    });
  }

  deletaDb() {
    deleteDatabase(DB_NAME);
    log("Db deletado");
  }
  
}
