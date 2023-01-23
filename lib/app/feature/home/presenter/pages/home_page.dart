import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/core/routes/app_module.dart';
import 'package:pokedex_franq/app/core/theme/theme_bloc.dart';
import 'package:pokedex_franq/app/core/utils/app_extensions.dart';
import 'package:pokedex_franq/app/feature/home/presenter/bloc/home_bloc.dart';
import 'package:pokedex_franq/app/layout/components/app_pokemon_card_component.dart';
import 'package:pokedex_franq/app/layout/styles/app_text_styles.dart';
import 'package:pokedex_franq/app/layout/styles/poke_app_bar_styles.dart';
import 'package:pokedex_franq/app/layout/themes/app_themes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/injectable/injectable.dart';
import '../../../pokemon_add/domain/entity/pokemon_custom_entity.dart';
import '../../domain/entity/pokemon_entity.dart';
import '../bloc/pokemon_bloc.dart';
import '../bloc/pokemon_custom_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonBloc>(
            create: (BuildContext context) => PokemonBloc(getIt.get()),
            lazy: false,
          ),
          BlocProvider<PokemonCustomBloc>(
            create: (BuildContext context) => PokemonCustomBloc(getIt.get()),
            lazy: false,
          ),
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(getIt.get(), BlocProvider.of(context)),
            lazy: false,
          ),
        ],
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PokeAppBarStyles.onlyText(
              context: context,
              text: 'Pokédex',
              trailing: Switch(
                value: BlocProvider.of<ThemeBloc>(context).state.isDark,
                onChanged: BlocProvider.of<ThemeBloc>(context).fromSwitch,
              ),
            ),
            floatingActionButton: BlocBuilder<PokemonCustomBloc, List<PokemonCustomEntity>>(
              builder: (context, state) => FloatingActionButton(
                onPressed: () async {
                  final bloc = BlocProvider.of<PokemonCustomBloc>(context);
                  final result = await Modular.to.pushNamed(AppModule.pokemonAdd) as bool;

                  if (result) bloc.getPokemonsCustom();
                },
                child: const Icon(Icons.add_rounded, size: 30),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  AppTextStyles.body(
                    context: context,
                    color: BlocProvider.of<ThemeBloc>(context).state.isLight
                        ? AppThemes.colors.primaryColor_60
                        : AppThemes.colors.white,
                    text: 'Procure por um Pokemon e toque para ver seus detalhes',
                  ),
                  const SizedBox(height: 20),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppThemes.colors.primaryColor,
                    labelPadding: const EdgeInsets.only(bottom: 6),
                    tabs: [
                      AppTextStyles.headlineStrong(
                        context: context,
                        text: 'Originais',
                      ),
                      AppTextStyles.headlineStrong(
                        context: context,
                        text: 'Customizados',
                      ),
                    ],
                  ),
                  // const SizedBox(height: 20),
                  // AppTextStyles.body(
                  //   context: context,
                  //   color: AppThemes.colors.primaryColor_60,
                  //   text: 'CAMPO DE BUSCA AQ',
                  // ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: TabBarView(
                      children: [
                        BlocBuilder<PokemonBloc, List<PokemonEntity>>(
                          builder: (context, state) {
                            if (state.isEmpty) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 150),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).iconTheme.color!),
                                  ),
                                ),
                              );
                            }

                            return SmartRefresher(
                              enablePullDown: false,
                              enablePullUp: true,
                              onLoading: BlocProvider.of<HomeBloc>(context).loadMore,
                              controller: BlocProvider.of<HomeBloc>(context).refreshController,
                              child: GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 9 / 12,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                ),
                                itemCount: state.length,
                                itemBuilder: (builderContext, index) {
                                  final pokemon = state[index];
                                  return GestureDetector(
                                    onTap: () => Modular.to.pushNamed(AppModule.pokemonDetail, arguments: pokemon),
                                    child: AppPokemonCardComponent(
                                      id: pokemon.id.toString().putLeft,
                                      name: pokemon.name,
                                      url: pokemon.urlImage,
                                      backgroundColor: pokemon.color,
                                      type: pokemon.types[0],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        BlocBuilder<PokemonCustomBloc, List<PokemonCustomEntity>>(
                          builder: (context, state) => GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 9 / 12,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: state.length,
                            itemBuilder: (builderContext, index) {
                              final pokemon = state[index];
                              return GestureDetector(
                                onTap: () {},
                                child: AppPokemonCardComponent(
                                  id: pokemon.id.toString().putLeft,
                                  name: pokemon.name,
                                  url: pokemon.imagePath,
                                  backgroundColor: pokemon.color,
                                  type: pokemon.type,
                                  isLocal: true,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
