import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_with_bloc/bloc_thema/thema_bloc.dart';
import 'package:flutter_weather_with_bloc/blocs_weather/weather_bloc.dart';
import 'package:flutter_weather_with_bloc/widgets/choose_city.dart';
import 'package:flutter_weather_with_bloc/widgets/last_updated_widget.dart';
import 'package:flutter_weather_with_bloc/widgets/location_widget.dart';
import 'package:flutter_weather_with_bloc/widgets/max_and_min_derece_widget.dart';
import 'package:flutter_weather_with_bloc/widgets/transparent_background_color.dart';
import 'package:flutter_weather_with_bloc/widgets/weather_image_widget.dart';

class WeatherApp extends StatelessWidget {
  String choosedCity = 'Ankara';
  Completer<void> _refreshCompleter = Completer<void>();

  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () async {
              final selectedCity = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChooseCity()),
              );
              if (selectedCity != null && selectedCity.isNotEmpty) {
                choosedCity = selectedCity;
                _weatherBloc.add(FetchWeatherEvent(cityName: choosedCity));
              }
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const Center(child: Text('Please Choose a City'));
          } else if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoadedState) {
            _refreshCompleter.complete();
            _refreshCompleter = Completer();
            choosedCity = state.weatherModel.location!.name!;
            final receivedWeather = state.weatherModel;
            final cityName = receivedWeather.location?.name ?? 'Ankara';

            final _weatherCode = receivedWeather.current?.condition?.code;

            BlocProvider.of<ThemaBloc>(context).add(
                ChangeThemeEvent(weatherCode: _weatherCode!));
            return BlocBuilder<ThemaBloc, ThemaState>(
              builder: (context, state) {
                return TransparentBackgroundColor(
                  color:(state as ThemaInitial).materialColor,
                  child: RefreshIndicator(
                    onRefresh: () {
                      _weatherBloc.add(RefreshWeatherEvent(cityName: cityName));
                      return _refreshCompleter.future;
                    },
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        Center(child: LocationWidget(choosedCity: cityName)),
                        const SizedBox(height: 16),
                        const Center(child: LastUpdatedWidget()),
                        const SizedBox(height: 16),
                        Center(child: WeatherImageWidget()),
                        const SizedBox(height: 16),
                        const Center(child: MaxAndMinDereceWidget()),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is WeatherErrorState) {
            return Center(
              child: Text(
                'Error: ${state.errorMessage}',
                style: const TextStyle(fontSize: 18, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
