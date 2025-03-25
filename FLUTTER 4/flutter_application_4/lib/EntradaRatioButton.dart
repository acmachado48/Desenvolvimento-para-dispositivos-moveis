import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  String? _generoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text("Gênero: ", style: TextStyle(fontSize: 18)),
          Row(
            children: [
              Radio(
                value: "Masculino",
                groupValue: _generoSelecionado,
                onChanged: (value) {
                  setState(() {
                    _generoSelecionado = value as String;
                  });
                },
              ),
              Text("Masculino"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "Feminino",
                groupValue: _generoSelecionado,
                onChanged: (value) {
                  setState(() {
                    _generoSelecionado = value as String;
                  });
                },
              ),
              Text("Feminino"),
            ],
          ),
        ],
      ),
    );
  }
}
