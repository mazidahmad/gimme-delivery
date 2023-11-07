import 'package:equatable/equatable.dart';
import 'package:gimme_delivery/features/main/delivery/data/models/delivery_request_model.dart';

import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_data.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/drop_off_request.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/pickup_request.dart';

class DeliveryRequest extends Equatable {
  final DeliveryData deliveryData;
  final PickUpRequest pickUpRequest;
  final DropOffRequest dropOffRequest;

  const DeliveryRequest({
    required this.deliveryData,
    required this.pickUpRequest,
    required this.dropOffRequest,
  });

  DeliveryRequest copyWith({
    DeliveryData? deliveryData,
    PickUpRequest? pickUpRequest,
    DropOffRequest? dropOffRequest,
  }) {
    return DeliveryRequest(
      deliveryData: deliveryData ?? this.deliveryData,
      pickUpRequest: pickUpRequest ?? this.pickUpRequest,
      dropOffRequest: dropOffRequest ?? this.dropOffRequest,
    );
  }

  DeliveryRequestModel toModel() => DeliveryRequestModel(
      deliveryData: deliveryData,
      pickUpRequest: pickUpRequest,
      dropOffRequest: dropOffRequest);

  @override
  List<Object> get props => [deliveryData, pickUpRequest, dropOffRequest];
}
