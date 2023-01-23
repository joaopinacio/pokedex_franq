import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/core/error/default_errors.dart';
import 'package:pokedex_franq/app/core/utils/app_loading.dart';
import 'package:pokedex_franq/app/core/utils/logger.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/data/model/pokemon_custom_model.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/domain/usecase/pokemon_custom_add_usecase.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/presenter/bloc/pokemon_add_pick_image_bloc.dart';

import '../../../../core/bloc/bloc_cubit.dart';
import '../../../../core/bloc/bloc_state.dart';

class PokemonAddBloc extends BlocCubit {
  final PokemonCustomAddUsecase _pokemonAddUsecase;
  final PokemonAddPickImageBloc _pokemonImagePickBloc;

  PokemonAddBloc(this._pokemonAddUsecase, this._pokemonImagePickBloc) : super(InitialState());

  var pokemon = PokemonCustomModel.init();
  var nameController = TextEditingController();
  var typeController = TextEditingController();
  var firstMoveController = TextEditingController();
  var secondMoveController = TextEditingController();
  var thirdMoveController = TextEditingController();

  void insertPokemon(BuildContext context) {
    AppLoadingScreen.loading(context);
    emit(LoadingState());

    pokemon.name = nameController.text;
    pokemon.type = typeController.text;
    pokemon.firstMove = firstMoveController.text;
    pokemon.secondMove = secondMoveController.text;
    pokemon.thirdMove = thirdMoveController.text;
    pokemon.imagePath = _pokemonImagePickBloc.state;

    _pokemonAddUsecase(pokemon: pokemon).then(
      (result) => result.fold(
        (l) {
          if (l is RequiredInputError) logger("Error");
          emit(FailureState());
          Modular.to.pop(false);
        },
        (r) {
          emit(SuccessState(true));
          Modular.to.pop();
          Modular.to.pop(true);
        },
      ),
    );
  }
}
