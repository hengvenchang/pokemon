import 'package:pokemon/features/home/models/pokemon_model.dart';
import 'dart:convert';

class HomeModel {
  List<PokemonModel>? pokemons;
  String? error;

  HomeModel({this.pokemons});

  HomeModel.withError(String errorMessage) {
    error = errorMessage;
  }

  HomeModel.fromJson(data) {
    final List k = json.decode(data);
    pokemons = [];
    k.forEach((v) {
      pokemons!.add(new PokemonModel.fromJson(v));
    });
  }
}
