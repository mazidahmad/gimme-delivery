// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delivery_cubit.dart';

enum DeliveryStateStatus { initial, loading, loaded, failed }

class DeliveryState extends Equatable {
  const DeliveryState({this.merchants, required this.status, this.failure});

  final List<MerchantModel?>? merchants;
  final DeliveryStateStatus status;
  final Failure? failure;

  @override
  List<Object?> get props => [merchants, status, failure];

  DeliveryState copyWith({
    List<MerchantModel?>? merchants,
    DeliveryStateStatus? status,
    Failure? failure,
  }) {
    return DeliveryState(
      merchants: merchants ?? this.merchants,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
