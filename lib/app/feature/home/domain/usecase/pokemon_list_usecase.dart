import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/core/error/default_errors.dart';
import 'package:pokedex_franq/app/feature/home/domain/entity/pokemon_list_entity.dart';

import '../repository/pokemon_repository.dart';

abstract class PokemonListUsecase {
  Future<Either<Failure, List<PokemonListEntity>>> call();
}

@LazySingleton(as: PokemonListUsecase)
class PokemonListUsecaseImpl extends PokemonListUsecase {
  final PokemonRepository _repository;

  PokemonListUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<PokemonListEntity>>> call() async {
    return await _repository();
  }
}
