import 'package:gimme_delivery/features/global/data/models/model_provider.dart';

class MockData {
  static const String deliveriesJson =
      '{"listDeliveryModels":{"items":[{"DropOffModel":{"address":"Jl. Jend. Sudirman No.620, Dungus Cariang, Kec. Andir, Kota Bandung, Jawa Barat 40183","createdAt":"2023-11-07T01:25:21.765Z","latitude":-6.917539718710962,"id":"c1c9c30a-318e-459b-9e9c-1ba1cc9821f9","location_name":"Sudirman Grand Ballroom","notes":"","longitude":107.57952826420963,"owner":"7e05a1a7-3af4-4bd7-a972-2a5ece0c9b3d","receiver_name":"Wilma","receiver_phone":"0871663122","updatedAt":"2023-11-07T01:25:21.765Z"},"PickUpModel":{"address":"Jl. Rasamala IV Blk. H No.45, Gempolsari, Kec. Bandung Kulon, Kota Bandung, Jawa Barat 40215","id":"f933380b-084c-47f2-a294-932a5371db65","createdAt":"2023-11-07T01:25:21.285Z","latitude":-6.935801097278614,"location_name":"Annacy.co","longitude":107.55402434787554,"notes":"","owner":"7e05a1a7-3af4-4bd7-a972-2a5ece0c9b3d","sender_name":"Mazid Ahmad","sender_phone":"0861552513","updatedAt":"2023-11-07T01:25:21.285Z"},"createdAt":"2023-11-07T01:25:22.230Z","distance":5832.458,"deliveryModelDropOffModelId":"c1c9c30a-318e-459b-9e9c-1ba1cc9821f9","deliveryModelPickUpModelId":"f933380b-084c-47f2-a294-932a5371db65","est_delivery_time":"2023-11-08T02:18:21.804311000Z","id":"b6fb4c4d-b149-43d6-91de-f48c035f827e","owner":"7e05a1a7-3af4-4bd7-a972-2a5ece0c9b3d","status":"pending","updatedAt":"2023-11-07T01:25:22.230Z"}]}}';
  static List<DeliveryModel> deliveriesData = [
    DeliveryModel(
      distance: 500.99,
      status: 'pending',
      id: '8y88asgdiasdgasidgdsad',
      pickUpModel: PickUpModel(
          sender_name: 'sender_name',
          sender_phone: 'sender_phone',
          location_name: 'location_name',
          address: 'address',
          longitude: 100,
          latitude: -1),
      dropOffModel: DropOffModel(
          receiver_name: 'sender_name',
          receiver_phone: 'sender_phone',
          location_name: 'location_name',
          address: 'address',
          longitude: 100,
          latitude: -1),
    ),
  ];
}
