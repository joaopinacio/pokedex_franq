import 'package:fpdart/fpdart.dart';

import '../../../../core/error/default_errors.dart';
import '../../../pokemon_add/domain/entity/pokemon_custom_entity.dart';

abstract class PokemonCustomRepository {
  Future<Either<Failure, List<PokemonCustomEntity>>> call();
}
