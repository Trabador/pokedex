import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../utils/types.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon _pokemonData;

  PokeDetail(this._pokemonData);

  int getColor() {
    final int color = Types.types[_pokemonData.type[0].toLowerCase()];
    if (color != null) {
      return color;
    } else {
      return 0xffbcbcae;
    }
  }

  List<Widget> listData() {
    List<Widget> list = [];
    list.add(SizedBox(
      height: 10,
    ));
    list.add(Text(
      _pokemonData.name,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ));
    list.add(Text('N°' + _pokemonData.number));
    list.add(Text('Height: ' + _pokemonData.height));
    list.add(Text('Weight: ' + _pokemonData.weight));
    list.add(Text('Type'));
    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _pokemonData.type
          .map((typ) => Container(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(typ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
              ))
          .toList(),
    ));
    list.add(Text('Weakness'));
    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _pokemonData.weaknesses
          .map((weakness) => Container(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(weakness),
                ),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
              ))
          .toList(),
    ));
    return list;
  }

  Widget dataDetail() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 300,
              height: 350,
              decoration: BoxDecoration(
                  color: Color(getColor()),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [ BoxShadow(color: Colors.black, blurRadius: 15, offset: Offset(0, 20), spreadRadius: -10)]
                  ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: listData()),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_pokemonData.img))),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pokemonData.name, textAlign: TextAlign.center),
        ),
        body: dataDetail());
  }
}
