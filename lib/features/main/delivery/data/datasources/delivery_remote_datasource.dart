import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/network/amplify_module.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:injectable/injectable.dart';

abstract class DeliveryRemoteDatasource {
  Future<List<MerchantModel?>?> getMerchants();
}

@Injectable(as: DeliveryRemoteDatasource)
class DeliveryRemoteDatasourceImpl extends DeliveryRemoteDatasource {
  final AmplifyModule _ampModule = getIt<AmplifyModule>();

  @override
  Future<List<MerchantModel?>?> getMerchants() async {
    var response = await _ampModule.getListData(
        modelType: MerchantModel.classType, isUseAuthorized: false);
    return response.data?.items;
  }
}
