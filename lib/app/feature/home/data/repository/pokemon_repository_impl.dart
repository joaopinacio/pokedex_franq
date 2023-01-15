import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/feature/home/domain/entity/pokemon_entity.dart';

import '../../../../core/error/default_errors.dart';
import '../../../../core/error/default_exceptions.dart';
import '../../domain/entity/pokemon_list_entity.dart';
import '../../domain/repository/pokemon_repository.dart';
import '../datasource/pokemon_datasource.dart';
import '../model/pokemon_list_model.dart';

@LazySingleton(as: PokemonRepository)
class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDatasource _datasource;

  PokemonRepositoryImpl({required PokemonDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, List<PokemonListEntity>>> call() async {
    try {
      final List<PokemonListModel> pokemonListModel = await _datasource.getPokemons();

      return Right(pokemonListModel);
    } on DefaultException {
      return Left(DefaultError());
    }
  }

  @override
  Future<Either<Failure, PokemonEntity>> getPokemonByUrl({required String url}) async {
    try {
      final PokemonEntity pokemonModel = await _datasource.getPokemonByUrl(url: url);

      return Right(pokemonModel);
    } on DefaultException {
      return Left(DefaultError());
    }
  }
}
