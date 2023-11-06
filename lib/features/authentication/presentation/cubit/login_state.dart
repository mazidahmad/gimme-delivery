part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginConfirmSignUp extends LoginState {}

class LoginFailed extends LoginState {
  final Failure failure;

  const LoginFailed({required this.failure});
}
