import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_data.dart';
import 'package:gimme_delivery/features/main/delivery/domain/repositories/delivery_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@Injectable()
class FetchRoutesCoordinates {
  final DeliveryRepository _repo = getIt<DeliveryRepository>();

  Future<Either<Failure, DeliveryData>> execute(Position start, Position end) =>
      _repo.fetchRouteCoordinates(start, end);
}
