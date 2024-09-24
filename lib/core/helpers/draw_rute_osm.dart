import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OSRMService {
  static const String _baseUrl =
      'http://router.project-osrm.org/route/v1/driving';

  Future<Map<String, dynamic>> getRoute(LatLng start, LatLng end) async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load route');
    }
  }
}
