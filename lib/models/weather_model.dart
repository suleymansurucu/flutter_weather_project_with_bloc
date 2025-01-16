import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  Location? location;
  Current? current;

  WeatherModel({
    this.location,
    this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    location: json["location"] == null
        ? null
        : Location.fromJson(json["location"]),
    current:
    json["current"] == null ? null : Current.fromJson(json["current"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "current": current?.toJson(),
  };
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  double? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  double? humidity;
  double? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? uv;
  Map<String, double>? airQuality;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.uv,
    this.airQuality,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdatedEpoch: (json["last_updated_epoch"] as num?)?.toInt(),
    lastUpdated: json["last_updated"],
    tempC: (json["temp_c"] as num?)?.toDouble(),
    isDay: json["is_day"],
    condition: json["condition"] == null
        ? null
        : Condition.fromJson(json["condition"]),
    windMph: (json["wind_mph"] as num?)?.toDouble(),
    windKph: (json["wind_kph"] as num?)?.toDouble(),
    windDegree: (json["wind_degree"] as num?)?.toDouble(),
    windDir: json["wind_dir"],
    pressureMb: (json["pressure_mb"] as num?)?.toDouble(),
    pressureIn: (json["pressure_in"] as num?)?.toDouble(),
    precipMm: (json["precip_mm"] as num?)?.toDouble(),
    precipIn: (json["precip_in"] as num?)?.toDouble(),
    humidity: (json["humidity"] as num?)?.toDouble(),
    cloud: (json["cloud"] as num?)?.toDouble(),
    feelslikeC: (json["feelslike_c"] as num?)?.toDouble(),
    feelslikeF: (json["feelslike_f"] as num?)?.toDouble(),
    windchillC: (json["windchill_c"] as num?)?.toDouble(),
    windchillF: (json["windchill_f"] as num?)?.toDouble(),
    heatindexC: (json["heatindex_c"] as num?)?.toDouble(),
    heatindexF: (json["heatindex_f"] as num?)?.toDouble(),
    uv: (json["uv"] as num?)?.toDouble(),
    airQuality: json["air_quality"] == null
        ? null
        : Map.from(json["air_quality"])
        .map((k, v) => MapEntry<String, double>(k, (v as num).toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "last_updated_epoch": lastUpdatedEpoch,
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "is_day": isDay,
    "condition": condition?.toJson(),
    "wind_mph": windMph,
    "wind_kph": windKph,
    "wind_degree": windDegree,
    "wind_dir": windDir,
    "pressure_mb": pressureMb,
    "pressure_in": pressureIn,
    "precip_mm": precipMm,
    "precip_in": precipIn,
    "humidity": humidity,
    "cloud": cloud,
    "feelslike_c": feelslikeC,
    "feelslike_f": feelslikeF,
    "windchill_c": windchillC,
    "windchill_f": windchillF,
    "heatindex_c": heatindexC,
    "heatindex_f": heatindexF,
    "uv": uv,
    "air_quality": airQuality == null
        ? null
        : Map.from(airQuality!)
        .map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
    icon: json["icon"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
    "code": code,
  };
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  double? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    lat: (json["lat"] as num?)?.toDouble(),
    lon: (json["lon"] as num?)?.toDouble(),
    tzId: json["tz_id"],
    localtimeEpoch: (json["localtime_epoch"] as num?)?.toDouble(),
    localtime: json["localtime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "tz_id": tzId,
    "localtime_epoch": localtimeEpoch,
    "localtime": localtime,
  };
}
