import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/core/utils/app_extensions.dart';
import 'package:pokedex_franq/app/layout/themes/app_themes.dart';

import '../../../../layout/components/app_network_image_component.dart';
import '../../../../layout/components/pokemon_detail_app_bar_component.dart';
import '../../../../layout/components/pokemon_detail_image_component.dart';
import '../../../../layout/styles/app_text_styles.dart';
import '../../../home/domain/entity/pokemon_entity.dart';
import '../bloc/pokemon_detail_bloc.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: BlocProvider(
          create: (BuildContext context) => PokemonDetailBloc(),
          lazy: false,
          child: BlocBuilder<PokemonDetailBloc, PokemonEntity?>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  PokemonDetailAppBar(
                    name: state!.name,
                    id: state.id.toString().putLeft,
                  ),
                  const SizedBox(height: 20),
                  PokemonDetailImage(
                    color: state.color,
                    id: state.id.toString(),
                    urlImage: state.urlImage,
                  ),
                  const SizedBox(height: 25),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppThemes.colors.primaryColor,
                    labelPadding: const EdgeInsets.only(bottom: 6),
                    tabs: [
                      AppTextStyles.headlineStrong(
                        context: context,
                        text: 'Tipos',
                      ),
                      AppTextStyles.headlineStrong(
                        context: context,
                        text: 'Habilidades',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 6 / 2,
                            ),
                            itemCount: state.types.length,
                            itemBuilder: (context, index) {
                              var type = state.types[index];
                              return Container(
                                decoration: BoxDecoration(color: state.color, borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: AppTextStyles.body(
                                    context: context,
                                    text: type.capitalize,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 6 / 2,
                            ),
                            itemCount: state.moves.length,
                            itemBuilder: (context, index) {
                              var move = state.moves[index];
                              return Container(
                                decoration: BoxDecoration(color: state.color, borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: AppTextStyles.body(
                                    context: context,
                                    text: move.capitalize,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
