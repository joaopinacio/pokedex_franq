import 'package:pokedex_franq/app/core/bloc/bloc_cubit.dart';
import 'package:pokedex_franq/app/feature/home/domain/usecase/pokemon_list_usecase.dart';
import 'package:pokedex_franq/app/feature/home/presenter/bloc/pokemon_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

  final RefreshController refreshController = RefreshController(initialRefresh: false);
  var offsetPage = 0;

  void init() async {
    getPokemons();
  }

  Future<void> getPokemons() async {
    emit(LoadingState());

    final result = await _pokemonListUsecase(offset: offsetPage);

    if (result.isLeft()) {
      emit(FailureState());
    } else {
      await _pokemonBloc.getPokemon(pokeList: result.getRight().toNullable()!);
      emit(SuccessState(true));
    }
  }

  void loadMore() async {
    offsetPage += 20;
    await getPokemons();
    refreshController.loadComplete();
  }
}
