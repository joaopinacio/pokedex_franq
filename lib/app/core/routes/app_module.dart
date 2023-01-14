import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/feature/default/presenter/pages/default_page.dart';
import 'package:pokedex_franq/app/feature/splash/presenter/pages/splash_page.dart';

class AppModule extends Module {
  static const splash = '/splash';
  static const defaultP = '/default_page';

  ChildRoute get splashPage => ChildRoute(
        splash,
        child: (context, args) => const SplashPage(),
      );

  ChildRoute get defaultPage => ChildRoute(
        defaultP,
        child: (context, args) => const DefaultPage(),
      );

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        splashPage,
        defaultPage,
      ];
}
