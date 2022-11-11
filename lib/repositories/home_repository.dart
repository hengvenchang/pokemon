import 'package:pokemon/features/home/models/home_model.dart';
import 'package:pokemon/providers/pokemon_provider.dart';

class HomeRepository {
  final _provider = PokemonProvider();

  Future<HomeModel> getList() {
    return _provider.getList();
  }
}

class NetworkError extends Error {}
