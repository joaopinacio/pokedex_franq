import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_franq/app/core/injectable/injectable.dart';
import 'package:pokedex_franq/app/core/rest_client/dio_rest_client.dart';
import 'package:pokedex_franq/app/core/rest_client/rest_client.dart';
import 'package:pokedex_franq/app/feature/home/data/datasource/pokemon_datasource.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    HttpOverrides.global = null;
  });

  group('Pokemon Datasource', () {
    getIt.registerLazySingleton<RestClient>(() => DioRequestClient());
    var pokemonDatasource = PokemonDatasourceImpl(getIt.get());

    test('Pokemon list', () async {
      var list = await pokemonDatasource.getPokemons();

      expect(list.length, 20);
      expect(list[0].name, 'bulbasaur');
    });

    test('Pokemon detail', () async {
      var pokemon = await pokemonDatasource.getPokemonByUrl(url: 'https://pokeapi.co/api/v2/pokemon/1');

      expect(pokemon.id, 1);
      expect(pokemon.name, 'Bulbasaur');
      expect(pokemon.types[0], 'grass');
    });
  });
}
