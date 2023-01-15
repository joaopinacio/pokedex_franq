import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';
import 'app_network_image_component.dart';

class AppPokemonCardComponent extends StatelessWidget {
  const AppPokemonCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFc4e3d4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppNetworkImageComponent(
            width: 120,
            height: 120,
            url:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
          ),
          const SizedBox(height: 20),
          AppTextStyles.bodyStrong(context: context, text: 'Bulbasaur'),
          AppTextStyles.body(context: context, text: '001'),
        ],
      ),
    );
  }
}
