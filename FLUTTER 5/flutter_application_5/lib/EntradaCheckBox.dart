import 'package:flutter/material.dart';

class EntradaCheckBox extends StatefulWidget {
  @override
  _EntradaCheckBoxState createState() => _EntradaCheckBoxState();
}

class _EntradaCheckBoxState extends State<EntradaCheckBox> {
  bool _emailChecked = false;
  bool _cellChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Notificações:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Checkbox(
              value: _emailChecked,
              onChanged: (bool? value) {
                setState(() {
                  _emailChecked = value ?? false;
                });
              },
            ),
            Text("E-mail"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _cellChecked,
              onChanged: (bool? value) {
                setState(() {
                  _cellChecked = value ?? false;
                });
              },
            ),
            Text("Celular"),
          ],
        ),
      ],
    );
  }
}
