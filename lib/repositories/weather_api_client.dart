import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'http://api.openweathermap.org/data/2.5';
  final http.Client httpClient;

  WeatherApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<int> getLocationByCity(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting weather for city $city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    //return (locationJson.first)['woeid'];
    print(locationJson);
    return 1;
  }
}
