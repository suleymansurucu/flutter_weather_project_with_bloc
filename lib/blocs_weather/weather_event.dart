part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent{
  final String cityName;
  FetchWeatherEvent({required this.cityName});

  @override
  // TODO: implement props
  List<Object?> get props => [cityName];

}
