import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex_franq/app/core/utils/app_extensions.dart';

import '../../domain/entity/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required super.id,
    required super.name,
    required super.urlImage,
    required super.types,
    required super.moves,
    required super.color,
  });

  static PokemonModel init() {
    return PokemonModel(
      id: 0,
      name: '',
      urlImage: '',
      types: [],
      moves: [],
      color: Colors.transparent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'urlImage': urlImage,
      'types': types,
      'moves': moves,
      'color': color,
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
      name: (map['name'] as String).capitalize,
      urlImage: map['sprites']['other']['official-artwork']['front_default'] as String,
      types: typesList,
      moves: movesList,
      color: Colors.transparent,
    );
  }

  String toJson() => json.encode(toMap());
}
