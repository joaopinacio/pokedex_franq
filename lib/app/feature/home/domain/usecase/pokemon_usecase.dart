import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/core/error/default_errors.dart';
import 'package:pokedex_franq/app/feature/home/domain/entity/pokemon_entity.dart';

import '../repository/pokemon_repository.dart';

abstract class PokemonUsecase {
  Future<Either<Failure, PokemonEntity>> getPokemonByUrl({required String url});
}

@LazySingleton(as: PokemonUsecase)
class PokemonUsecaseImpl extends PokemonUsecase {
  final PokemonRepository _repository;

  PokemonUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, PokemonEntity>> getPokemonByUrl({required String url}) async {
    return await _repository.getPokemonByUrl(url: url);
  }
}
