import 'dart:convert';

WeatherModel weatherFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  final List<ConsolidatedWeather> consolidatedWeather;
  final DateTime time;
  final DateTime sunRise;
  final DateTime sunSet;
  final String timezoneName;
  final Parent parent;
  final List<dynamic> sources;
  final String title;
  final String locationType;
  final int woeid;
  final String lattLong;
  final String timezone;

  WeatherModel({
    required this.consolidatedWeather,
    required this.time,
    required this.sunRise,
    required this.sunSet,
    required this.timezoneName,
    required this.parent,
    required this.sources,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
    required this.timezone,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      consolidatedWeather: (json['consolidated_weather'] as List)
          .map((x) => ConsolidatedWeather.fromJson(x))
          .toList(),
      time: DateTime.parse(json['time']),
      sunRise: DateTime.parse(json['sun_rise']),
      sunSet: DateTime.parse(json['sun_set']),
      timezoneName: json['timezone_name'],
      parent: Parent.fromJson(json['parent']),
      sources: json['sources'],
      title: json['title'],
      locationType: json['location_type'],
      woeid: json['woeid'],
      lattLong: json['latt_long'],
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'consolidated_weather':
      consolidatedWeather.map((x) => x.toJson()).toList(),
      'time': time.toIso8601String(),
      'sun_rise': sunRise.toIso8601String(),
      'sun_set': sunSet.toIso8601String(),
      'timezone_name': timezoneName,
      'parent': parent.toJson(),
      'sources': sources,
      'title': title,
      'location_type': locationType,
      'woeid': woeid,
      'latt_long': lattLong,
      'timezone': timezone,
    };
  }
}

class ConsolidatedWeather {
  final int id;
  final String weatherStateName;
  final String weatherStateAbbr;
  final String windDirectionCompass;
  final DateTime created;
  final DateTime applicableDate;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final double windSpeed;
  final double windDirection;
  final double airPressure;
  final int humidity;
  final double visibility;
  final int predictability;

  ConsolidatedWeather({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
    return ConsolidatedWeather(
      id: json['id'],
      weatherStateName: json['weather_state_name'],
      weatherStateAbbr: json['weather_state_abbr'],
      windDirectionCompass: json['wind_direction_compass'],
      created: DateTime.parse(json['created']),
      applicableDate: DateTime.parse(json['applicable_date']),
      minTemp: json['min_temp'].toDouble(),
      maxTemp: json['max_temp'].toDouble(),
      theTemp: json['the_temp'].toDouble(),
      windSpeed: json['wind_speed'].toDouble(),
      windDirection: json['wind_direction'].toDouble(),
      airPressure: json['air_pressure'].toDouble(),
      humidity: json['humidity'],
      visibility: json['visibility'].toDouble(),
      predictability: json['predictability'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'weather_state_name': weatherStateName,
      'weather_state_abbr': weatherStateAbbr,
      'wind_direction_compass': windDirectionCompass,
      'created': created.toIso8601String(),
      'applicable_date': applicableDate.toIso8601String(),
      'min_temp': minTemp,
      'max_temp': maxTemp,
      'the_temp': theTemp,
      'wind_speed': windSpeed,
      'wind_direction': windDirection,
      'air_pressure': airPressure,
      'humidity': humidity,
      'visibility': visibility,
      'predictability': predictability,
    };
  }
}

class Parent {
  final String title;
  final String locationType;
  final int woeid;
  final String lattLong;

  Parent({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      title: json['title'],
      locationType: json['location_type'],
      woeid: json['woeid'],
      lattLong: json['latt_long'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'location_type': locationType,
      'woeid': woeid,
      'latt_long': lattLong,
    };
  }
}
