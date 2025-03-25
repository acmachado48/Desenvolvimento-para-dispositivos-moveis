import 'package:flutter/material.dart';

class EntradaSlide extends StatefulWidget {
  final String titulo;
  final double min;
  final double max;
  final int divisores;

  const EntradaSlide({
    Key? key,
    required this.titulo,
    required this.min,
    required this.max,
    this.divisores = 10,
  }) : super(key: key);

  @override
  _EntradaSlideState createState() => _EntradaSlideState();
}

class _EntradaSlideState extends State<EntradaSlide> {
  double _valor = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titulo,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: _valor,
          min: widget.min,
          max: widget.max,
          divisions: widget.divisores,
          label: _valor.toStringAsFixed(1),
          onChanged: (double value) {
            setState(() {
              _valor = value;
            });
          },
        ),
      ],
    );
  }
}
