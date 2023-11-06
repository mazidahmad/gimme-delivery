// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delivery_cubit.dart';

enum DeliveryStateStatus { initial, loading, loaded, failed }

class DeliveryState extends Equatable {
  const DeliveryState({
    this.merchants,
    required this.status,
    this.failure,
    this.pickUpRequest,
    this.dropOffRequest,
  });

  final List<MerchantModel?>? merchants;
  final PickUpRequest? pickUpRequest;
  final DropOffRequest? dropOffRequest;
  final DeliveryStateStatus status;
  final Failure? failure;

  @override
  List<Object?> get props =>
      [merchants, status, failure, pickUpRequest, dropOffRequest];

  DeliveryState copyWith({
    List<MerchantModel?>? merchants,
    PickUpRequest? pickUpRequest,
    DropOffRequest? dropOffRequest,
    DeliveryStateStatus? status,
    Failure? failure,
  }) {
    return DeliveryState(
      merchants: merchants ?? this.merchants,
      status: status ?? this.status,
      failure: failure ?? this.failure,
      dropOffRequest: dropOffRequest ?? this.dropOffRequest,
      pickUpRequest: pickUpRequest ?? this.pickUpRequest,
    );
  }
}
