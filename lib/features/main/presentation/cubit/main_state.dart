// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_cubit.dart';

enum MainStateStatus { initial, loading, failed, loaded }

class MainState extends Equatable {
  const MainState(
      {required this.name,
      required this.status,
      this.deliveries,
      this.failure});

  final MainStateStatus status;
  final String name;
  final List<DeliveryModel?>? deliveries;
  final Failure? failure;

  @override
  List<Object?> get props => [status, name, deliveries, failure];

  MainState copyWith({
    MainStateStatus? status,
    String? name,
    List<DeliveryModel?>? deliveries,
    Failure? failure,
  }) {
    return MainState(
      status: status ?? this.status,
      name: name ?? this.name,
      deliveries: deliveries ?? this.deliveries,
      failure: failure ?? this.failure,
    );
  }
}
