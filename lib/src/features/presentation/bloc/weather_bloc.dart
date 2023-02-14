import 'package:weather_app/src/core/errors/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/domain/usecases/get_hourly_forecast_usecase.dart';
import 'package:weather_app/src/features/domain/usecases/gey_air_pollution_coeff_usecase.dart';
import 'package:weather_app/src/features/presentation/bloc/weather_event.dart';
import 'package:weather_app/src/features/presentation/bloc/weather_state.dart';
import 'package:weather_app/src/features/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/src/features/domain/models/air_pollution.dart';
import 'package:weather_app/src/features/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/domain/models/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final GetHourlyForecastUseCase getHourlyForecastUseCase;
  final GetAirPollutionCoeffUseCase getAirPollutionCoeffUseCase;

  WeatherBloc({
    required this.getWeatherUseCase,
    required this.getHourlyForecastUseCase,
    required this.getAirPollutionCoeffUseCase,
  }) : super(WeatherIsNotSearched());

  WeatherState get initialState => WeatherIsNotSearched();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherIsLoading();

      try {
        Weather weather = await getWeatherUseCase(params: event.city);
        HourlyForecast forecast =
            await getHourlyForecastUseCase(params: event.city);
        AirPollution airPollution = await getAirPollutionCoeffUseCase(
            params: [weather.coord!.lon.round(), weather.coord!.lat.round()]);
        yield WeatherIsLoaded(weather, forecast, airPollution);
      } catch (error, stack) {
        logger.info(error);
        logger.info(stack);
        yield WeatherIsNotLoaded(msg: error.toString());
      }
    } else if (event is ResetWeather) {
      yield WeatherIsNotSearched();
    }
  }
}
