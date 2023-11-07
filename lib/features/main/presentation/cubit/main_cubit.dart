import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:gimme_delivery/features/main/domain/usecases/get_deliveries.dart';
import 'package:gimme_delivery/features/main/domain/usecases/get_fullname_user.dart';
import 'package:injectable/injectable.dart';

part 'main_state.dart';

@Injectable()
class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(const MainState(status: MainStateStatus.initial, name: ''));

  final GetFullNameUser _getFullNameUser = getIt<GetFullNameUser>();
  final GetDeliveries _getDeliveries = getIt<GetDeliveries>();

  void getFullname() async {
    emit(state.copyWith(status: MainStateStatus.loading));

    var result = await _getFullNameUser.execute();

    emit(
      result.fold(
        (failure) => state.copyWith(failure: failure),
        (name) {
          return state.copyWith(status: MainStateStatus.loaded, name: name);
        },
      ),
    );
  }

  void getDeliveries() async {
    emit(state.copyWith(status: MainStateStatus.loading));

    var result = await _getDeliveries.execute();

    emit(
      result.fold(
        (failure) => state.copyWith(failure: failure),
        (data) {
          return state.copyWith(
              status: MainStateStatus.loaded,
              deliveries: data?.reversed.toList());
        },
      ),
    );
  }
}
