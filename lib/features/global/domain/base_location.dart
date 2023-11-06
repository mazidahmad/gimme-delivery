import 'package:equatable/equatable.dart';

class BaseLocation extends Equatable {
  final String locationName;
  final String address;
  final double longitude;
  final double latitude;
  final String? notes;

  const BaseLocation({
    required this.locationName,
    required this.address,
    required this.longitude,
    required this.latitude,
    this.notes,
  });

  BaseLocation copyWith({
    String? locationName,
    String? address,
    double? longitude,
    double? latitude,
    String? notes,
  }) {
    return BaseLocation(
      locationName: locationName ?? this.locationName,
      address: address ?? this.address,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props {
    return [
      locationName,
      address,
      longitude,
      latitude,
      notes,
    ];
  }
}
