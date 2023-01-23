import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/core/routes/app_module.dart';

class SplashBloc extends Cubit<bool> {
  SplashBloc() : super(false) {
    init();
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.popAndPushNamed(AppModule.home);
  }
}
