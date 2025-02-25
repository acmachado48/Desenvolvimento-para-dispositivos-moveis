import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 118, 165, 111),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter1 = 0;
  int _counter2 = 0;

  void _incrementCounter1() {
    setState(() => _counter1++);
  }

  void _incrementCounter2() {
    setState(() => _counter2++);
  }

  void _resetCounters() {
    setState(() {
      _counter1 = 0;
      _counter2 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _resetCounters,
            tooltip: 'Resetar contadores',
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterDisplay(label: 'Botão 1', count: _counter1),
            const SizedBox(height: 20),
            CounterDisplay(label: 'Botão 2', count: _counter2),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter1,
            tooltip: 'Incrementar Contador 1',
            child: const Icon(Icons.exposure_plus_1),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _incrementCounter2,
            tooltip: 'Incrementar Contador 2',
            child: const Icon(Icons.exposure_plus_2),
          ),
        ],
      ),
    );
  }
}

// Widget separado para exibir um contador
class CounterDisplay extends StatelessWidget {
  final String label;
  final int count;

  const CounterDisplay({super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$label foi pressionado $count vezes'),
        Text('$count', style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
