import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_franq/app/core/bloc/bloc_state.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/presenter/bloc/pokemon_add_bloc.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/presenter/bloc/pokemon_add_pick_image_bloc.dart';
import 'package:pokedex_franq/app/layout/components/app_bottom_button_component.dart';
import 'package:pokedex_franq/app/layout/styles/app_text_styles.dart';
import 'package:pokedex_franq/app/layout/styles/poke_app_bar_styles.dart';
import 'package:pokedex_franq/app/layout/themes/app_themes.dart';

import '../../../../core/injectable/injectable.dart';

class PokemonAddPage extends StatelessWidget {
  const PokemonAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonAddPickImageBloc>(
          create: (BuildContext context) => PokemonAddPickImageBloc(),
          lazy: false,
        ),
        BlocProvider<PokemonAddBloc>(
          create: (BuildContext context) => PokemonAddBloc(getIt.get(), BlocProvider.of(context)),
          lazy: false,
        ),
      ],
      child: Scaffold(
        body: Scaffold(
          appBar: PokeAppBarStyles.textWithBack(
            context: context,
            text: 'Adicionar',
          ),
          bottomNavigationBar: BlocBuilder<PokemonAddBloc, BlocState>(
            builder: (context, state) => AppBottomButtonComponent(
              title: 'Salvar',
              onTap: () => BlocProvider.of<PokemonAddBloc>(context).insertPokemon(context),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                BlocBuilder<PokemonAddPickImageBloc, String>(
                  builder: (context, state) => InkWell(
                    onTap: BlocProvider.of<PokemonAddPickImageBloc>(context).pickImage,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppThemes.colors.backgroundAddImage,
                        ),
                        child: state != ''
                            ? Image.file(File(state))
                            : Padding(
                                padding: const EdgeInsets.all(60),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppTextStyles.bodyStrong(
                                      context: context,
                                      text: 'Selecione uma imagem',
                                      textAlign: TextAlign.center,
                                      color: AppThemes.colors.white,
                                    ),
                                    const SizedBox(height: 10),
                                    Icon(
                                      Icons.add_rounded,
                                      size: 25,
                                      color: AppThemes.colors.white,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: BlocBuilder<PokemonAddBloc, BlocState>(
                    builder: (context, state) => Column(
                      children: [
                        TextFormField(
                          controller: BlocProvider.of<PokemonAddBloc>(context).nameController,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                          ),
                        ),
                        TextFormField(
                          controller: BlocProvider.of<PokemonAddBloc>(context).typeController,
                          decoration: const InputDecoration(
                            labelText: 'Tipo',
                          ),
                        ),
                        TextFormField(
                          controller: BlocProvider.of<PokemonAddBloc>(context).firstMoveController,
                          decoration: const InputDecoration(
                            labelText: 'Habilidade 1',
                          ),
                        ),
                        TextFormField(
                          controller: BlocProvider.of<PokemonAddBloc>(context).secondMoveController,
                          decoration: const InputDecoration(
                            labelText: 'Habilidade 2',
                          ),
                        ),
                        TextFormField(
                          controller: BlocProvider.of<PokemonAddBloc>(context).thirdMoveController,
                          decoration: const InputDecoration(
                            labelText: 'Habilidade 3',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
