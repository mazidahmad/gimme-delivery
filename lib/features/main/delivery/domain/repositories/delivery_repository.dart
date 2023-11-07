import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_data.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_request.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

abstract class DeliveryRepository {
  Future<Either<Failure, List<MerchantModel?>?>> fetchMerchants();
  Future<Either<Failure, void>> requestForDelivery(
      DeliveryRequest deliveryRequest);
  Future<Either<Failure, DeliveryData>> fetchRouteCoordinates(
      Position start, Position end);
}
