import 'package:freezed_annotation/freezed_annotation.dart';

part 'hourly_forecast.freezed.dart';
part 'hourly_forecast.g.dart';

@freezed
class HourlyForecast with _$HourlyForecast {
  const factory HourlyForecast({
    required String cod,
    required int message,
    required int cnt,
    required List<HoursForecastList> list,
    required City? city,
  }) = _HourlyForecast;

  factory HourlyForecast.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    int? id,
    String? name,
    String? country,
    int? population,
    int? timezone,
    int? sunrise,
    int? sunset,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class HoursForecastList with _$HoursForecastList {
  const factory HoursForecastList({
    required int dt,
    required MainInfo main,
    required List<WeatherData> weather,
    required Wind wind,
  }) = _HoursForecastList;

  factory HoursForecastList.fromJson(Map<String, dynamic> json) =>
      _$HoursForecastListFromJson(json);
}

@freezed
class MainInfo with _$MainInfo {
  const factory MainInfo({
    required double temp,
    required int pressure,
    required int humidity,
  }) = _MainInfo;

  factory MainInfo.fromJson(Map<String, dynamic> json) =>
      _$MainInfoFromJson(json);
}

@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    required int id,
    required String main,
    required String description,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
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
