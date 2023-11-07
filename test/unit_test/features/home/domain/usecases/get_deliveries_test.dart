import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gimme_delivery/features/main/domain/repositories/home_repository.dart';
import 'package:gimme_delivery/features/main/domain/usecases/get_deliveries.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/mock_data.dart';
import '../../../../../helpers/test_injection.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetDeliveries usecase;
  late HomeRepository mockDatasource;

  setUpAll(
    () {
      mockDatasource = MockHomeRepository();
      registerTestFactory<HomeRepository>(mockDatasource);
      usecase = GetDeliveries();
    },
  );

  group(
    'Get Deliveries',
    () {
      test(
        'should return Right void when success',
        () async {
          when(() => mockDatasource.getDeliveries()).thenAnswer(
            (_) async => Right(MockData.deliveriesData),
          );

          var result = await usecase.execute();

          verify(() => mockDatasource.getDeliveries());

          expect(result, equals(Right(MockData.deliveriesData)));
        },
      );
    },
  );
}
