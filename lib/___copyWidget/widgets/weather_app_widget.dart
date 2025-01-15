import 'package:flutter/material.dart';
import 'package:flutter_weather_with_bloc/widgets/choose_city.dart';
import 'package:flutter_weather_with_bloc/widgets/last_updated_widget.dart';
import 'package:flutter_weather_with_bloc/widgets/location_widget.dart';
import 'package:flutter_weather_with_bloc/widgets/max_and_min_derece_widget.dart';
import 'package:flutter_weather_with_bloc/widgets/weather_image_widget.dart';

class WeatherApp extends StatelessWidget {
   String choosedCity= 'Ankara';
   WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () async {
               choosedCity = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChooseCity();
                }));
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: LocationWidget(choosedCity: choosedCity,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: LastUpdatedWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: WeatherImageWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: MaxAndMinDereceWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
