import 'package:fpdart/fpdart.dart';
import 'package:pokedex_franq/app/feature/home/domain/entity/pokemon_entity.dart';

import '../../../../core/error/default_errors.dart';
import '../entity/pokemon_list_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonListEntity>>> call();
  Future<Either<Failure, PokemonEntity>> getPokemonByUrl({required String url});
}
