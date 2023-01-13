import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/core/error/default_errors.dart';
import 'package:pokedex_franq/app/feature/default/domain/entity/user_entity.dart';
import 'package:pokedex_franq/app/feature/default/domain/repository/default_repository.dart';

abstract class DefaultUsecase {
  Future<Either<Failure, DefaultEntity>> call();
}

@LazySingleton(as: DefaultUsecase)
class DefaultUsecaseImpl extends DefaultUsecase {
  final DefaultRepository _repository;

  DefaultUsecaseImpl({required DefaultRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, DefaultEntity>> call() async {
    return await _repository.defaultCall();
  }
}
