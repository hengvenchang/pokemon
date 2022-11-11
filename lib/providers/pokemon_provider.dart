import 'package:pokemon/features/home/models/home_model.dart';
import 'package:pokemon/providers/api_provider.dart';

class PokemonProvider extends ApiProvider {
  final String _url =
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

  Future<HomeModel> getList() async {
    try {
      final response = await get(_url);
      return HomeModel.fromJson(response);
    } catch (error, stacktrace) {
      return HomeModel.withError("Data not found / Connection issue");
    }
  }
}
