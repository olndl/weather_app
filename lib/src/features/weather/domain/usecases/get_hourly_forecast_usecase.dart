import 'package:weather_app/src/core/usecases/usecase.dart';
import 'package:weather_app/src/features/weather/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';

class GetHourlyForecastUseCase implements UseCase<HourlyForecast, String> {
  final WeatherRepository _weatherRepository;

  GetHourlyForecastUseCase(this._weatherRepository);

  @override
  Future<HourlyForecast> call({required String params}) {
    return _weatherRepository.getHourlyForecastAtTheCity(params);
  }
}
