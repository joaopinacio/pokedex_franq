import 'package:flutter/material.dart';
import 'package:pokedex_franq/app/layout/components/app_pokemon_card_component.dart';
import 'package:pokedex_franq/app/layout/styles/app_text_styles.dart';
import 'package:pokedex_franq/app/layout/styles/poke_app_bar_styles.dart';
import 'package:pokedex_franq/app/layout/themes/app_themes.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/bloc/bloc_state.dart';
// import '../../../../core/injectable/injectable.dart';
// import '../../domain/entity/user_entity.dart';
// import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PokeAppBarStyles.onlyText(
        context: context,
        text: 'Pokédex',
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
              text: 'Procure por um Pokemon pelo seu nome ou usando seu ID',
            ),
            const SizedBox(height: 20),
            AppTextStyles.body(
              context: context,
              color: AppThemes.colors.primaryColor_60,
              text: 'CAMPO DE BUSCA AQ',
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 9 / 12,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 6,
                itemBuilder: (builderContext, _) {
                  return const AppPokemonCardComponent();
                },
              ),
            ),
          ],
        ),
      ),
    );
    // return BlocProvider(
    //   create: (BuildContext context) => DefaultBloc(defaultUsecase: getIt.get()),
    //   child: Scaffold(
    //     backgroundColor: Colors.white,
    //     body: BlocBuilder<DefaultBloc, BlocState>(
    //       builder: (context, state) {
    //         if (state is LoadingState) {
    //           return const Center(
    //             child: Text(
    //               "Loading...",
    //               style: TextStyle(color: Colors.black),
    //             ),
    //           );
    //         }
    //         if (state is SuccessState<DefaultEntity>) {
    //           return Center(
    //               child: Text("Success: ${state.response.name}", style: const TextStyle(color: Colors.black)));
    //         }
    //         return Container();
    //       },
    //     ),
    //   ),
    // );
  }
}