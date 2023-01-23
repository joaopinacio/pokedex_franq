import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_franq/app/core/routes/app_module.dart';

import 'app/app.dart';
import 'app/core/injectable/injectable.dart';
import 'app/core/sqflite/sqflite.dart';
import 'app/core/utils/logger.dart';
import 'firebase_options.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    configureDatabase();
    configureDependencies();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    final firebaseCrashlytics = getIt<FirebaseCrashlytics>();
    if (kDebugMode) {
      await firebaseCrashlytics.setCrashlyticsCollectionEnabled(false);
    } else {
      await firebaseCrashlytics.setCrashlyticsCollectionEnabled(true);
      FlutterError.onError = firebaseCrashlytics.recordFlutterError;
    }

    Modular.setNavigatorKey(GlobalKey());
    Modular.setObservers([FirebaseAnalyticsObserver(analytics: getIt<FirebaseAnalytics>())]);
    Modular.setInitialRoute(AppModule.splash);

    runApp(ModularApp(module: AppModule(), child: const MyApp()));
  }, (error, stackTrace) async {
    logger('App error: $error', stackTrace: stackTrace);

    if (!kDebugMode) {
      await getIt<FirebaseCrashlytics>().recordError(error, stackTrace);
    }
  });
}
