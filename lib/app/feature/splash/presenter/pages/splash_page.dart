import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_franq/app/layout/themes/app_themes.dart';

import '../bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocProvider(
        create: (BuildContext context) => SplashBloc(),
        lazy: false,
        child: Scaffold(
          backgroundColor: AppThemes.colors.splashBackground,
          body: Center(
            child: Image.asset(
              AppThemes.images.pokeball,
            ),
          ),
        ),
      ),
    );
  }
}
