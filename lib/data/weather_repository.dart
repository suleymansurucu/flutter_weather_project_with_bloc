import 'package:flutter_weather_with_bloc/data/weather_api_client.dart';
import 'package:flutter_weather_with_bloc/models/weather_model.dart';

import '../locator.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<WeatherModel> getWeather(String city) async {
    final int cityID = await weatherApiClient.getLocationID(city);
    return await weatherApiClient.getWeather(cityID);

  }
}
