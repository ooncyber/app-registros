import 'package:app_lista_conta/DAO/DAORegistros.dart';
import 'package:app_lista_conta/screen/home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Widget listaHome(HomeController con) => Observer(
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
                      child: Container(
                        color: Color(int.parse(con.filtrados[index].cor ??
                            Colors.white.value.toString())),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(con.filtrados[index].motivo.length > 20
                                  ? con.filtrados[index].motivo.substring(0, 20)
                                  : con.filtrados[index].motivo),
                              con.filtrados[index].futuro != null
                                  ? Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.amber[400],
                                    )
                                  : SizedBox(),
                            ],
                          ),
                          trailing: Text(
                              'R\$ ${con.filtrados[index].valor.toString().padLeft(2, '0')}'),
                          subtitle: Text(con.filtrados[index].data),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/adicionar",
                            arguments: {"registro": con.filtrados[index]});
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
    );
