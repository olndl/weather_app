import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/weather/domain/models/weather.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherCubit({
    required this.getWeatherUseCase,
  }) : super(WeatherInitial()) {
    getWeather('a');
  }

  Future<void> getWeather(String city) async {
    try {
      emit(WeatherLoading());
      Weather response = await getWeatherUseCase(params: city);
      emit(
        WeatherLoaded(
          weather: response,
        ),
      );
    } catch (error) {
      WeatherError(msg: error.toString());
    }
  }
}
