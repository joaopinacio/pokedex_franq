import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:palette_generator/palette_generator.dart';

class AppUtils {
  AppUtils._();

  static Future<Color> getDominantColorFromImage(String url) async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(CachedNetworkImageProvider(url));
    return paletteGenerator.dominantColor!.color.withOpacity(0.6);
  }
}
