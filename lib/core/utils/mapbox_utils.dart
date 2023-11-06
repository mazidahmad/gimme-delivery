import 'dart:convert';

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:turf/polyline.dart';

class MapboxUtils {
  static const String MAPBOX_DIRECTIONS_ENDPOINT =
      "https://api.mapbox.com/directions/v5/mapbox/driving/";

  static Future<List<Position>> fetchRouteCoordinates(
      Position start, Position end, String accessToken) async {
    final response = await fetchDirectionRoute(start, end, accessToken);
    Map<String, dynamic> route = jsonDecode(response.body);
    return Polyline.decode(route['routes'][0]['geometry']);
  }

  static Future<http.Response> fetchDirectionRoute(
      Position start, Position end, String accessToken) async {
    final uri = Uri.parse(
        "$MAPBOX_DIRECTIONS_ENDPOINT${start.lng},${start.lat};${end.lng},${end.lat}?overview=full&access_token=$accessToken");
    return http.get(uri);
  }
}
