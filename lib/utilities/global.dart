import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class Global {
  static const Color colorBlanco = const Color(0xffffffff);
  static const Color colorAzul = Color.fromARGB(255, 63, 9, 237);
  static const Color color2 = Color.fromARGB(255, 30, 197, 227);
  static const Color colorNegor = Color.fromARGB(255, 0, 0, 0);

  static void mensaje(BuildContext context, String mensaje, String titulo,{Color backgroundColorCustom = Colors.redAccent}) {

    Flushbar(
  title: titulo,
  message: mensaje,
  duration: const Duration(seconds: 3),
  flushbarPosition: FlushbarPosition.TOP,
  flushbarStyle: FlushbarStyle.GROUNDED,
  backgroundColor:backgroundColorCustom,
  isDismissible: false,
).show(context);
  }
}
