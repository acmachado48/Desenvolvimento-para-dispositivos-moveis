import 'package:flutter/material.dart';
import 'login_page.dart';
import 'segunda_tela.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/segunda': (context) => SegundaTela(),
      },
    ),
  );
}
