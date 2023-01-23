import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_franq/app/feature/home/domain/usecase/pokemon_custom_usecase.dart';
import 'package:pokedex_franq/app/feature/pokemon_add/domain/entity/pokemon_custom_entity.dart';

class PokemonCustomBloc extends Cubit<List<PokemonCustomEntity>> {
  final PokemonCustomUsecase _pokemonCustomUsecase;

  PokemonCustomBloc(this._pokemonCustomUsecase) : super([]) {
    init();
  }

  void init() {
    getPokemonsCustom();
  }

  void getPokemonsCustom() {
    _pokemonCustomUsecase().then(
      (value) => value.fold(
        (l) => emit([]),
        (r) => emit(r),
      ),
    );
  }
}
