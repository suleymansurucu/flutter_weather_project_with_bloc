part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  const WeatherLoadedState({required this.weatherModel});

  @override
  List<Object?> get props => [weatherModel];
}

class WeatherErrorState extends WeatherState {
  final String errorMessage;
  const WeatherErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
