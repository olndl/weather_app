import 'package:weather_app/src/core/api/dio_consumer.dart';
import 'package:weather_app/src/core/constants/endpoints.dart';
import 'package:weather_app/src/features/weather/data/datasource/weather_datasource.dart';
import 'package:weather_app/src/features/weather/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/weather/domain/models/weather.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  DioConsumer dioConsumer;

  WeatherDatasourceImpl({
    required this.dioConsumer,
  });

  @override
  Future<Weather> getWeatherAtTheCity(String? city) async {
    final weather = await dioConsumer.get(
      Endpoints.weather,
      queryParameters: Endpoints.paramsRu,
    );
    return Weather.fromJson(weather);
  }

  @override
  Future<HourlyForecast> getHourlyForecastAtTheCity(String? city) async {
    final hourlyForecast = await dioConsumer.get(
      Endpoints.forecast,
      queryParameters: Endpoints.paramsRu,
    );
    return HourlyForecast.fromJson(hourlyForecast);
  }
}
