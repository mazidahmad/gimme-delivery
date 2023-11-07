import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_request.dart';

class DeliveryRequestModel extends DeliveryRequest {
  const DeliveryRequestModel(
      {required super.deliveryData,
      required super.pickUpRequest,
      required super.dropOffRequest});
}
