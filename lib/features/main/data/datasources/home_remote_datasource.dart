import 'dart:convert';
import 'dart:developer';

import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/network/amplify_module.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDatasource {
  Future<String> getFullNameUser();
  Future<List<DeliveryModel?>?> getDeliveries();
}

@Injectable(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  final AmplifyModule amplifyModule = getIt<AmplifyModule>();

  @override
  Future<String> getFullNameUser() async {
    final result = await amplifyModule.amplify.Auth.fetchUserAttributes();

    return result[2].value;
  }

  @override
  Future<List<DeliveryModel?>?> getDeliveries() async {
    var response = await amplifyModule.getListQueryData(query: '''
          query MyQuery {
            listDeliveryModels {
              items {
                DropOffModel {
                  address
                  createdAt
                  latitude
                  id
                  location_name
                  notes
                  longitude
                  owner
                  receiver_name
                  receiver_phone
                  updatedAt
                }
                PickUpModel {
                  address
                  id
                  createdAt
                  latitude
                  location_name
                  longitude
                  notes
                  owner
                  sender_name
                  sender_phone
                  updatedAt
                }
                createdAt
                distance
                deliveryModelDropOffModelId
                deliveryModelPickUpModelId
                est_delivery_time
                id
                owner
                status
                updatedAt
              }
            }
          }
        ''');

    log(response.data!);
    var json = jsonDecode(response.data!);
    List<DeliveryModel> deliveries =
        List.of(json['listDeliveryModels']['items'])
            .map((e) => DeliveryModel.fromJson(e))
            .toList();

    return deliveries;
  }
}
