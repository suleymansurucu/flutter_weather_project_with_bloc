// This file is part of 'weather_bloc.dart'
part of 'weather_bloc.dart';

// Abstract base class for all weather-related events
sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}

// Event to fetch weather data for a given city
class FetchWeatherEvent extends WeatherEvent {
  final String cityName;

  // Constructor to initialize the city name (required parameter)
  const FetchWeatherEvent({required this.cityName});

  @override
  // Ensures that events are compared based on the city name
  List<Object?> get props => [cityName];
}

// Event to refresh weather data for a given city
class RefreshWeatherEvent extends WeatherEvent {
  final String cityName;

  // Constructor to initialize the city name (required parameter)
  const RefreshWeatherEvent({required this.cityName});

  @override
  // Ensures that events are compared based on the city name
  List<Object?> get props => [cityName];
}
