import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/core/extensions/mapbox_extensions.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_data.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/delivery_request.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/drop_off_request.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/pickup_request.dart';
import 'package:gimme_delivery/features/main/delivery/domain/usecases/fetch_routes_coordinates.dart';
import 'package:gimme_delivery/features/main/delivery/domain/usecases/get_merchants.dart';
import 'package:gimme_delivery/features/main/delivery/domain/usecases/request_for_delivery.dart';
import 'package:injectable/injectable.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

part 'delivery_state.dart';

@Injectable()
class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit()
      : super(const DeliveryState(status: DeliveryStateStatus.initial));

  final GetMerchants _getMerchants = getIt<GetMerchants>();
  final FetchRoutesCoordinates _fetchRoutesCoordinates =
      getIt<FetchRoutesCoordinates>();
  final RequestForDelivery _requestForDelivery = getIt<RequestForDelivery>();

  final TextEditingController pickPointController = TextEditingController();
  final TextEditingController dropOffController = TextEditingController();

  MapboxMap? mapBox;
  PointAnnotationManager? pointAnnotationManager;
  Point? startPoint;
  Point? endPoint;
  Animation<double>? animation;
  AnimationController? controller;

  void submitDeliveryRequest() async {
    emit(state.copyWith(status: DeliveryStateStatus.loading));

    var deliveryRequest = DeliveryRequest(
      deliveryData: state.deliveryData!,
      pickUpRequest: state.pickUpRequest!,
      dropOffRequest: state.dropOffRequest!,
    );

    var result = await _requestForDelivery.execute(deliveryRequest);

    emit(
      result.fold(
        (failure) => state.copyWith(
            status: DeliveryStateStatus.failed, failure: failure),
        (_) => state.copyWith(status: DeliveryStateStatus.requested),
      ),
    );
  }

  void onMapCreated(MapboxMap mapbox) async {
    emit(state.copyWith(status: DeliveryStateStatus.loading));
    mapBox = mapbox;
    pointAnnotationManager =
        await mapBox?.annotations.createPointAnnotationManager();

    final ByteData bytes = await rootBundle.load(AppAssets.merchant);
    final Uint8List imageData = bytes.buffer.asUint8List();

    await pointAnnotationManager?.deleteAll();

    startPoint = Point(
      coordinates: Position(
          state.pickUpRequest!.longitude, state.pickUpRequest!.latitude),
    );
    endPoint = Point(
      coordinates: Position(
          state.dropOffRequest!.longitude, state.dropOffRequest!.latitude),
    );

    await pointAnnotationManager?.addAnnotation(
        imageData, startPoint!.toJson());
    await pointAnnotationManager?.addAnnotation(imageData, endPoint!.toJson());

    await Future.delayed(const Duration(milliseconds: 200));
    final camera = await mapBox!.cameraForCoordinates(
        [startPoint!.toJson(), endPoint!.toJson()],
        MbxEdgeInsets(top: 80, left: 80, bottom: 80, right: 80),
        null,
        null);
    await mapBox!.flyTo(camera, null);

    if (await mapBox!.style.styleSourceExists("source")) {
      await mapBox!.style.removeStyleLayer("layer");
      await mapBox!.style.removeStyleSource("source");
    }

    var start = startPoint!.coordinates;
    var end = endPoint!.coordinates;

    var resultCoordinates = await _fetchRoutesCoordinates.execute(start, end);

    emit(
      resultCoordinates.fold(
        (failure) => state.copyWith(
            status: DeliveryStateStatus.failed, failure: failure),
        (data) => state.copyWith(
            deliveryData: data, status: DeliveryStateStatus.mapCreated),
      ),
    );
  }

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

  void drawRouteLowLevel(
      List<Position> polyline, TickerProvider tickerProvider) async {
    final line = LineString(coordinates: polyline);
    mapBox!.style.styleSourceExists("source").then((exists) async {
      if (exists) {
        // if source exists - just update it
        final source = await mapBox!.style.getSource("source");
        (source as GeoJsonSource).updateGeoJSON(json.encode(line));
      } else {
        await mapBox!.style.addSource(GeoJsonSource(
            id: "source", data: json.encode(line), lineMetrics: true));

        await mapBox!.style.addLayer(LineLayer(
          id: 'layer',
          sourceId: 'source',
          lineCap: LineCap.ROUND,
          lineJoin: LineJoin.ROUND,
          lineBlur: 1.0,
          lineColor: AppColors.primaryColor.value,
          lineWidth: 5.0,
        ));
      }

      // query line layer
      final lineLayer = await mapBox!.style.getLayer('layer') as LineLayer;

      // animate layer to reveal it from start to end
      controller?.stop();
      controller = AnimationController(
          duration: const Duration(seconds: 2), vsync: tickerProvider);
      animation = Tween<double>(begin: 0, end: 1.0).animate(controller!)
        ..addListener(() async {
          // set the animated value of lineTrim and update the layer
          lineLayer.lineTrimOffset = [animation?.value, 1.0];
          mapBox!.style.updateLayer(lineLayer);
        });
      controller?.forward();
    });
  }
}
