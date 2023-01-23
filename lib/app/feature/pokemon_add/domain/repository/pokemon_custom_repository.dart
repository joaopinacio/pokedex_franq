import 'package:fpdart/fpdart.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/data/model/pokemon_custom_model.dart';

import '../../../../core/error/default_errors.dart';

abstract class PokemonCustomAddRepository {
  Future<Either<Failure, bool>> call({required PokemonCustomModel pokemon});
}
