import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static Text h1({
    required BuildContext context,
    required String text,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.headline6?.copyWith(
              color: color,
            ),
      );

  static Text h2({
    required BuildContext context,
    required String text,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.headline5?.copyWith(
              color: color,
            ),
      );

  static Text body({
    required BuildContext context,
    required String text,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: color,
            ),
      );

  static Text bodyStrong({
    required BuildContext context,
    required String text,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: color,
            ),
      );

  static Text headlineStrong({
    required BuildContext context,
    required String text,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.headline1?.copyWith(
              color: color,
            ),
      );
}
