part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
}

final class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WeatherLoadedState extends WeatherState{
   final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
  @override
  // TODO: implement props
  List<Object?> get props => [weatherModel];
}

class WeatherErrorState extends WeatherState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
