import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/core/routes/app_module.dart';
import 'package:pokedex_franq/app/core/utils/app_extensions.dart';
import 'package:pokedex_franq/app/feature/home/presenter/bloc/home_bloc.dart';
import 'package:pokedex_franq/app/layout/components/app_pokemon_card_component.dart';
import 'package:pokedex_franq/app/layout/styles/app_text_styles.dart';
import 'package:pokedex_franq/app/layout/styles/poke_app_bar_styles.dart';
import 'package:pokedex_franq/app/layout/themes/app_themes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/injectable/injectable.dart';
import '../../domain/entity/pokemon_entity.dart';
import '../bloc/pokemon_bloc.dart';

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
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(getIt.get(), BlocProvider.of(context)),
            lazy: false,
          ),
        ],
        // create: (BuildContext context) => HomeBloc(getIt.get()),
        // lazy: false,
        child: Scaffold(
          appBar: PokeAppBarStyles.onlyText(
            context: context,
            text: 'Pokédex',
            backgroundColor: AppThemes.colors.scaffoldBackground,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                AppTextStyles.body(
                  context: context,
                  color: AppThemes.colors.primaryColor_60,
                  text: 'Procure por um Pokemon e toque para ver seus detalhes',
                ),
                // const SizedBox(height: 20),
                // AppTextStyles.body(
                //   context: context,
                //   color: AppThemes.colors.primaryColor_60,
                //   text: 'CAMPO DE BUSCA AQ',
                // ),
                const SizedBox(height: 25),
                BlocBuilder<PokemonBloc, List<PokemonEntity>>(
                  builder: (context, state) {
                    if (state.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 250),
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(AppThemes.colors.primaryColor),
                          ),
                        ),
                      );
                    }

                    return Expanded(
                      child: SmartRefresher(
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
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
