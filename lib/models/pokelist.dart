import './pokemon.dart';

class PokeList {
  List<Pokemon> pokemons;

  PokeList({ this.pokemons });

  factory PokeList.fromJson(List<dynamic> json){
    if(json != null){
      List<Pokemon> list = json.map((item) => Pokemon.fromJson(item)).toList();

      return PokeList(pokemons: list);
    }
    return null;
  }
}