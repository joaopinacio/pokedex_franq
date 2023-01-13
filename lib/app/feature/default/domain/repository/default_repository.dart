import 'package:fpdart/fpdart.dart';
import 'package:pokedex_franq/app/feature/default/domain/entity/user_entity.dart';

import '../../../../core/error/default_errors.dart';

abstract class DefaultRepository {
  Future<Either<Failure, DefaultEntity>> defaultCall();
}
