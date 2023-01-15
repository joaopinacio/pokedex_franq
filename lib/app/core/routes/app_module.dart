import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/feature/default/presenter/pages/default_page.dart';
import 'package:pokedex_franq/app/feature/home/presenter/pages/home_page.dart';
import 'package:pokedex_franq/app/feature/splash/presenter/pages/splash_page.dart';

class AppModule extends Module {
  static const defaultP = '/default_page';
  static const splash = '/splash';
  static const home = '/home';

  ChildRoute get defaultPage => ChildRoute(
        defaultP,
        child: (context, args) => const DefaultPage(),
      );

  ChildRoute get splashPage => ChildRoute(
        splash,
        child: (context, args) => const SplashPage(),
      );

  ChildRoute get homePage => ChildRoute(
        home,
        child: (context, args) => const HomePage(),
      );

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        defaultPage,
        splashPage,
        homePage,
      ];
}
