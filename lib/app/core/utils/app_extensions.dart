import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

extension FormatString on String {
  String get capitalize {
    var text = this;

    if (text.isEmpty) {
      return text;
    }

    return text[0].toUpperCase() + text.substring(1);
  }

  String get putLeft {
    var text = this;

    return text.padLeft(3, '0');
  }
}

extension ThemeModeState on ThemeMode {
  bool get isDark => ThemeMode.system != this
      ? ThemeMode.dark == this
      : SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

  bool get isLight => ThemeMode.system != this
      ? ThemeMode.light == this
      : SchedulerBinding.instance.window.platformBrightness == Brightness.light;
}
