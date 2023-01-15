import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'layout/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'pokedex_franq',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: AppThemes.light,
      // darkTheme: AppThemes.dark,
      builder: (_, child) {
        return MediaQuery(
          data: MediaQuery.of(_).copyWith(textScaleFactor: 1.0),
          child: GestureDetector(
            onTap: () => FocusScope.of(_).requestFocus(FocusNode()),
            child: child ?? const SizedBox(),
          ),
        );
      },
      // TODO: Fazer arquivo com gerenciamento de estado para mudar o Theme (Dark and White)
      // themeMode: getThemeMode,
      /* EXAMPLE
        ThemeMode get getThemeMode {
          switch (store.themeStore.state) {
            case AppThemeType.dark:
              return ThemeMode.dark;
            case AppThemeType.light:
              return ThemeMode.light;
          }
        }
      */
    );
  }
}
