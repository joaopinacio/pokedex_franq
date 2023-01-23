import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class DefaultError extends Failure {
  @override
  List<Object> get props => [];
}

class SqfliteError extends Failure {
  @override
  List<Object> get props => [];
}

class RequiredInputError extends Failure {
  @override
  List<Object> get props => [];
}
