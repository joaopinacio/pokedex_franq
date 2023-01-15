import 'dart:convert';

import '../../domain/entity/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required super.id,
    required super.name,
    required super.urlImage,
    required super.types,
    required super.moves,
  });

  static PokemonModel init() {
    return PokemonModel(
      id: 0,
      name: '',
      urlImage: '',
      types: [],
      moves: [],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'urlImage': urlImage,
      'types': types,
      'moves': moves,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    var movesList = <String>[];
    var typesList = <String>[];

    if (map['moves'] != null) {
      var list = map['moves'] as List;
      movesList = list.map((e) => e['move']['name'] as String).toList();
    }

    if (map['types'] != null) {
      var list = map['types'] as List;
      typesList = list.map((e) => e['type']['name'] as String).toList();
    }

    return PokemonModel(
      id: map['id'] as int,
      name: map['name'] as String,
      urlImage: map['sprites']['other']['official-artwork']['front_default'] as String,
      types: typesList,
      moves: movesList,
    );
  }

  String toJson() => json.encode(toMap());
}
