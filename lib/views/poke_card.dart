import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import './poke_detail.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;

  PokeCard(this.pokemon);

  void goToDetailView(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PokeDetail(pokemon)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToDetailView(context);
      },
      child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 50,
                          height: 50,
                          child: FadeInImage.assetNetwork(
                              placeholder: 'assets/load.gif',
                              image: pokemon.img)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        pokemon.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(pokemon.number,
                      textAlign: TextAlign.end, style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          )),
    );
  }
}
