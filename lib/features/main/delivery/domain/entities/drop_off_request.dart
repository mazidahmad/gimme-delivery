import 'package:gimme_delivery/features/global/domain/base_location.dart';

class DropOffRequest extends BaseLocation {
  final String receiverName;
  final String receiverPhone;

  const DropOffRequest({
    required this.receiverName,
    required this.receiverPhone,
    required super.locationName,
    required super.address,
    required super.longitude,
    required super.latitude,
    super.notes,
  });

  @override
  DropOffRequest copyWith({
    String? receiverName,
    String? receiverPhone,
    String? locationName,
    String? address,
    double? longitude,
    double? latitude,
    String? notes,
  }) {
    return DropOffRequest(
      receiverName: receiverName ?? this.receiverName,
      receiverPhone: receiverPhone ?? this.receiverPhone,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      locationName: locationName ?? this.locationName,
      longitude: longitude ?? this.longitude,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
        receiverName,
        receiverPhone,
        locationName,
        address,
        longitude,
        latitude,
        notes,
      ];
}
