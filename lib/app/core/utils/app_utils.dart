import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class AppUtils {
  AppUtils._();

  static Future<Color> getDominantColorFromImage({required String url, bool isLocal = false}) async {
    PaletteGenerator paletteGenerator;
    if (isLocal) {
      paletteGenerator = await PaletteGenerator.fromImageProvider(FileImage(File(url)));
    } else {
      paletteGenerator = await PaletteGenerator.fromImageProvider(CachedNetworkImageProvider(url));
    }
    return paletteGenerator.dominantColor!.color.withOpacity(0.6);
  }
}
