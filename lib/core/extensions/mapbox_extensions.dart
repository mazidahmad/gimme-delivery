import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

extension AnnotationCreation on PointAnnotationManager {
  addAnnotation(Uint8List imageData, Map<String?, Object?>? geometry,
      {String textField = ""}) {
    return create(
      PointAnnotationOptions(
        geometry: geometry,
        textField: textField,
        textOffset: [0.0, 0.0],
        textColor: Colors.red.value,
        iconSize: 2,
        iconOffset: [0.0, 0.0],
        symbolSortKey: 10,
        image: imageData,
      ),
    );
  }
}

extension PuckPosition on StyleManager {
  Future<Position> getPuckPosition() async {
    Layer? layer;
    if (Platform.isAndroid) {
      layer = await getLayer("mapbox-location-indicator-layer");
    } else {
      layer = await getLayer("puck");
    }
    final location = (layer as LocationIndicatorLayer).location;
    return Future.value(Position(location![1]!, location[0]!));
  }
}
