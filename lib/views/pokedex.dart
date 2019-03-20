import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

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
  final increment = 20;
  int currentLength;

  void fetchData() async {
    final response = await http.get(_url);
    final jsonDecoded = json.decode(response.body);
    final list = PokeList.fromJson(jsonDecoded['pokemon']);
    setState(() {
      pokeList = list;
      _isloading = false;
      currentLength = 0;
      _loadMore();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void _loadMore(){
    int size = currentLength + increment; 
    if(size >= pokeList.pokemons.length){
      size =pokeList.pokemons.length;
    }
    setState(() {
      currentLength = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isloading) {
      return Padding(
        padding: EdgeInsets.all(4.0),
        //Loads items lazy mode
        child: LazyLoadScrollView(
          onEndOfPage: () { _loadMore(); },
          child: ListView.builder(
            itemCount: this.currentLength,
            itemBuilder: (context, position){
              return PokeCard(pokeList.pokemons[position]);
            },
          ),
        )
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
