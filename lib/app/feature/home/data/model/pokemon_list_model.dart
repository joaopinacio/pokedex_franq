import 'dart:convert';

import '../../domain/entity/pokemon_list_entity.dart';

class PokemonListModel extends PokemonListEntity {
  PokemonListModel({
    required super.name,
    required super.url,
  });

  static PokemonListModel init() {
    return PokemonListModel(
      name: '',
      url: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonListModel.fromMap(Map<String, dynamic> map) {
    return PokemonListModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonListModel.fromJson(String source) =>
      PokemonListModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
