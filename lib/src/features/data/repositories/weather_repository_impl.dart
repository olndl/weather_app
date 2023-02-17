import 'package:weather_app/src/features/domain/models/air_pollution.dart';
import 'package:weather_app/src/features/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/domain/models/weather.dart';
import 'package:weather_app/src/features/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/features/data/datasource/weather_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatasource weatherDatasource;

  const WeatherRepositoryImpl(this.weatherDatasource);

  @override
  Future<Weather> getWeatherAtTheCity(String? city) async {
    final weather = await weatherDatasource.getWeatherAtTheCity(city);
    return weather;
  }

  @override
  Future<HourlyForecast> getHourlyForecastAtTheCity(String? city) async {
    final hourlyForecast =
        await weatherDatasource.getHourlyForecastAtTheCity(city);
    return hourlyForecast;
  }

  @override
  Future<AirPollution> getAqi(int lon, int lat) async {
    final aqi = await weatherDatasource.getAqi(lon, lat);
    return aqi;
  }
}
