import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/bloc_state.dart';
import '../../../../core/injectable/injectable.dart';
import '../../domain/entity/user_entity.dart';
import '../bloc/default_bloc.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DefaultBloc(defaultUsecase: getIt.get()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<DefaultBloc, BlocState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: Text(
                  "Loading...",
                  style: TextStyle(color: Colors.black),
                ),
              );
            }
            if (state is SuccessState<DefaultEntity>) {
              return Center(
                  child: Text("Success: ${state.response.name}", style: const TextStyle(color: Colors.black)));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
