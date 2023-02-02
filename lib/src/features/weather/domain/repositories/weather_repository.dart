import 'package:weather_app/src/features/weather/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/weather/domain/models/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeatherAtTheCity(String? city);
  Future<HourlyForecast> getHourlyForecastAtTheCity(String? city);
}
