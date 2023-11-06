import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:gimme_delivery/amplifyconfiguration.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';

import 'package:injectable/injectable.dart';

@Injectable()
class AmplifyModule {
  final AmplifyClass amplify = Amplify;

  Future<void> configureAmplify() async {
    final ModelProvider modelProvider = ModelProvider();
    final AmplifyAuthCognito auth = AmplifyAuthCognito();
    final AmplifyAnalyticsPinpoint analytics = AmplifyAnalyticsPinpoint();
    final AmplifyAPI api = AmplifyAPI(modelProvider: modelProvider);

    try {
      await amplify.addPlugins([auth, analytics, api]);
      await amplify.configure(amplifyconfig);
    } catch (e) {
      throw const NetworkException('Error when initialize Amplify');
    }
  }
}
