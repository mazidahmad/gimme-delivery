import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';

abstract class HomeRepository {
  Future<Either<Failure, String>> getFullNameUser();
  Future<Either<Failure, List<DeliveryModel?>?>> getDeliveries();
}
