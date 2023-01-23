import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';

class AppBottomButtonComponent extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Function() onTap;

  const AppBottomButtonComponent({
    super.key,
    required this.title,
    this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: backgroundColor ?? Colors.blue,
        width: double.infinity,
        height: 50,
        child: Center(
          child: AppTextStyles.bodyStrong(
            context: context,
            text: title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
