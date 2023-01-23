import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/data/model/pokemon_custom_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/error/default_exceptions.dart';
import '../../../../core/sqflite/sqflite.dart';
import '../../../../core/utils/logger.dart';

abstract class PokemonCustomAddDatasource {
  Future<bool> insert({required PokemonCustomModel pokemon});
}

@LazySingleton(as: PokemonCustomAddDatasource)
class PokemonCustomAddDatasourceImpl extends PokemonCustomAddDatasource {
  @override
  Future<bool> insert({required PokemonCustomModel pokemon}) async {
    final db = database;

    try {
      final result = await db.insert(
        'pokemons',
        pokemon.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      if (result == 0) {
        throw SqlfliteException();
      }

      return true;
    } catch (e) {
      logger('Error -> $e');
      throw DefaultException('$e');
    }
  }
}
