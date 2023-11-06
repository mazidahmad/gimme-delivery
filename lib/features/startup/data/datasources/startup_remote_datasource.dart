import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/network/amplify_module.dart';
import 'package:injectable/injectable.dart';

abstract class StartupRemoteDatasource {
  Future<void> initializeAmplifyConfiguration();
  Future<AuthUser?> getCurrentUser();
}

@Injectable(as: StartupRemoteDatasource)
class StartupRemoteDatasourceImpl extends StartupRemoteDatasource {
  final AmplifyModule amplifyModule = getIt<AmplifyModule>();

  @override
  Future<void> initializeAmplifyConfiguration() async {
    await amplifyModule.configureAmplify();
  }

  @override
  Future<AuthUser?> getCurrentUser() async {
    try {
      return await amplifyModule.amplify.Auth.getCurrentUser();
    } catch (_) {
      return null;
    }
  }
}
