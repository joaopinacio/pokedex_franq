import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/feature/home/domain/entity/pokemon_entity.dart';

class PokemonDetailBloc extends Cubit<PokemonEntity?> {
  PokemonDetailBloc() : super(null) {
    init();
  }

  void init() async {
    final pokemon = Modular.args.data as PokemonEntity;
    emit(pokemon);
  }
}
