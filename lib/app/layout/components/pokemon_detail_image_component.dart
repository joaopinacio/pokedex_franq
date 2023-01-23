import 'package:flutter/material.dart';
import 'package:pokedex_franq/app/core/utils/app_extensions.dart';

import 'app_network_image_component.dart';

class PokemonDetailImage extends StatelessWidget {
  final Color color;
  final String id;
  final String urlImage;

  const PokemonDetailImage({
    Key? key,
    required this.color,
    required this.id,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Hero(
            tag: id.toString().putLeft,
            child: AppNetworkImageComponent(
              url: urlImage,
            ),
          ),
        ),
      ),
    );
  }
}
