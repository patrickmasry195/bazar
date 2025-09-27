part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoaded extends SplashState {}

class SplashError extends SplashState {
  final String errMessage;

  const SplashError(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
