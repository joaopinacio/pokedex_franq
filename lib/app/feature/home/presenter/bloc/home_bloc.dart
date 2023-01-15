import 'package:pokedex_franq/app/core/bloc/bloc_cubit.dart';
import 'package:pokedex_franq/app/feature/home/domain/usecase/pokemon_list_usecase.dart';
import 'package:pokedex_franq/app/feature/home/presenter/bloc/pokemon_bloc.dart';

import '../../../../core/bloc/bloc_state.dart';

class HomeBloc extends BlocCubit {
  final PokemonListUsecase _pokemonListUsecase;
  final PokemonBloc _pokemonBloc;

  HomeBloc(
    this._pokemonListUsecase,
    this._pokemonBloc,
  ) : super(InitialState()) {
    init();
  }

  void init() async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    getPokemons();
  }

  void getPokemons() async {
    _pokemonListUsecase().then((value) {
      value.fold(
        (l) => emit(FailureState()),
        (r) async {
          await _pokemonBloc.getPokemon(pokeList: r);
          emit(SuccessState(true));
        },
      );
    });
  }
}
