import 'package:injectable/injectable.dart';
import 'package:pokedex_franq/app/feature/default/data/model/default_model.dart';

import '../../../../core/error/default_exceptions.dart';

abstract class DefaultDatasource {
  Future<DefaultModel> defaultCall();
}

@LazySingleton(as: DefaultDatasource)
class DefaultDatasourceImpl extends DefaultDatasource {
  @override
  Future<DefaultModel> defaultCall() async {
    try {
      // Call Firebase or Something here
      return DefaultModel.init();
    } catch (e) {
      throw DefaultException('$e');
    }
  }
}
