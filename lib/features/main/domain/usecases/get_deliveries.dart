import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:gimme_delivery/features/main/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetDeliveries {
  final HomeRepository _repo = getIt<HomeRepository>();

  Future<Either<Failure, List<DeliveryModel?>?>> execute() =>
      _repo.getDeliveries();
}
