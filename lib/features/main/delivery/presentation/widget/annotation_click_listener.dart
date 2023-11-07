import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MerchantClickListener extends OnPointAnnotationClickListener {
  final void Function(PointAnnotation annotation) onClickAnnotation;

  MerchantClickListener({required this.onClickAnnotation});

  @override
  void onPointAnnotationClick(PointAnnotation annotation) async {
    onClickAnnotation.call(annotation);
  }
}
