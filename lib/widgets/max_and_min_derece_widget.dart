import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs_weather/weather_bloc.dart';

class MaxAndMinDereceWidget extends StatelessWidget {
  const MaxAndMinDereceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: Text('Today is : ${(state as WeatherLoadedState).weatherModel.current!.condition!.text}', style: TextStyle(fontSize: 19),)),
            Text('Feels Like : ${(state as WeatherLoadedState).weatherModel.current!.feelslikeC!} C°', style: TextStyle(fontSize: 19),),
          ],
        );
      },
    );
  }
}
