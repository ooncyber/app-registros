import 'package:app_lista_conta/DAO/DAORegistros.dart';
import 'package:app_lista_conta/helpers/data.dart';
import 'package:app_lista_conta/model/Registro.dart';
import 'package:app_lista_conta/screen/adicionar/components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import 'AdicionarController.dart';

class Adicionar extends StatelessWidget {
  var _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var con = new AdicionarController();
    Map args = ModalRoute.of(context).settings.arguments;
    Registro reg;
    if (args != null) reg = args['registro'];

    if (reg != null) {
      print(reg.motivo);

      if (reg.motivo != null) {
        con.motivo.text = reg.motivo;
      }
      if (reg.valor != null) {
        con.valor.text = reg.valor.toString();
      }
      if (reg.futuro != null) {
        con.futuro = reg.futuro;
      }
    }
    con.data = Data.dataAtual();

    return Observer(
      builder: (_) => Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text(reg != null ? reg.motivo : "Adicionar novo"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (con.motivo.text != null &&
                    con.motivo.text.isNotEmpty &&
                    con.valor.text != null &&
                    con.valor.text.isNotEmpty) {
                  try {
                    var r = Registro(
                        id: reg!=null ? reg.id : null,
                        cor: con.cor.value.toString() ??
                            Colors.white.value.toString(),
                        data: con.data,
                        futuro: con.futuro,
                        motivo: con.motivo.text,
                        valor: double.parse(con.valor.text));
                    DAORegistros.inserir(r);
                    Navigator.pop(context);
                  } catch (e) {
                    print("erro: " + e.toString());
                  }
                } else {
                  _key.currentState.showSnackBar(SnackBar(
                    content: Text("Campos em branco!"),
                    backgroundColor: Colors.red[800],
                    duration: Duration(seconds: 4),
                  ));
                }
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: 12), child: Text(con.data)),
            textField(con.motivo, "Motivo"),
            textField(con.valor, "Valor", icon: Icons.attach_money),
            InkWell(
              onTap: () {
                con.futuro = !con.futuro;
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Observer(builder: (_) {
                      return Checkbox(
                        value: con.futuro,
                        onChanged: (v) {
                          con.futuro = v;
                        },
                      );
                    }),
                    Text("Valor futuro")
                  ],
                ),
              ),
            ),
            RaisedButton(
              child: Text("Cor"),
              onPressed: () {
                showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text("Escolha uma cor"),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: Colors.white,
                        onColorChanged: (color) {
                          con.cor = color;
                        },
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: Container(
                color: con.cor,
                child: ListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
