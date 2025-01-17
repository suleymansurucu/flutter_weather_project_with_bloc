// This file is part of 'weather_bloc.dart'
part of 'weather_bloc.dart';

// Abstract base class for all weather-related states
sealed class WeatherState extends Equatable {
  const WeatherState();
}

// Initial state when the app starts or no action has been taken yet
class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

// Loading state when fetching weather data from the API
class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

// Loaded state when weather data is successfully retrieved
class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  // Constructor to initialize the weather model (required parameter)
  const WeatherLoadedState({required this.weatherModel});

  @override
  // Ensures that states are compared based on the weather model
  List<Object?> get props => [weatherModel];
}

// Error state when an error occurs while fetching weather data
class WeatherErrorState extends WeatherState {
  final String errorMessage;

  // Constructor to initialize the error message (required parameter)
  const WeatherErrorState({required this.errorMessage});

  @override
  // Ensures that states are compared based on the error message
  List<Object?> get props => [errorMessage];
}
