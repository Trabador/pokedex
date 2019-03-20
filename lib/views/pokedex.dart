import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../models/pokelist.dart';
import '../models/pokemon.dart';
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
  List<Pokemon> lazylist;
  final increment = 20;
  int currentLength = 0;
  int test;

  void fetchData() async {
    final response = await http.get(_url);
    final jsonDecoded = json.decode(response.body);
    final list = PokeList.fromJson(jsonDecoded['pokemon']);
    setState(() {
      test = 0;
      pokeList = list;
      lazylist = [];
      _isloading = false;
      _loadMore();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void _loadMore(){
    // List<Pokemon> auxiliarList = [];
    // for (var i = currentLength; (i <= currentLength + increment) && (i <=pokeList.pokemons.length); i++) {
    //     auxiliarList.add(pokeList.pokemons[i]);
    // }
    // int size = this.test + increment;
    // print(pokeList.pokemons.length);
    // // size = size > pokeList.pokemons.length? pokeList.pokemons.length : size+increment;
    // if(size > pokeList.pokemons.length)
    //   size = pokeList.pokemons.length;

    int size = test + increment; 
    if(size >= pokeList.pokemons.length){
      size =pokeList.pokemons.length;
    }
    print(size);
    setState(() {
      // lazylist = []..addAll(lazylist)..addAll(auxiliarList);//append the lists
      // currentLength = lazylist.length;
      test = size;
      print(test);
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
            itemCount: this.test,
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
