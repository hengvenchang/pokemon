import 'package:flutter/material.dart';
import 'package:pokemon/styles/fonts.dart';

class PropertyContainer extends StatelessWidget {
  final pokemon;
  final textColor;
  const PropertyContainer({key, this.pokemon, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildItemRow()]);
  }

  @override
  Widget _buildItemRow() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                pokemon.id,
                style: TextStyle(
                    fontSize: FontSizeContants.title, color: textColor),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                pokemon.name,
                style: TextStyle(fontSize: FontSizeContants.title),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Text('Weight: ' + pokemon.weight,
                  style: TextStyle(
                      fontSize: FontSizeContants.description,
                      color: textColor))),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Text('Height: ' + pokemon.height,
                  style: TextStyle(
                      fontSize: FontSizeContants.description,
                      color: textColor))),
          Row(children: [
            for (var item in pokemon.types)
              Text(item + ' ',
                  style: TextStyle(
                      fontSize: FontSizeContants.description, color: textColor))
          ])
        ]);
  }
}
