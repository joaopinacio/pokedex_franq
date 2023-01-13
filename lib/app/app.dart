import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'core/injectable/injectable.dart';
import 'core/routes/app_router.dart';
import 'core/routes/router_observer.dart';
import 'layout/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'pokedex_franq',
      debugShowCheckedModeBanner: false,
      routerDelegate: AutoRouterDelegate(
        getIt<AppRouter>(),
        navigatorObservers: () => [
          AppRouteObserver(),
          FirebaseAnalyticsObserver(analytics: getIt<FirebaseAnalytics>()),
        ],
      ),
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
      // translations: TranslationService(),
      // locale: TranslationService.locale,
      // fallbackLocale: TranslationService.fallbackLocale,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
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
      // TODO: Escolher qual gerenciamento de estado usar
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
