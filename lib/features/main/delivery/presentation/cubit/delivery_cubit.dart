import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/drop_off_request.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/pickup_request.dart';
import 'package:gimme_delivery/features/main/delivery/domain/usecases/get_merchants.dart';
import 'package:injectable/injectable.dart';

part 'delivery_state.dart';

@Injectable()
class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit()
      : super(const DeliveryState(status: DeliveryStateStatus.initial));

  final GetMerchants _getMerchants = getIt<GetMerchants>();

  final TextEditingController pickPointController = TextEditingController();
  final TextEditingController dropOffController = TextEditingController();

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

  void setPickUpRequest(PickUpRequest pickUpRequest) {
    pickPointController.text = pickUpRequest.locationName;
    emit(state.copyWith(pickUpRequest: pickUpRequest));
  }

  void setDropOffRequest(DropOffRequest dropOffRequest) {
    dropOffController.text = dropOffRequest.locationName;
    emit(state.copyWith(dropOffRequest: dropOffRequest));
  }
}
