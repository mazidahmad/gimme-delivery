import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gimme_delivery/core/config/env.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/core/utils/mapbox_utils.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class AnnotationClickListener extends OnPointAnnotationClickListener {
  final MapboxMap mapBox;
  final TickerProvider tickerProvider;
  final Position startPosition;

  Animation<double>? animation;
  AnimationController? controller;

  AnnotationClickListener(
      {required this.mapBox,
      required this.startPosition,
      required this.tickerProvider});

  @override
  void onPointAnnotationClick(PointAnnotation annotation) async {
    if (await mapBox.style.styleSourceExists("source")) {
      await mapBox.style.removeStyleLayer("layer");
      await mapBox.style.removeStyleSource("source");
    }

    // build route from puck position to the clicked annotation
    final start = startPosition;
    final end = Point.fromJson((annotation.geometry)!.cast());

    final coordinates = await MapboxUtils.fetchRouteCoordinates(
        start, end.coordinates, Env.mapBoxToken);

    drawRouteLowLevel(coordinates);
  }

  drawRouteLowLevel(List<Position> polyline) async {
    final line = LineString(coordinates: polyline);
    mapBox.style.styleSourceExists("source").then((exists) async {
      if (exists) {
        // if source exists - just update it
        final source = await mapBox.style.getSource("source");
        (source as GeoJsonSource).updateGeoJSON(json.encode(line));
      } else {
        await mapBox.style.addSource(GeoJsonSource(
            id: "source", data: json.encode(line), lineMetrics: true));

        await mapBox.style.addLayer(LineLayer(
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
      final lineLayer = await mapBox.style.getLayer('layer') as LineLayer;

      // animate layer to reveal it from start to end
      controller?.stop();
      controller = AnimationController(
          duration: const Duration(seconds: 2), vsync: tickerProvider);
      animation = Tween<double>(begin: 0, end: 1.0).animate(controller!)
        ..addListener(() async {
          // set the animated value of lineTrim and update the layer
          lineLayer.lineTrimOffset = [animation?.value, 1.0];
          mapBox.style.updateLayer(lineLayer);
        });
      controller?.forward();
    });
  }
}

class MerchantClickListener extends OnPointAnnotationClickListener {
  final void Function(PointAnnotation annotation) onClickAnnotation;

  MerchantClickListener({required this.onClickAnnotation});

  @override
  void onPointAnnotationClick(PointAnnotation annotation) async {
    onClickAnnotation.call(annotation);
  }
}
