import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PrimeiraTela()));
}

class PrimeiraTela extends StatefulWidget {
  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Primeira Tela")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Digite seu nome'),
              controller: _nameController,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => SegundaTela(nome: _nameController.text),
                  ),
                );
              },
              child: Text('Ir para segunda tela'),
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaTela extends StatefulWidget {
  final String nome;

  SegundaTela({required this.nome});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  List<Map<String, String>> _itens = [];

  void _carregarItens() {
    List<Map<String, String>> novosItens = [];
    for (int i = 0; i < 20; i++) {
      novosItens.add({
        "titulo": "Título $i da lista",
        "descricao": "Descrição $i da lista",
      });
    }
    setState(() {
      _itens = novosItens;
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarItens();
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
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Sim"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Não"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Segunda Tela")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Olá, ${widget.nome}!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _itens.length,
                itemBuilder: (context, indice) {
                  final item = _itens[indice];
                  return ListTile(
                    title: Text(item["titulo"] ?? ""),
                    subtitle: Text(item["descricao"] ?? ""),
                    onTap: () {
                      _mostrarAlerta(indice);
                    },
                    onLongPress: () {
                      print("Clique onLongPress no item $indice");
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
