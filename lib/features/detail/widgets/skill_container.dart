import 'package:flutter/material.dart';
import 'package:pokemon/styles/fonts.dart';

final skills = ['speed', 'hp', 'attack', 'defense'];

class SkillContainer extends StatelessWidget {
  final pokemon;
  final textColor;
  const SkillContainer({key, this.pokemon, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      for (var item in skills)
        Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(children: [
              Text(_getItemValue(item).toString(),
                  style: TextStyle(
                      color: textColor, fontSize: FontSizeContants.body)),
              Icon(
                _getIcon(item),
                size: 30.0,
                color: textColor,
              ),
            ]))
    ]);
  }

  _getItemValue(type) {
    switch (type) {
      case 'speed':
        return pokemon.speed;
      case 'hp':
        return pokemon.hp;
      case 'attack':
        return pokemon.attack;
      case 'defense':
        return pokemon.defense;
      default:
        return 0;
    }
  }

  _getIcon(type) {
    switch (type) {
      case 'speed':
        return Icons.directions_run;
      case 'hp':
        return Icons.favorite;
      case 'attack':
        return Icons.hardware;
      case 'defense':
        return Icons.shield;
      default:
        return Icons.shield;
    }
  }
}
