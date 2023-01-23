import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/feature/default/presenter/pages/default_page.dart';
import 'package:pokedex_franq/app/feature/home/presenter/pages/home_page.dart';
import 'package:pokedex_franq/app/feature/splash/presenter/pages/splash_page.dart';

import '../../feature/pokemon_add/presenter/pages/pokemon_add_page.dart';
import '../../feature/pokemon_detail/presenter/pages/pokemon_detail_page.dart';

class AppModule extends Module {
  static const defaultP = '/default_page';
  static const splash = '/splash';
  static const home = '/home';
  static const pokemonDetail = '/pokemon_detail';
  static const pokemonAdd = '/pokemon_add';

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

  ChildRoute get pokemonDetailPage => ChildRoute(
        pokemonDetail,
        child: (context, args) => const PokemonDetailPage(),
      );

  ChildRoute get pokemonAddPage => ChildRoute(
        pokemonAdd,
        child: (context, args) => const PokemonAddPage(),
      );

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        defaultPage,
        splashPage,
        homePage,
        pokemonDetailPage,
        pokemonAddPage,
      ];
}
