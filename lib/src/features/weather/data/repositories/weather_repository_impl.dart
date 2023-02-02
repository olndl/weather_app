import 'package:weather_app/src/features/weather/data/datasource/weather_datasource.dart';
import 'package:weather_app/src/features/weather/domain/models/weather.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatasource weatherDatasource;

  const WeatherRepositoryImpl(this.weatherDatasource);

  @override
  Future<Weather> getWeatherAtTheCity(String? city) async {
    final weather = await weatherDatasource.getWeatherAtTheCity(city);
    return weather;
  }
}
