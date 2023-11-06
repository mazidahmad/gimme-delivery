// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_cubit.dart';

enum MainStateStatus { initial, loading, failed, loaded }

class MainState extends Equatable {
  const MainState({required this.name, required this.status, this.failure});

  final MainStateStatus status;
  final String name;
  final Failure? failure;

  @override
  List<Object?> get props => [status, name, failure];

  MainState copyWith({
    MainStateStatus? status,
    String? name,
    Failure? failure,
  }) {
    return MainState(
      status: status ?? this.status,
      name: name ?? this.name,
      failure: failure ?? this.failure,
    );
  }
}
