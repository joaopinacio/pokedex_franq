import 'dart:ui';

abstract class PokemonEntity {
  int id;
  String name;
  String urlImage;
  List<String> types;
  List<String> moves;
  Color color;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.urlImage,
    required this.types,
    required this.moves,
    required this.color,
  });
}
