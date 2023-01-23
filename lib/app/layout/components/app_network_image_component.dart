import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_franq/app/layout/styles/app_text_styles.dart';
import 'package:pokedex_franq/app/layout/themes/app_themes.dart';

class AppNetworkImageComponent extends StatelessWidget {
  final String url;
  final bool isSvg;
  final BoxFit? boxFit;
  final double? width;
  final double? height;

  const AppNetworkImageComponent({
    super.key,
    required this.url,
    this.boxFit,
    this.width,
    this.height,
    this.isSvg = false,
  });

  @override
  Widget build(BuildContext context) {
    return isSvg
        ? SvgPicture.network(
            url,
            colorBlendMode: BlendMode.multiply,
            fit: boxFit ?? BoxFit.cover,
            height: height ?? 50,
            width: width ?? 50,
            placeholderBuilder: (context) => Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppThemes.colors.primaryColor),
              ),
            ),
          )
        : CachedNetworkImage(
            imageUrl: url,
            colorBlendMode: BlendMode.multiply,
            fit: boxFit ?? BoxFit.cover,
            height: height ?? 50,
            width: width ?? 50,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppThemes.colors.primaryColor),
              ),
            ),
            errorWidget: (context, url, error) => AppTextStyles.body(
              context: context,
              text: 'Erro ao carregar imagem',
            ),
          );
  }
}
