part of 'verification_cubit.dart';

class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationSuccess extends VerificationState {}

class VerificationFailed extends VerificationState {
  final Failure failure;

  const VerificationFailed({required this.failure});
}
