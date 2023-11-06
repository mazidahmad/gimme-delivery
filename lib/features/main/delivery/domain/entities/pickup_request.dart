import 'package:gimme_delivery/features/global/domain/base_location.dart';

class PickUpRequest extends BaseLocation {
  final String senderName;
  final String senderPhone;

  const PickUpRequest({
    required this.senderName,
    required this.senderPhone,
    required super.locationName,
    required super.address,
    required super.longitude,
    required super.latitude,
    super.notes,
  });

  @override
  PickUpRequest copyWith({
    String? senderName,
    String? senderPhone,
    String? locationName,
    String? address,
    double? longitude,
    double? latitude,
    String? notes,
  }) {
    return PickUpRequest(
      senderName: senderName ?? this.senderName,
      senderPhone: senderPhone ?? this.senderPhone,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      locationName: locationName ?? this.locationName,
      longitude: longitude ?? this.longitude,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
        senderName,
        senderPhone,
        locationName,
        address,
        longitude,
        latitude,
        notes,
      ];
}
