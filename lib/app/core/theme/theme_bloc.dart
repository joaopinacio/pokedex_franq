import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Cubit<ThemeMode> {
  ThemeBloc() : super(ThemeMode.system);

  void fromSwitch(bool value) {
    // var brightness = SchedulerBinding.instance.window.platformBrightness;
    // bool isDarkMode = brightness == Brightness.dark;

    if (value) {
      toDark();
    } else {
      toLight();
    }
  }

  void toDark() {
    emit(ThemeMode.dark);
  }

  void toLight() {
    emit(ThemeMode.light);
  }
}
