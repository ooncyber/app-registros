import 'package:app_lista_conta/screen/components/pesquisaHome.dart';
import 'package:app_lista_conta/screen/home/HomeController.dart';
import 'package:app_lista_conta/screen/home/Listagem.dart';
import 'package:app_lista_conta/screen/home/informacoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatelessWidget {
  final con = HomeController();

  @override
  Widget build(BuildContext context) {
    con.sincronizar();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Text("Listagem"),
              Text("Informações"),
            ],
          ),
          actions: <Widget>[
            Observer(builder: (_) {
              return con.search ? pesquisaHome(con) : Text('');
            }),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => {
                      if (con.search == false)
                        con.search = true
                      else if (con.valor.text.isEmpty)
                        con.search = false
                    }),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.pushNamed(context, "/adicionar")
                  .then((value) => con.sincronizar()),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            listagem(con),
            informacoes(con)
          ],
        ),
      ),
    );
  }
}
