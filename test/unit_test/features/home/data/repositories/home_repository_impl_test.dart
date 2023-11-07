import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gimme_delivery/features/main/data/datasources/home_remote_datasource.dart';
import 'package:gimme_delivery/features/main/data/repositories/home_repository_impl.dart';
import 'package:gimme_delivery/features/main/domain/repositories/home_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/mock_data.dart';
import '../../../../../helpers/test_injection.dart';

class MockHomeRemoteDatasource extends Mock implements HomeRemoteDatasource {}

void main() {
  late HomeRepository repository;
  late HomeRemoteDatasource mockDatasource;

  setUpAll(
    () {
      mockDatasource = MockHomeRemoteDatasource();
      registerTestFactory<HomeRemoteDatasource>(mockDatasource);
      repository = HomeRepositoryImpl();
    },
  );

  group(
    'Get Deliveries',
    () {
      test(
        'should return Right void when success',
        () async {
          when(() => mockDatasource.getDeliveries()).thenAnswer(
            (_) async => MockData.deliveriesData,
          );

          var result = await repository.getDeliveries();

          verify(() => mockDatasource.getDeliveries());

          expect(result, equals(Right(MockData.deliveriesData)));
        },
      );
    },
  );
}
