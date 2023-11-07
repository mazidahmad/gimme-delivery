import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:gimme_delivery/core/config/api_url.dart';
import 'package:gimme_delivery/core/config/env.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/network/amplify_module.dart';
import 'package:gimme_delivery/core/network/http_module.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:gimme_delivery/features/main/delivery/data/models/delivery_data_model.dart';
import 'package:gimme_delivery/features/main/delivery/data/models/delivery_request_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

abstract class DeliveryRemoteDatasource {
  Future<List<MerchantModel?>?> getMerchants();
  Future<void> requestForDelivery(DeliveryRequestModel delivery);
  Future<DeliveryDataModel> fetchRouteCoordinates(Position start, Position end);
}

@Injectable(as: DeliveryRemoteDatasource)
class DeliveryRemoteDatasourceImpl extends DeliveryRemoteDatasource {
  final AmplifyModule _ampModule = getIt<AmplifyModule>();
  final HttpModule _httpModule = getIt<HttpModule>();

  @override
  Future<List<MerchantModel?>?> getMerchants() async {
    var response = await _ampModule.getListData(
        modelType: MerchantModel.classType, isUseAuthorized: false);
    return response.data?.items;
  }

  @override
  Future<DeliveryDataModel> fetchRouteCoordinates(
      Position start, Position end) async {
    var response = await _httpModule.sendGetRequest(
        "${ApiUrl.driving}/${start.lng},${start.lat};${end.lng},${end.lat}?overview=full&access_token=${Env.mapBoxToken}");

    return DeliveryDataModel.fromMap(response.data);
  }

  @override
  Future<void> requestForDelivery(DeliveryRequestModel delivery) async {
    PickUpModel pickUpModel = PickUpModel(
      sender_name: delivery.pickUpRequest.senderName,
      sender_phone: delivery.pickUpRequest.senderPhone,
      location_name: delivery.pickUpRequest.locationName,
      address: delivery.pickUpRequest.address,
      latitude: delivery.pickUpRequest.latitude,
      longitude: delivery.pickUpRequest.longitude,
      notes: delivery.pickUpRequest.notes,
    );

    DropOffModel dropOffModel = DropOffModel(
      receiver_name: delivery.dropOffRequest.receiverName,
      receiver_phone: delivery.dropOffRequest.receiverPhone,
      location_name: delivery.dropOffRequest.locationName,
      address: delivery.dropOffRequest.address,
      latitude: delivery.dropOffRequest.latitude,
      longitude: delivery.dropOffRequest.longitude,
      notes: delivery.dropOffRequest.notes,
    );

    var pickUpResponse = await _ampModule.create(model: pickUpModel);
    var dropOffResponse = await _ampModule.create(model: dropOffModel);

    var estDeliveryTime =
        '${DateTime.now().add(Duration(minutes: delivery.deliveryData.duration.toInt())).toIso8601String()}Z';

    DeliveryModel deliveryModel = DeliveryModel(
      distance: delivery.deliveryData.distance,
      deliveryModelDropOffModelId: dropOffResponse.data!.id,
      deliveryModelPickUpModelId: pickUpResponse.data!.id,
      est_delivery_time: TemporalDateTime.fromString(estDeliveryTime),
      status: 'pending',
    );

    await _ampModule.create(model: deliveryModel);
  }
}
