import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_franq/app/app.dart';
import 'package:pokedex_franq/app/core/injectable/injectable.dart';
import 'package:pokedex_franq/app/core/routes/app_module.dart';

import 'firebase_test_mock.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    configureDependencies();
    await Firebase.initializeApp();

    Modular.setNavigatorKey(GlobalKey());
    Modular.setInitialRoute(AppModule.splash);
    Modular.init(AppModule());
  });

  testWidgets('test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.runAsync(() async {
      await tester.pumpWidget(const MyApp());
    });
  });
}
