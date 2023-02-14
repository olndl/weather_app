import 'dart:io';
import 'package:weather_app/src/features/data/datasource/weather_datasource.dart';
import 'package:weather_app/src/app/app_secrets.dart';
import 'package:weather_app/src/core/api/dio_consumer.dart';
import 'package:weather_app/src/core/constants/endpoints.dart';
import 'package:weather_app/src/features/domain/models/air_pollution.dart';
import 'package:weather_app/src/features/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/domain/models/weather.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  DioConsumer dioConsumer;

  WeatherDatasourceImpl({
    required this.dioConsumer,
  });

  @override
  Future<Weather> getWeatherAtTheCity(String? city) async {
    final weather = await dioConsumer.get(
      Endpoints.weather,
      queryParameters: {
        'q': city,
        'lang': Platform.localeName.substring(0, 2),
        'units': 'metric',
        'appid': AppSecrets.apiKey
      },
    );
    return Weather.fromJson(weather);
  }

  @override
  Future<HourlyForecast> getHourlyForecastAtTheCity(String? city) async {
    final hourlyForecast = await dioConsumer.get(
      Endpoints.forecast,
      queryParameters: {
        'q': city,
        'lang': Platform.localeName.substring(0, 2),
        'units': 'metric',
        'appid': AppSecrets.apiKey
      },
    );
    return HourlyForecast.fromJson(hourlyForecast);
  }

  @override
  Future<AirPollution> getAqi(int lon, int lat) async {
    final aqi = await dioConsumer.get(
      Endpoints.aqi,
      queryParameters: {'lat': lat, 'lon': lon, 'appid': AppSecrets.apiKey},
    );
    return AirPollution.fromJson(aqi);
  }
}
