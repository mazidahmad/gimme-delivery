import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:gimme_delivery/features/main/delivery/domain/repositories/delivery_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetMerchants {
  final DeliveryRepository _repo = getIt<DeliveryRepository>();

  Future<Either<Failure, List<MerchantModel?>?>> execute() =>
      _repo.fetchMerchants();
}
