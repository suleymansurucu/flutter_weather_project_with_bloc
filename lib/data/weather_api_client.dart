import 'dart:convert';

import 'package:flutter_weather_with_bloc/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherApiClient({ required this.httpClient});

  Future<int> getLocationID(String cityName) async {
    final String cityUrl = '$baseUrl/api/location/search/?query=$cityName';
    final response = await httpClient.get(Uri.parse(cityUrl));

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to fetch location ID. Status code: ${response.statusCode}');
    }

    final List<dynamic> recievedJson = jsonDecode(response.body);

    if (recievedJson.isEmpty) {
      throw Exception('City not found');
    }

    return recievedJson[0]['woeid'] as int;
  }

  Future<WeatherModel> getWeather(int cityID) async {
    final weatherUrl = baseUrl + '/api/location/$cityID';
    final responseForWeather = await httpClient.get(Uri.parse(weatherUrl));
    if (responseForWeather.statusCode != 200) {
      throw Exception(
          'Failed to fetch WEATHER. Status code: ${responseForWeather.statusCode}');
    }

    final weatherJson=jsonDecode(responseForWeather.body);
    return WeatherModel.fromJson(weatherJson);

  }
}
