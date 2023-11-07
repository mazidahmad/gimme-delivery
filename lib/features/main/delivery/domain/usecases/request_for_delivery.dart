import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_request.dart';
import 'package:gimme_delivery/features/main/delivery/domain/repositories/delivery_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RequestForDelivery {
  final DeliveryRepository _repo = getIt<DeliveryRepository>();

  Future<Either<Failure, void>> execute(DeliveryRequest deliveryRequest) =>
      _repo.requestForDelivery(deliveryRequest);
}
