import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_with_bloc/bloc_thema/thema_bloc.dart';
import 'package:flutter_weather_with_bloc/locator.dart';
import 'package:flutter_weather_with_bloc/widgets/weather_app_widget.dart';

import 'blocs_weather/weather_bloc.dart';

void main() {
  setupLocator();
  runApp(BlocProvider<ThemaBloc>(
    create: (context) => ThemaBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemaBloc, ThemaState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Weather App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme:
                  AppBarTheme(color: (state as ThemaInitial).materialColor),
              textTheme: TextTheme(
                  displayMedium:
                      TextStyle(color: (state as ThemaInitial).materialColor),
                /*  bodyLarge:
                TextStyle(color: (state as ThemaInitial).materialColor),
                bodyMedium:
                TextStyle(color: (state as ThemaInitial).materialColor),
               bodySmall:
                TextStyle(color: (state as ThemaInitial).materialColor),*/

              ),
          ),
          //   (state as ThemaInitial).,

          /*ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),*/
          home: BlocProvider(
            create: (context) => WeatherBloc(),
            child: WeatherApp(),
          ),
        );
      },
    );
  }
}
