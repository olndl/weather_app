import 'package:weather_app/src/core/usecases/usecase.dart';
import 'package:weather_app/src/features/domain/models/air_pollution.dart';
import 'package:weather_app/src/features/domain/repositories/weather_repository.dart';

class GetAirPollutionCoeffUseCase implements UseCase<AirPollution, List<int>> {
  final WeatherRepository _weatherRepository;

  GetAirPollutionCoeffUseCase(this._weatherRepository);

  @override
  Future<AirPollution> call({required List<int> params}) {
    return _weatherRepository.getAqi(params[0], params[1]);
  }
}
