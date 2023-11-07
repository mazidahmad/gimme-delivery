import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gimme_delivery/features/main/domain/usecases/get_deliveries.dart';
import 'package:gimme_delivery/features/main/domain/usecases/get_fullname_user.dart';
import 'package:gimme_delivery/features/main/presentation/cubit/main_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_data.dart';
import '../../../../helpers/test_injection.dart';

class MockGetDeliveries extends Mock implements GetDeliveries {}

class MockGetFullNameUser extends Mock implements GetFullNameUser {}

void main() {
  late GetDeliveries mockGetDeliveries;
  late GetFullNameUser mockGetFullNameUser;
  late MainCubit cubit;

  setUpAll(() {
    mockGetDeliveries = MockGetDeliveries();
    mockGetFullNameUser = MockGetFullNameUser();
    registerTestFactory<GetDeliveries>(mockGetDeliveries);
    registerTestFactory<GetFullNameUser>(mockGetFullNameUser);
    cubit = MainCubit();
  });

  test('initial MainCubit state should be initial', () {
    expect(cubit.state,
        const MainState(status: MainStateStatus.initial, name: ''));
  });

  group(
    'Get Deliveries',
    () {
      blocTest<MainCubit, MainState>(
        'emits [loading, success] when success.',
        build: () {
          when(
            () => mockGetDeliveries.execute(),
          ).thenAnswer((_) async => Right(MockData.deliveriesData));
          return cubit;
        },
        wait: const Duration(milliseconds: 100),
        act: (cubit) => cubit.getDeliveries(),
        expect: () => <MainState>[
          const MainState(status: MainStateStatus.loading, name: ''),
          cubit.state.copyWith(
              status: MainStateStatus.loaded,
              deliveries: MockData.deliveriesData),
        ],
        verify: (bloc) {
          verify(
            () => mockGetDeliveries.execute(),
          );
        },
      );
    },
  );
}
