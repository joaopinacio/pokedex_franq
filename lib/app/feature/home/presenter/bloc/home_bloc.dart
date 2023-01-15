import 'package:pokedex_franq/app/core/bloc/bloc_cubit.dart';
import 'package:pokedex_franq/app/feature/default/domain/usecase/default_usecase.dart';

import '../../../../core/bloc/bloc_state.dart';

class HomeBloc extends BlocCubit {
  final DefaultUsecase _defaultUsecase;

  HomeBloc({required DefaultUsecase defaultUsecase})
      : _defaultUsecase = defaultUsecase,
        super(InitialState()) {
    init();
  }

  void init() async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    _defaultUsecase().then((value) {
      value.fold(
        (l) => emit(FailureState()),
        (r) => emit(SuccessState(r)),
      );
    });
  }
}
