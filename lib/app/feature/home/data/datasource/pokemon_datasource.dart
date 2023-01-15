import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/core/rest_client/rest_client.dart';
import 'package:pokedex_franq/app/core/utils/logger.dart';

import '../../../../core/error/default_exceptions.dart';
import '../model/pokemon_list_model.dart';
import '../model/pokemon_model.dart';

abstract class PokemonDatasource {
  Future<PokemonModel> getPokemonByUrl({required String url});
  Future<List<PokemonListModel>> getPokemons();
}

@LazySingleton(as: PokemonDatasource)
class PokemonDatasourceImpl extends PokemonDatasource {
  final RestClient _httpClient;

  PokemonDatasourceImpl(this._httpClient);

  @override
  Future<PokemonModel> getPokemonByUrl({required String url}) async {
    try {
      final result = await _httpClient.get(
        url,
      );

      final pokemon = PokemonModel.fromMap(result.data);

      return pokemon;
    } catch (e) {
      logger('Error -> $e');
      throw DefaultException('$e');
    }
  }

  @override
  Future<List<PokemonListModel>> getPokemons({int offset = 0}) async {
    try {
      final result = await _httpClient.get(
        '/pokemon',
        queryParameters: {
          'offset': offset,
          'limit': 20,
        },
      );

      var data = result.data['results'] as List<dynamic>;

      final pokemonList = data.map((e) => PokemonListModel.fromMap(e)).toList();

      return pokemonList;
    } catch (e) {
      logger('Error -> $e');
      throw DefaultException('$e');
    }
  }
}
