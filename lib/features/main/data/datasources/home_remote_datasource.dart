import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/network/amplify_module.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDatasource {
  Future<String> getFullNameUser();
}

@Injectable(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  final AmplifyModule amplifyModule = getIt<AmplifyModule>();

  @override
  Future<String> getFullNameUser() async {
    final result = await amplifyModule.amplify.Auth.fetchUserAttributes();

    return result[2].value;
  }
}
