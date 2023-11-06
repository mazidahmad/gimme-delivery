part of 'pick_up_cubit.dart';

enum PickUpStateStatus { initial, mapCreated, loading, loaded, failed, done }

class PickUpState extends Equatable {
  const PickUpState({required this.status, this.pickUpRequest, this.failure});

  final PickUpRequest? pickUpRequest;
  final PickUpStateStatus status;
  final Failure? failure;

  @override
  List<Object?> get props => [status, pickUpRequest, failure];

  PickUpState copyWith({
    PickUpRequest? pickUpRequest,
    PickUpStateStatus? status,
    Failure? failure,
  }) {
    return PickUpState(
      pickUpRequest: pickUpRequest ?? this.pickUpRequest,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
