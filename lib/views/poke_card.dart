import 'package:flutter/material.dart';


import '../models/pokemon.dart';
import './poke_detail.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;

  PokeCard(this.pokemon);

  void goToDetailView(BuildContext context){
    Navigator.push(context, 
      MaterialPageRoute(builder: (context) => PokeDetail(pokemon))
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToDetailView(context);
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(width: 50, height: 50, child: FadeInImage.assetNetwork( placeholder: 'assets/load.gif' , image: pokemon.img)),
              ],
            ),
            
            Text(
              pokemon.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Text(
              pokemon.number,
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 10)
            )
          ],
        ),
      ),
    );
  }
}
