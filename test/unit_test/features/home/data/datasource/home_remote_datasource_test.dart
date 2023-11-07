import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gimme_delivery/core/network/amplify_module.dart';
import 'package:gimme_delivery/features/main/data/datasources/home_remote_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/mock_data.dart';
import '../../../../../helpers/mock_module.dart';
import '../../../../../helpers/test_injection.dart';

void main() {
  late HomeRemoteDatasource datasource;
  late AmplifyModule mockAmplifyModule;

  setUpAll(
    () {
      mockAmplifyModule = MockAmplifyModule();
      registerTestFactory<AmplifyModule>(mockAmplifyModule);
      datasource = HomeRemoteDatasourceImpl();
    },
  );

  group(
    'Get Deliveries',
    () {
      test(
        'should success add body mass when done',
        () async {
          when(() => mockAmplifyModule.getListQueryData(
              query: any(named: 'query'))).thenAnswer(
            (_) async => const GraphQLResponse(
                errors: [], data: MockData.deliveriesJson),
          );

          var response = await datasource.getDeliveries();

          expect(response?.length, 1);
          expect(response?.first?.id, "b6fb4c4d-b149-43d6-91de-f48c035f827e");
        },
      );
    },
  );
}
