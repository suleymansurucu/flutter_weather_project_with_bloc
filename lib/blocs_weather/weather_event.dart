part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent {
  final String cityName;
  const FetchWeatherEvent({required this.cityName});

  @override
  List<Object?> get props => [cityName];
}

class RefreshWeatherEvent extends WeatherEvent {
  final String cityName;
  const RefreshWeatherEvent({required this.cityName});

  @override
  List<Object?> get props => [cityName];
}
