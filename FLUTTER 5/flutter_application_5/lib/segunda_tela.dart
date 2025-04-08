import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  List<Map<String, String>> _itens = [];

  void _carregarItens() {
    _itens = List.generate(25, (index) {
      return {
        "titulo": "Título $index da lista",
        "descricao": "Descrição $index da lista",
      };
    });
  }

  void _mostrarAlerta(int indice) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alerta"),
          content: Text("Você clicou no item $indice"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Sim"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Não"),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _carregarItens();
  }

  @override
  Widget build(BuildContext context) {
    final String nome = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text("Bem vindo(a), $nome")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Olá, $nome!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _itens.length,
                itemBuilder: (context, indice) {
                  final item = _itens[indice];
                  return ListTile(
                    title: Text(item["titulo"] ?? ""),
                    subtitle: Text(item["descricao"] ?? ""),
                    onTap: () => _mostrarAlerta(indice),
                    onLongPress: () {
                      print("Clique longo no item $indice");
                      // Você pode mostrar outro alerta aqui se quiser
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
