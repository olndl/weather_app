part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded({
    required this.weather,
  });

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  final String msg;
  const WeatherError({required this.msg});

  @override
  List<Object> get props => [msg];
}
