import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/core/error/default_errors.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/data/model/pokemon_custom_model.dart';

import '../repository/pokemon_custom_repository.dart';

abstract class PokemonCustomAddUsecase {
  Future<Either<Failure, bool>> call({required PokemonCustomModel pokemon});
}

@LazySingleton(as: PokemonCustomAddUsecase)
class PokemonCustomAddUsecaseImpl extends PokemonCustomAddUsecase {
  final PokemonCustomAddRepository _repository;

  PokemonCustomAddUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, bool>> call({required PokemonCustomModel pokemon}) async {
    if (pokemon.name == '' ||
        pokemon.imagePath == '' ||
        pokemon.type == '' ||
        pokemon.firstMove == '' ||
        pokemon.secondMove == '' ||
        pokemon.thirdMove == '') {
      return Left(RequiredInputError());
    }

    return await _repository(pokemon: pokemon);
  }
}
