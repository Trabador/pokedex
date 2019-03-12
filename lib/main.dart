import 'package:flutter/material.dart';

import './views/pokedex.dart';

void main() => runApp(PokeApp());

class PokeApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Pokedex(),
    );
  }
}