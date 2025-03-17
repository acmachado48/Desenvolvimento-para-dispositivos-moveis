import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool _notificacaoEmail = false;
  bool _notificacaoCelular = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notificações:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('E-mail'),
            Switch(
              value: _notificacaoEmail,
              onChanged: (bool value) {
                setState(() {
                  _notificacaoEmail = value;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Celular'),
            Switch(
              value: _notificacaoCelular,
              onChanged: (bool value) {
                setState(() {
                  _notificacaoCelular = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
