import 'package:flutter/material.dart';

import 'app_text_styles.dart';

class PokeAppBarStyles {
  PokeAppBarStyles._();

  static AppBar onlyText({
    required BuildContext context,
    required String text,
  }) =>
      AppBar(
        titleSpacing: 20,
        title: AppTextStyles.h1(
          context: context,
          text: text,
        ),
      );
}