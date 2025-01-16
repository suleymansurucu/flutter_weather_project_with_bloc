import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_with_bloc/blocs_weather/weather_bloc.dart';

class LastUpdatedWidget extends StatelessWidget {
  const LastUpdatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        var weatherModelLastUpdated=(state as WeatherLoadedState).weatherModel.current?.lastUpdated.toString();


        return Text(
          'Last update : ' +weatherModelLastUpdated!,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),);
      },
    );
  }
}
