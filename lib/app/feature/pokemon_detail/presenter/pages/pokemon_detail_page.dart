import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/core/utils/app_extensions.dart';
import 'package:pokedex_franq/app/layout/themes/app_themes.dart';

import '../../../../layout/components/app_network_image_component.dart';
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 25),
                      GestureDetector(
                        onTap: () => Modular.to.pop(),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                          color: AppThemes.colors.black,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            AppTextStyles.h1(
                              context: context,
                              text: state!.name,
                            ),
                            AppTextStyles.bodyStrong(
                              context: context,
                              text: state.id.toString().putLeft,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: state.color,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(60),
                        child: AppNetworkImageComponent(
                          // boxFit: BoxFit.cover,
                          url: state.urlImage,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppThemes.colors.primaryColor,
                    labelPadding: const EdgeInsets.only(bottom: 6),
                    tabs: [
                      AppTextStyles.bodyStrong(
                        context: context,
                        text: 'Tipos',
                      ),
                      AppTextStyles.bodyStrong(
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
