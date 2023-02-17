import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/domain/models/air_pollution.dart';
import 'package:weather_app/src/features/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/domain/models/weather.dart';

class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final Weather _weather;
  final HourlyForecast _forecast;
  final AirPollution _airPollution;

  WeatherIsLoaded(this._weather, this._forecast, this._airPollution);

  Weather get getWeather => _weather;
  HourlyForecast get getForecast => _forecast;
  AirPollution get getAirPollution => _airPollution;

  @override
  List<Object> get props => [_weather, _forecast, _airPollution];
}

class WeatherIsNotLoaded extends WeatherState {
  final String msg;

  WeatherIsNotLoaded({required this.msg});

  String get getError => msg;

  @override
  List<Object> get props => [msg];
}
