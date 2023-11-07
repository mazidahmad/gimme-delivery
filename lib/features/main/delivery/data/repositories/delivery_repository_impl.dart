import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/core/mixin/repository_mixin.dart';
import 'package:gimme_delivery/features/global/data/models/merchant_model.dart';
import 'package:gimme_delivery/features/main/delivery/data/datasources/delivery_remote_datasource.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_data.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_request.dart';
import 'package:gimme_delivery/features/main/delivery/domain/repositories/delivery_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@Injectable(as: DeliveryRepository)
class DeliveryRepositoryImpl extends DeliveryRepository with RepositoryMixin {
  final DeliveryRemoteDatasource _remoteDatasource =
      getIt<DeliveryRemoteDatasource>();

  @override
  Future<Either<Failure, List<MerchantModel?>?>> fetchMerchants() =>
      callDataSource(
        () => _remoteDatasource.getMerchants(),
      );

  @override
  Future<Either<Failure, DeliveryData>> fetchRouteCoordinates(
          Position start, Position end) =>
      callDataSource(() => _remoteDatasource.fetchRouteCoordinates(start, end));

  @override
  Future<Either<Failure, void>> requestForDelivery(
          DeliveryRequest deliveryRequest) =>
      callDataSource(() =>
          _remoteDatasource.requestForDelivery(deliveryRequest.toModel()));
}
