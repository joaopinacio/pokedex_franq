import 'colors/app_colors.dart';
import 'icons/app_icons.dart';
import 'images/app_images.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const _fontFamily = 'Poppins';
  static final _textStyle = TextStyle(
    color: colors.primaryColor,
    letterSpacing: 0,
    fontFamily: _fontFamily,
  );

  /// Cores padrões
  static AppColors get colors => AppColors();

  /// Icones padrões
  static AppIcons get icons => AppIcons();

  /// Imagens padrões
  static AppImages get images => AppImages();

  /// Light Theme
  static ThemeData get light => ThemeData(
        // useMaterial3: true,
        // primarySwatch: Colors.orange,
        iconTheme: IconThemeData(color: colors.primaryColor),
        appBarTheme: AppBarTheme(
          color: colors.white,
        ),
        backgroundColor: colors.white,
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: colors.scaffoldBackground,
        textTheme: TextTheme(
          bodyText1: _textStyle.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
          bodyText2: _textStyle.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
          headline1: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w500),
          headline2: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
          headline3: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
          headline4: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
          headline5: _textStyle.copyWith(fontSize: 25, fontWeight: FontWeight.w700),
          headline6: _textStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w700),
          subtitle1: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700),
          subtitle2: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700),
          caption: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700),
          button: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700),
          overline: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700),
        ),
      );

  /// Dark Theme
  static ThemeData get dark => ThemeData(
        // useMaterial3: true,
        // primarySwatch: Colors.orange,
        iconTheme: IconThemeData(color: colors.white),
        appBarTheme: AppBarTheme(
          color: colors.primaryColor,
        ),
        backgroundColor: colors.primaryColor,
        brightness: Brightness.dark,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: colors.primaryColor,
        textTheme: TextTheme(
          bodyText1: _textStyle.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: colors.white),
          bodyText2: _textStyle.copyWith(fontSize: 15, fontWeight: FontWeight.w500, color: colors.white),
          headline1: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w500, color: colors.white),
          headline2: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w600, color: colors.white),
          headline3: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w600, color: colors.white),
          headline4: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w600, color: colors.white),
          headline5: _textStyle.copyWith(fontSize: 25, fontWeight: FontWeight.w700, color: colors.white),
          headline6: _textStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w700, color: colors.white),
          subtitle1: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700, color: colors.white),
          subtitle2: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700, color: colors.white),
          caption: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700, color: colors.white),
          button: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700, color: colors.white),
          overline: _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w700, color: colors.white),
        ),
      );
}
