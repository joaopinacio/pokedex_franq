import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/domain/entity/pokemon_custom_entity.dart';

import '../../../../core/error/default_errors.dart';
import '../repository/pokemon_custom_repository.dart';

abstract class PokemonCustomUsecase {
  Future<Either<Failure, List<PokemonCustomEntity>>> call();
}

@LazySingleton(as: PokemonCustomUsecase)
class PokemonCustomUsecaseImpl extends PokemonCustomUsecase {
  final PokemonCustomRepository _repository;

  PokemonCustomUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<PokemonCustomEntity>>> call() async {
    return await _repository();
  }
}
