import 'dart:convert';

import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_data.dart';
import 'package:turf/polyline.dart';

class DeliveryDataModel extends DeliveryData {
  const DeliveryDataModel(
      {required super.weight,
      required super.duration,
      required super.distance,
      required super.coordinates});

  factory DeliveryDataModel.fromMap(Map<String, dynamic> map) {
    return DeliveryDataModel(
      weight: map['routes'][0]['weight'] as double,
      duration: map['routes'][0]['duration'] as double,
      distance: map['routes'][0]['distance'] as double,
      coordinates: Polyline.decode(map['routes'][0]['geometry']),
    );
  }

  factory DeliveryDataModel.fromJson(String source) =>
      DeliveryDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
