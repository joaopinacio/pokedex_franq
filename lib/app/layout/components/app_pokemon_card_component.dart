import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex_franq/app/core/utils/app_extensions.dart';

import '../styles/app_text_styles.dart';
import 'app_network_image_component.dart';

class AppPokemonCardComponent extends StatelessWidget {
  final String url;
  final String name;
  final String id;
  final String type;
  final Color backgroundColor;
  final double? imageSize;
  final bool isLocal;

  const AppPokemonCardComponent({
    super.key,
    required this.url,
    required this.name,
    required this.id,
    required this.type,
    required this.backgroundColor,
    this.imageSize,
    this.isLocal = false,
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
            child: isLocal
                ? Image.file(
                    File(url),
                    width: imageSize ?? 120,
                    height: imageSize ?? 120,
                  )
                : AppNetworkImageComponent(
                    width: imageSize ?? 120,
                    height: imageSize ?? 120,
                    url: url,
                  ),
          ),
          const SizedBox(height: 20),
          AppTextStyles.headlineStrong(context: context, text: name),
          AppTextStyles.bodyStrong(context: context, text: type.capitalize),
          AppTextStyles.body(context: context, text: id),
        ],
      ),
    );
  }
}
