import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(SorteioApp());
}

class SorteioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SorteioPage(),
    );
  }
}

class SorteioPage extends StatefulWidget {
  @override
  _SorteioPageState createState() => _SorteioPageState();
}

class _SorteioPageState extends State<SorteioPage> {
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();
  int? _numeroSorteado;

  void _sortearNumero() {
    final int min = int.tryParse(_minController.text) ?? 0;
    final int max = int.tryParse(_maxController.text) ?? 100;

    if (min >= max) {
      setState(() {
        _numeroSorteado = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('O valor mínimo deve ser menor que o máximo!')),
      );
      return;
    }

    setState(() {
      _numeroSorteado = Random().nextInt(max - min + 1) + min;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sorteador de Números')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _minController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor Mínimo'),
            ),
            TextField(
              controller: _maxController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor Máximo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sortearNumero,
              child: Text('Sortear Número'),
            ),
            SizedBox(height: 20),
            if (_numeroSorteado != null)
              Text(
                'Número sorteado: $_numeroSorteado',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
