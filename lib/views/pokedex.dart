import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Pokedex extends StatefulWidget{
  @override
  State<Pokedex> createState() => PokedexState();
}

class PokedexState extends State<Pokedex>{

  final String _url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  void fetchData() async{
    final response = await http.get(_url);
    final data = json.decode(response.body);
    print(data);
  }
  
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Text('test pokedex');
  }
}