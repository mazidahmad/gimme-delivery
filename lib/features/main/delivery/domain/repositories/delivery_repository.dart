import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';

abstract class DeliveryRepository {
  Future<Either<Failure, List<MerchantModel?>?>> fetchMerchants();
}
