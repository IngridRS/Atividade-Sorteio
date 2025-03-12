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
  String? nome_sorteado;

  List<String> nomes = [
    "Ana",
    "Bruno",
    "Carlos",
    "Daniela",
    "Eduardo",
    "Fernanda",
    "Gabriel",
    "Helena",
    "Igor",
    "Juliana",
    "Kleber",
    "Larissa",
    "Marcos",
    "Natália",
    "Otávio",
    "Patrícia",
    "Quintino",
    "Rafaela",
    "Samuel",
    "Tatiane",
    "Ubirajara",
    "Vanessa",
    "Wagner",
    "Xavier",
    "Yasmin",
    "Zuleica",
    "Anderson",
    "Beatriz",
    "Caio",
    "Denise",
    "Enzo",
    "Flávia",
    "Giovanni",
    "Heloísa",
    "Isabela",
    "Jorge",
    "Karen",
    "Leonardo",
    "Melissa",
    "Nelson",
    "Orlando",
    "Priscila",
    "Raul",
    "Sabrina",
    "Tadeu",
    "Ursula",
    "Valter",
    "Washington",
    "Ximena",
    "Yago"
  ];

  void _sortearNome() {
    setState(() {
      nome_sorteado = nomes[Random().nextInt(nomes.length - 1)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sorteador de Nomes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.extent(
              maxCrossAxisExtent: 5,
              children: <Widget>[
                for (int i = 0; i < nomes.length; i++) ...[Text(nomes[i])]
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sortearNome,
              child: const Text('Nome Sorteado'),
            ),
            const SizedBox(height: 20),
            if (nome_sorteado != null)
              Text(
                'Nome sorteado: $nome_sorteado',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
