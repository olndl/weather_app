import 'package:weather_app/src/core/usecases/usecase.dart';
import 'package:weather_app/src/features/domain/models/weather.dart';
import 'package:weather_app/src/features/domain/repositories/weather_repository.dart';

class GetWeatherUseCase implements UseCase<Weather, String> {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase(this._weatherRepository);

  @override
  Future<Weather> call({required String params}) {
    return _weatherRepository.getWeatherAtTheCity(params);
  }
}
