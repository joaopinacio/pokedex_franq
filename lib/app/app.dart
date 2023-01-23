import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/theme/theme_bloc.dart';
import 'layout/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThemeBloc(),
      lazy: false,
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'pokedex_franq',
            debugShowCheckedModeBanner: false,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: state,
            builder: (_, child) {
              return MediaQuery(
                data: MediaQuery.of(_).copyWith(textScaleFactor: 1.0),
                child: GestureDetector(
                  onTap: () => FocusScope.of(_).requestFocus(FocusNode()),
                  child: child ?? const SizedBox(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
