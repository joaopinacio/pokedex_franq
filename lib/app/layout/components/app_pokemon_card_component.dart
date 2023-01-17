import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';
import 'app_network_image_component.dart';

class AppPokemonCardComponent extends StatelessWidget {
  final String url;
  final String name;
  final String id;
  final Color backgroundColor;
  final double? imageSize;

  const AppPokemonCardComponent({
    super.key,
    required this.url,
    required this.name,
    required this.id,
    required this.backgroundColor,
    this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: id,
            child: AppNetworkImageComponent(
              width: imageSize ?? 120,
              height: imageSize ?? 120,
              url: url,
            ),
          ),
          const SizedBox(height: 20),
          AppTextStyles.bodyStrong(context: context, text: name),
          AppTextStyles.body(context: context, text: id),
        ],
      ),
    );
  }
}
