import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/pokelist.dart';


class Pokedex extends StatefulWidget{
  @override
  State<Pokedex> createState() => PokedexState();
}

class PokedexState extends State<Pokedex>{

  final String _url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokeList pokeList;

  void fetchData() async{
    final response = await http.get(_url);
    final jsonDecoded = json.decode(response.body);
    final list = PokeList.fromJson(jsonDecoded['pokemon']);
    print(jsonDecoded);
    setState(() {
      pokeList = list;
    });
  }
  
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    if(pokeList != null){
      return GridView.count(
        crossAxisCount: 2,
        children: pokeList.pokemons.map((pokemon) => Card()).toList(),
      );
    }
    else{
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}