import 'package:flutter/material.dart';

import 'app_text_styles.dart';

class PokeAppBarStyles {
  PokeAppBarStyles._();

  static AppBar onlyText({
    required BuildContext context,
    required String text,
    Color? backgroundColor,
    Widget? trailing,
  }) =>
      AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        titleSpacing: 20,
        title: AppTextStyles.h1(
          context: context,
          text: text,
        ),
        automaticallyImplyLeading: false,
        actions: trailing != null ? [trailing, const SizedBox(width: 8)] : null,
      );
}
