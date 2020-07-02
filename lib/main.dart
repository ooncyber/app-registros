import 'package:app_lista_conta/Db/Db.dart';
import 'package:app_lista_conta/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final db = Db();
  db.incializaDb();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: '/',
    ),
  );
}
