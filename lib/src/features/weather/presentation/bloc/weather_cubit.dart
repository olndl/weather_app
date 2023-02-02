import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/weather/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/weather/domain/models/weather.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_hourly_forecast_usecase.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final GetHourlyForecastUseCase getHourlyForecastUseCase;

  WeatherCubit({
    required this.getWeatherUseCase,
    required this.getHourlyForecastUseCase,
  }) : super(WeatherInitial()) {
    getWeatherAndForecast('Moscow');
  }

  Future<void> getWeatherAndForecast(String city) async {
    try {
      emit(WeatherLoading());
      Weather weatherResponse = await getWeatherUseCase(params: city);
      HourlyForecast forecastResponse =
          await getHourlyForecastUseCase(params: city);
      emit(
        WeatherLoaded(
          weather: weatherResponse,
          hourlyForecast: forecastResponse,
        ),
      );
    } catch (error) {
      WeatherError(msg: error.toString());
    }
  }
}
