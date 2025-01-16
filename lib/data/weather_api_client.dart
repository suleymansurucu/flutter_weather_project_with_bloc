import 'dart:convert';

import 'package:flutter_weather_with_bloc/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'https://api.weatherapi.com/v1/current.json?key=80d2c3d0a98541dd818225114251501&q=';
  final http.Client httpClient;

  WeatherApiClient({ required this.httpClient});

 /* Future<int> getLocationID(String cityName) async {
    final String cityUrl = '$baseUrl$cityName&aqi=yes';
    final response = await httpClient.get(Uri.parse(cityUrl));

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to fetch location ID. Status code: ${response.statusCode}');
    }

    final List<dynamic> recievedJson = jsonDecode(response.body);

    if (recievedJson.isEmpty) {
      throw Exception('City not found');
    }

    return recievedJson[1]['current']['condition']['code'] as int;
  }*/

  Future<WeatherModel> getWeather({required String cityName}) async {
    final weatherUrl = '$baseUrl$cityName&aqi=yes';
    print(weatherUrl);
    final responseForWeather = await httpClient.get(Uri.parse(weatherUrl));
    if (responseForWeather.statusCode != 200) {
      throw Exception(
          'Failed to fetch WEATHER. Status code: ${responseForWeather.statusCode}');
    }

    final weatherJson=jsonDecode(responseForWeather.body);
    return WeatherModel.fromJson(weatherJson);

  }
}
