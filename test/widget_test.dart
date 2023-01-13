import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_franq/app/app.dart';
import 'package:pokedex_franq/app/core/injectable/injectable.dart';

import 'firebase_test_mock.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    configureDependencies();
    await Firebase.initializeApp();
  });

  testWidgets('test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.runAsync(() async {
      await tester.pumpWidget(const MyApp());
    });
  });
}
