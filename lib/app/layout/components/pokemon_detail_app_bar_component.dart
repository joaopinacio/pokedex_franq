import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../styles/app_text_styles.dart';
import '../themes/app_themes.dart';

class PokemonDetailAppBar extends StatelessWidget {
  final String name;
  final String id;

  const PokemonDetailAppBar({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 25),
        GestureDetector(
          onTap: () => Modular.to.pop(),
          child: Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: AppThemes.colors.black,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              AppTextStyles.h1(
                context: context,
                text: name,
              ),
              AppTextStyles.headlineStrong(
                context: context,
                text: id,
              ),
            ],
          ),
        ),
        const SizedBox(width: 50),
      ],
    );
  }
}
