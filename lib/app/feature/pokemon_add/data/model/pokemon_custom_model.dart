import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex_franq/app/core/utils/app_extensions.dart';

import '../../domain/entity/pokemon_custom_entity.dart';

class PokemonCustomModel extends PokemonCustomEntity {
  PokemonCustomModel({
    required super.id,
    required super.name,
    required super.imagePath,
    required super.type,
    required super.firstMove,
    required super.secondMove,
    required super.thirdMove,
    required super.color,
  });

  static PokemonCustomModel init() {
    return PokemonCustomModel(
      id: 0,
      name: '',
      imagePath: '',
      type: '',
      firstMove: '',
      secondMove: '',
      thirdMove: '',
      color: Colors.transparent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image_path': imagePath,
      'type': type,
      'move_1': firstMove,
      'move_2': secondMove,
      'move_3': thirdMove,
    };
  }

  factory PokemonCustomModel.fromMap(Map<String, dynamic> map) {
    return PokemonCustomModel(
      id: map['id'] as int,
      name: (map['name'] as String).capitalize,
      imagePath: map['image_path'] as String,
      type: map['type'] as String,
      firstMove: map['move_1'] as String,
      secondMove: map['move_2'] as String,
      thirdMove: map['move_3'] as String,
      color: Colors.transparent,
    );
  }

  String toJson() => json.encode(toMap());
}
