import 'package:equatable/equatable.dart';

abstract class BlocState extends Equatable {}

/// The first state of the bloc
class InitialState extends BlocState {
  InitialState();

  @override
  List get props => [];
}

/// To indicate if there is a request was sent to the server or not
class LoadingState extends BlocState {
  @override
  List get props => [];
}

/// Will represent the success which will be emitted to the bloc
class SuccessState<T> extends BlocState {
  final T response;

  SuccessState(
    this.response,
  );
  @override
  List<T> get props => [response];
}

/// Will represent the failure which will be emitted to the bloc
class FailureState extends BlocState {
  @override
  List get props => [];
}
