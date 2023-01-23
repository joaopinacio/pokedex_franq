import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/data/model/pokemon_custom_model.dart';

import '../../../../core/error/default_errors.dart';
import '../../../../core/error/default_exceptions.dart';
import '../../../pokemon_add/domain/entity/pokemon_custom_entity.dart';
import '../../domain/repository/pokemon_custom_repository.dart';
import '../datasource/pokemon_custom_datasource.dart';

@LazySingleton(as: PokemonCustomRepository)
class PokemonCustomRepositoryImpl extends PokemonCustomRepository {
  final PokemonCustomDatasource _datasource;

  PokemonCustomRepositoryImpl({required PokemonCustomDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, List<PokemonCustomEntity>>> call() async {
    try {
      final List<PokemonCustomModel> pokemonListModel = await _datasource.getPokemons();

      return Right(pokemonListModel);
    } on DefaultException {
      return Left(DefaultError());
    }
  }
}
