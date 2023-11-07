import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/core/extensions/mapbox_extensions.dart';
import 'package:gimme_delivery/core/theme/app_assets.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/drop_off_request.dart';
import 'package:injectable/injectable.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:pinput/pinput.dart';

part 'drop_off_state.dart';

@Injectable()
class DropOffCubit extends Cubit<DropOffState> {
  DropOffCubit()
      : super(const DropOffState(status: DropOffStateStatus.initial));

  List<MerchantModel?> _merchants = [];
  MapboxMap? _mapBox;
  PointAnnotationManager? pointAnnotationManager;

  final GlobalKey<FormState> dropOffForm = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  void initialize(
      List<MerchantModel?> merchants, DropOffRequest? dropOffRequest) {
    _merchants = merchants;
    nameController.setText(dropOffRequest?.receiverName ?? '');
    phoneController.setText(dropOffRequest?.receiverPhone ?? '');
    notesController.setText(dropOffRequest?.notes ?? '');
    emit(state.copyWith(dropOffRequest: dropOffRequest));
  }

  void onMapCreated(MapboxMap mapbox) async {
    _mapBox = mapbox;
    pointAnnotationManager =
        await _mapBox?.annotations.createPointAnnotationManager();

    final ByteData bytes = await rootBundle.load(AppAssets.merchant);
    final Uint8List imageData = bytes.buffer.asUint8List();

    List<Point> coordinates = [];

    for (var merchant in _merchants) {
      var point = Point(
        coordinates: Position(merchant!.longitude, merchant.latitude),
      );
      coordinates.add(point);
      Map<String, Object?> data = merchant.toJson();
      data.addAll(point.toJson());
      await pointAnnotationManager?.addAnnotation(imageData, data);
    }

    emit(state.copyWith(status: DropOffStateStatus.mapCreated));
  }

  void setDropOffRequest(PointAnnotation annotation) async {
    if (annotation.geometry != null) {
      Point point = Point.fromJson((annotation.geometry)!.cast());
      setCameraPosition(Position(point.coordinates.lng, point.coordinates.lat));
      MerchantModel merchant = _merchants.firstWhere((element) =>
          element?.latitude == point.coordinates.lat &&
          element?.longitude == point.coordinates.lng)!;
      emit(
        state.copyWith(
          dropOffRequest: state.dropOffRequest?.copyWith(
            locationName: merchant.merchant_name,
            address: merchant.address,
            latitude: merchant.latitude,
            longitude: merchant.longitude,
          ),
        ),
      );
    }
  }

  void setCameraPosition(Position position) async {
    await _mapBox?.flyTo(
      CameraOptions(
        center: Point(coordinates: position).toJson(),
        zoom: 15,
      ),
      MapAnimationOptions(duration: 300),
    );
  }

  void submitDropOffRequest() {
    emit(
      state.copyWith(
        status: DropOffStateStatus.done,
        dropOffRequest: state.dropOffRequest?.copyWith(
          receiverName: nameController.text,
          receiverPhone: phoneController.text,
          notes: notesController.text,
        ),
      ),
    );
  }

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    notesController.dispose();
  }

  String? fieldValidator(String type, String? value) {
    if (value == null || value.isEmpty) {
      return '$type required';
    }
    return null;
  }
}
