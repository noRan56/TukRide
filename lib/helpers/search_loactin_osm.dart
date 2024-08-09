import 'dart:convert';
import 'package:http/http.dart' as http;

class NominatimService {
  static const String _baseUrl = 'https://nominatim.openstreetmap.org/search';

  Future<List<Map<String, dynamic>>> searchPlaces(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=$query&format=json&addressdetails=1'),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((place) {
        return {
          'display_name': place['display_name'],
          'lat': double.parse(place['lat']),
          'lon': double.parse(place['lon']),
        };
      }).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }
}
