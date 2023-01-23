import 'dart:ui';

abstract class PokemonCustomEntity {
  int id;
  String name;
  String imagePath;
  String type;
  String firstMove;
  String secondMove;
  String thirdMove;
  Color color;

  PokemonCustomEntity({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.type,
    required this.firstMove,
    required this.secondMove,
    required this.thirdMove,
    required this.color,
  });
}
