import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textField(TextEditingController controller, String texto, {IconData icon}) => Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 32, right: 32),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: icon!=null ? Icon(icon) : null,
          labelText: texto,
          border: OutlineInputBorder(),
        ),
      ),
    );
