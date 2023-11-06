import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:gimme_delivery/features/main/delivery/domain/usecases/get_merchants.dart';
import 'package:injectable/injectable.dart';

part 'delivery_state.dart';

@Injectable()
class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit()
      : super(const DeliveryState(status: DeliveryStateStatus.initial));

  final GetMerchants _getMerchants = getIt<GetMerchants>();

  void getMerchants() async {
    emit(state.copyWith(status: DeliveryStateStatus.loading));

    var result = await _getMerchants.execute();

    emit(
      result.fold(
        (failure) => state.copyWith(
            status: DeliveryStateStatus.failed, failure: failure),
        (data) =>
            state.copyWith(status: DeliveryStateStatus.loaded, merchants: data),
      ),
    );
  }
}
