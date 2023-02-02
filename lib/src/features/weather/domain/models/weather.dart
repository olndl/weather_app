// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required Coord coord,
    required List<WeatherElement> weather,
    required String base,
    required Main main,
    required int visibility,
    required Wind wind,
    required Clouds clouds,
    required int dt,
    required Sys sys,
    required int timezone,
    required int id,
    required String name,
    required int cod,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class Clouds with _$Clouds {
  const factory Clouds({
    required int all,
  }) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Coord with _$Coord {
  const factory Coord({
    required double lon,
    required double lat,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@freezed
class Main with _$Main {
  const factory Main({
    required double temp,
    @JsonKey(name: 'feels_like') required double feelsLike,
    @JsonKey(name: 'temp_min') required double tempMin,
    @JsonKey(name: 'temp_max') required double tempMax,
    required int pressure,
    required int humidity,
    @JsonKey(name: 'sea_level') required int seaLevel,
    @JsonKey(name: 'grnd_level') required int grndLevel,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Sys with _$Sys {
  const factory Sys({
    required int type,
    required int id,
    required String country,
    required int sunrise,
    required int sunset,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
class WeatherElement with _$WeatherElement {
  const factory WeatherElement({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherElement;

  factory WeatherElement.fromJson(Map<String, dynamic> json) =>
      _$WeatherElementFromJson(json);
}

@freezed
class Wind with _$Wind {
  const factory Wind({
    required double speed,
    required int deg,
    required double gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
