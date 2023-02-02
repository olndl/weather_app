import 'package:weather_app/src/features/weather/domain/models/weather.dart';

abstract class WeatherDatasource {
  Future<Weather> getWeatherAtTheCity(String? city);
}
