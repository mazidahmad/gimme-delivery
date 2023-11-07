import 'package:equatable/equatable.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class DeliveryData extends Equatable {
  final double weight;
  final double duration;
  final double distance;
  final List<Position> coordinates;

  const DeliveryData({
    required this.weight,
    required this.duration,
    required this.distance,
    required this.coordinates,
  });

  DeliveryData copyWith({
    double? weight,
    double? duration,
    double? distance,
    List<Position>? coordinates,
  }) {
    return DeliveryData(
      weight: weight ?? this.weight,
      duration: duration ?? this.duration,
      distance: distance ?? this.distance,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  @override
  List<Object> get props => [weight, duration, distance, coordinates];
}
