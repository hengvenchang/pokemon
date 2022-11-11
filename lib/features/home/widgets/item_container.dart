import 'package:flutter/material.dart';
import 'package:pokemon/features/detail/screens/detail_page.dart';
import 'package:pokemon/styles/colors.dart';
import 'package:pokemon/styles/fonts.dart';

class ItemContainer extends StatelessWidget {
  final pokemon;
  final pokemons;
  final index;
  const ItemContainer({super.key, this.pokemon, this.pokemons, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Card(
          child: InkWell(
        onTap: (() => pushToNewDetailPage(context, index)),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildLeftContainer(context),
              _buildRightContainer(context),
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildLeftContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                pokemon.id,
                style: TextStyle(fontSize: FontSizeContants.title),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text(
                pokemon.name,
                style: TextStyle(fontSize: FontSizeContants.body),
              )),
          Row(children: [
            for (var item in pokemon.types)
              Text(item + ' ',
                  style: TextStyle(
                      fontSize: FontSizeContants.description,
                      color: FontColorsConstants.description))
          ]),
        ],
      ),
    );
  }

  Widget _buildRightContainer(BuildContext context) {
    return Image.network(
      pokemon.imageurl,
      width: 200,
      height: 150,
    );
  }

  pushToNewDetailPage(context, index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailPage(
                pokemon: pokemon,
                pokemons: pokemons,
                pokemonIndex: index,
              )),
    );
  }
}
