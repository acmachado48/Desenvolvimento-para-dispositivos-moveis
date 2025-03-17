import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  final String label;
  final TextInputType keyboard;
  final int? maxLength;
  final bool isPassword;

  const CampoTexto({
    Key? key,
    required this.label,
    required this.keyboard,
    this.maxLength,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  late TextEditingController _textEditingController;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: _textEditingController,
        keyboardType: widget.keyboard,
        maxLength: widget.maxLength,
        obscureText: widget.isPassword && _obscureText,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(),
          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                  : null,
        ),
      ),
    );
  }
}
