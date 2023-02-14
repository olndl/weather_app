import 'package:weather_app/src/features/domain/models/air_pollution.dart';
import 'package:weather_app/src/features/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/domain/models/weather.dart';

abstract class WeatherDatasource {
  Future<Weather> getWeatherAtTheCity(String? city);
  Future<HourlyForecast> getHourlyForecastAtTheCity(String? city);
  Future<AirPollution> getAqi(int lon, int lat);
}
