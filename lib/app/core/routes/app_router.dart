import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../feature/default/presenter/pages/default_page.dart';
import '../../feature/splash/presenter/splash_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: DefaultPage, initial: true),
    // AutoRoute(page: BookDetailsPage),
  ],
)
@lazySingleton
class AppRouter extends _$AppRouter {}
