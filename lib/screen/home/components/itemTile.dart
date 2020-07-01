import 'package:app_lista_conta/DAO/DAORegistros.dart';
import 'package:app_lista_conta/model/Registro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemTile(BuildContext context, Registro registro) => Container(
      color: Color(int.parse(registro.cor ?? Colors.white.value.toString())),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(registro.motivo.length > 20
                ? registro.motivo.substring(0, 20)
                : registro.motivo),
            registro.futuro != null
                ? Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.amber[400],
                  )
                : SizedBox(),
          ],
        ),
        trailing: Text('R\$ ${registro.valor.toString().padLeft(2, '0')}'),
        subtitle: Text(registro.data),
        
      ),
    );
