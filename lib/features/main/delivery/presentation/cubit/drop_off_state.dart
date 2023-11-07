part of 'drop_off_cubit.dart';

enum DropOffStateStatus { initial, mapCreated, loading, loaded, failed, done }

class DropOffState extends Equatable {
  const DropOffState({required this.status, this.dropOffRequest, this.failure});

  final DropOffRequest? dropOffRequest;
  final DropOffStateStatus status;
  final Failure? failure;

  @override
  List<Object?> get props => [status, dropOffRequest, failure];

  DropOffState copyWith({
    DropOffRequest? dropOffRequest,
    DropOffStateStatus? status,
    Failure? failure,
  }) {
    return DropOffState(
      dropOffRequest: dropOffRequest ?? this.dropOffRequest,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
