import 'package:flutter/material.dart';

BoxDecoration boxDecoration({cor = Colors.red, borda = 5.0}) => BoxDecoration(
      color: cor,
      borderRadius: BorderRadius.all(
        Radius.circular(borda),
      ),
    );
