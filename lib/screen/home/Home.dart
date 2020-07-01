import 'package:app_lista_conta/DAO/DAORegistros.dart';
import 'package:app_lista_conta/Db/Db.dart';
import 'package:app_lista_conta/helpers/data.dart';
import 'package:app_lista_conta/model/Registro.dart';
import 'package:app_lista_conta/screen/home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'components/itemTile.dart';

class Home extends StatelessWidget {
  final con = HomeController();

  @override
  Widget build(BuildContext context) {
    con.sincronizar();

    // DAORegistros.inserir(Registro(motivo: 'teste1', valor: 10, ));
    // DAORegistros.inserir(Registro(motivo: 'teste2', valor: 10, ));
    // DAORegistros.inserir(Registro(motivo: 'teste3', valor: 10, ));
    // DAORegistros.inserir(Registro(motivo: 'teste4', valor: 10, ));
    // DAORegistros.inserir(Registro(motivo: 'teste5', valor: 10, ));
    // DAORegistros.inserir(Registro(motivo: 'teste6', valor: 10, ));

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Observer(builder: (_) {
            return con.search
                ? Expanded(
                    child: TextField(
                      onChanged: (v) {
                        con.number = 0;
                        con.filtrados = con.l
                            .where((element) => element.motivo
                                .toLowerCase()
                                .contains(v.toLowerCase()))
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
                  )
                : Text('');
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
      body: Column(
        children: <Widget>[
          ListTile(
            title: Row(
              children: <Widget>[
                Text("Valor gasto: R\$"),
                Observer(
                    builder: (_) =>
                        Text(con.number != null ? con.number.toString() : "00"))
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                Duration();
                con.sincronizar();
              },
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                      itemCount: con.filtrados.length,
                      itemBuilder: (context, index) {
                        if (!con.filtrados[index].visivel) return SizedBox();

                        return Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(top: 10, bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                child: Text(
                                  con.filtrados[index].data,
                                  style: TextStyle(color: Colors.white),
                                )),
                            Observer(builder: (_) {
                              return InkWell(
                                child: itemTile(context, con.filtrados[index]),
                                onTap: () {
                                  Navigator.pushNamed(context, "/adicionar",
                                      arguments: {
                                        "registro": con.filtrados[index]
                                      });
                                },
                                onLongPress: () {
                                  DAORegistros.excluir(con.filtrados[index]);
                                  con.sincronizar();
                                },
                              );
                            }),
                          ],
                        );
                      });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
