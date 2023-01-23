import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/core/error/default_errors.dart';

import 'package:pokedex_franq/app/core/error/default_exceptions.dart';

import '../../domain/repository/pokemon_custom_repository.dart';
import '../datasource/pokemon_custom_add_datasource.dart';
import '../model/pokemon_custom_model.dart';

@LazySingleton(as: PokemonCustomAddRepository)
class PokemonCustomAddRepositoryImpl extends PokemonCustomAddRepository {
  final PokemonCustomAddDatasource _datasource;

  PokemonCustomAddRepositoryImpl({required PokemonCustomAddDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, bool>> call({required PokemonCustomModel pokemon}) async {
    try {
      final bool result = await _datasource.insert(pokemon: pokemon);

      return Right(result);
    } on SqlfliteException {
      return Left(SqfliteError());
    } on DefaultException {
      return Left(DefaultError());
    }
  }
}
