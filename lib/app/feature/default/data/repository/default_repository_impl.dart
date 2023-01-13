import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/feature/default/data/datasource/default_datasource.dart';
import 'package:pokedex_franq/app/feature/default/data/model/default_model.dart';
import 'package:pokedex_franq/app/feature/default/domain/entity/user_entity.dart';

import '../../../../core/error/default_errors.dart';
import '../../../../core/error/default_exceptions.dart';
import '../../domain/repository/default_repository.dart';

@LazySingleton(as: DefaultRepository)
class DefaultRepositoryImpl extends DefaultRepository {
  final DefaultDatasource _datasource;

  DefaultRepositoryImpl({required DefaultDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, DefaultEntity>> defaultCall() async {
    try {
      final DefaultModel defaultModel = await _datasource.defaultCall();

      return Right(defaultModel);
    } on DefaultException {
      return Left(DefaultError());
    }
  }
}
