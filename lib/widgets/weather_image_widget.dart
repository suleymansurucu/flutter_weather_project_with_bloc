import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_with_bloc/models/weather_model.dart';

import '../blocs_weather/weather_bloc.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        var responseIconUrl =
            (state as WeatherLoadedState).weatherModel.current!.condition?.icon;
        var newResponseIconUrl = 'https:$responseIconUrl';
        print('My Icon url is $newResponseIconUrl');

        return Column(
          children: [
            Text('Temperature: '+(state as WeatherLoadedState).weatherModel.current!.tempC!.floor().toString()+'C°', style: TextStyle(fontSize: 30),),
            Image.network(
              newResponseIconUrl,
              width: 150,
              height: 150,
              fit: BoxFit.fitWidth,
            ),
          ],
        );
      },
    );
  }
}
