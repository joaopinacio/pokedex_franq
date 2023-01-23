import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/core/utils/logger.dart';

import '../../../../core/error/default_exceptions.dart';
import '../../../../core/sqflite/sqflite.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../pokemon_add/data/model/pokemon_custom_model.dart';

abstract class PokemonCustomDatasource {
  Future<List<PokemonCustomModel>> getPokemons();
}

@LazySingleton(as: PokemonCustomDatasource)
class PokemonCustomDatasourceImpl extends PokemonCustomDatasource {
  PokemonCustomDatasourceImpl();

  @override
  Future<List<PokemonCustomModel>> getPokemons() async {
    final db = database;

    try {
      final List<Map<String, dynamic>> pokemonsMap = await db.query('pokemons');

      var pokemons = <PokemonCustomModel>[];

      for (var pokemon in pokemonsMap) {
        var pokemonModel = PokemonCustomModel.fromMap(pokemon);

        pokemonModel.color = await AppUtils.getDominantColorFromImage(url: pokemonModel.imagePath, isLocal: true);

        pokemons.add(pokemonModel);
      }

      return pokemons;
    } catch (e) {
      logger('Error -> $e');
      throw DefaultException('$e');
    }
  }
}
