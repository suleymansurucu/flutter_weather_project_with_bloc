import 'package:flutter_weather_with_bloc/data/weather_api_client.dart';
import 'package:flutter_weather_with_bloc/data/weather_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt locator = GetIt.instance;

void setupLocator() {
  // HTTP Client Bağımlılığı
  locator.registerLazySingleton(() => http.Client());

  // WeatherApiClient Bağımlılığı
  locator.registerLazySingleton(() => WeatherApiClient(httpClient: locator<http.Client>()));

  // WeatherRepository Bağımlılığı
  locator.registerLazySingleton(() => WeatherRepository());
}
