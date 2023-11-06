import 'dart:convert';

import 'package:gimme_delivery/features/global/domain/base_location.dart';

class BaseLocationModel extends BaseLocation {
  const BaseLocationModel(
      {required super.locationName,
      required super.address,
      required super.longitude,
      required super.latitude,
      required super.notes});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'locationName': locationName,
      'address': address,
      'longitude': longitude,
      'latitude': latitude,
      'notes': notes,
    };
  }

  factory BaseLocationModel.fromMap(Map<String, dynamic> map) {
    return BaseLocationModel(
      locationName: map['locationName'] as String,
      address: map['address'] as String,
      longitude: map['longitude'] as double,
      latitude: map['latitude'] as double,
      notes: map['notes'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseLocationModel.fromJson(String source) =>
      BaseLocationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
