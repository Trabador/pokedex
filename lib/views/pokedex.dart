import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/pokelist.dart';
import '../views/poke_card.dart';

class Pokedex extends StatefulWidget {
  @override
  State<Pokedex> createState() => PokedexState();
}

class PokedexState extends State<Pokedex> {
  final String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  bool _isloading = true;
  PokeList pokeList;

  void fetchData() async {
    final response = await http.get(_url);
    final jsonDecoded = json.decode(response.body);
    final list = PokeList.fromJson(jsonDecoded['pokemon']);
    setState(() {
      pokeList = list;
      _isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isloading) {
      return Padding(
        padding: EdgeInsets.all(4.0),
        child: GridView.count(
          crossAxisCount: 3,
          children:
              pokeList.pokemons.map((pokemon) => (PokeCard(pokemon))).toList(),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
