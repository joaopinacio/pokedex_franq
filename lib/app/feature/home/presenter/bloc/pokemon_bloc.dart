import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex_franq/app/feature/home/domain/entity/pokemon_entity.dart';

import '../../domain/entity/pokemon_list_entity.dart';
import '../../domain/usecase/pokemon_usecase.dart';

class PokemonBloc extends Cubit<List<PokemonEntity>> {
  final PokemonUsecase _pokemonUsecase;

  PokemonBloc(this._pokemonUsecase) : super([]);

  Future<void> getPokemon({required List<PokemonListEntity> pokeList}) async {
    var pokemonDetailedList = <PokemonEntity>[];
    for (var pokemon in pokeList) {
      await _pokemonUsecase.getPokemonByUrl(url: pokemon.url).then((value) {
        value.fold(
          (l) => null,
          (r) => pokemonDetailedList.add(r),
        );
      });
    }

    addAll(pokemonDetailedList);
  }

  void addAll(List<PokemonEntity> list) {
    state.addAll(list);

    emit(state);
  }
}
