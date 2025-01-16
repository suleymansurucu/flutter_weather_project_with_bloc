import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_with_bloc/data/weather_repository.dart';
import 'package:flutter_weather_with_bloc/locator.dart';
import 'package:flutter_weather_with_bloc/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherEvent>(_onFetchWeather);
    on<RefreshWeatherEvent>(_onRefreshWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try {
      final receivedWeather = await weatherRepository.getWeather(event.cityName);
      emit(WeatherLoadedState(weatherModel: receivedWeather));
    } catch (e) {
      print('Error in _onFetchWeather: $e');
      emit(WeatherErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> _onRefreshWeather(
      RefreshWeatherEvent event, Emitter<WeatherState> emit) async {
    try {
      final receivedWeather = await weatherRepository.getWeather(event.cityName);
      emit(WeatherLoadedState(weatherModel: receivedWeather));
    } catch (e) {
      print('Error in _onRefreshWeather: $e');
      emit(WeatherErrorState(errorMessage: e.toString()));
    }
  }
}
