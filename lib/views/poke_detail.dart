import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../utils/types.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon _pokemonData;

  PokeDetail(this._pokemonData);

  int getColor(){
    final int color = Types.types[_pokemonData.type[0].toLowerCase()];
    if(color != null){
      return color;
    }
    else{
      return 0xffbcbcae;
    }
  }

  List<Widget> showData(){
    List<Widget> list = [];
    list.add(Text(_pokemonData.name, style: TextStyle(fontWeight: FontWeight.bold),));
    list.add(Text(_pokemonData.number));
    list.add(Text('Height: '+_pokemonData.height));
    list.add(Text('Weight: '+_pokemonData.weight));
    list.add(Text('Type'));
    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _pokemonData.type.map((typ) => Text(typ)).toList(),
    ));
    list.add(Text('Weakness'));
    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      children: _pokemonData.weaknesses.map((weakness) => Text(weakness)).toList(),
    ));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pokemonData.name, textAlign: TextAlign.center),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(_pokemonData.img)),
              color: Color(getColor()),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: showData()
            ),
          ),
        ));
  }
}


