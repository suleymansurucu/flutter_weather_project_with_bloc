import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_with_bloc/blocs_weather/weather_bloc.dart';
import 'package:flutter_weather_with_bloc/widgets/choose_city.dart';
import 'package:flutter_weather_with_bloc/widgets/last_updated_widget.dart';
import 'package:flutter_weather_with_bloc/widgets/location_widget.dart';
import 'package:flutter_weather_with_bloc/widgets/max_and_min_derece_widget.dart';
import 'package:flutter_weather_with_bloc/widgets/weather_image_widget.dart';

class WeatherApp extends StatelessWidget {
  String choosedCity = 'Ankara';

  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () async {
                choosedCity = await Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  return ChooseCity();
                }));
                if (choosedCity != null) {
                  _weatherBloc.add(FetchWeatherEvent(cityName: choosedCity));
                }
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: _weatherBloc,
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const Text(
                'Please Choose a City',
                style: TextStyle(fontSize: 18),
              );
            } else if (state is WeatherLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is WeatherLoadedState) {
              final reciviedWeather =state.weatherModel;
              reciviedWeather.consolidatedWeather[0].id;
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                children: [
                  Center(
                    child: LocationWidget(choosedCity: choosedCity),
                  ),
                  const SizedBox(height: 16),
                  const Center(child: LastUpdatedWidget()),
                  const SizedBox(height: 16),
                  const Center(child: WeatherImageWidget()),
                  const SizedBox(height: 16),
                  const Center(child: MaxAndMinDereceWidget()),
                ],
              );
            } else if (state is WeatherErrorState) {
              return const Text(
                'An error occurred. Please try again.',
                style: TextStyle(fontSize: 18, color: Colors.red),
                textAlign: TextAlign.center,
              );
            }

            // Default durum, hiçbir state'e uymadığında boş bir widget döndür.
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
