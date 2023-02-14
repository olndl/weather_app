import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/src/core/api/dio_consumer.dart';
import 'package:weather_app/src/features/data/datasource/weather_datasource.dart';
import 'package:weather_app/src/features/data/datasource/weather_datasource_impl.dart';
import 'package:weather_app/src/features/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/src/features/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/features/domain/usecases/get_hourly_forecast_usecase.dart';
import 'package:weather_app/src/features/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/src/features/domain/usecases/gey_air_pollution_coeff_usecase.dart';
import 'package:weather_app/src/features/presentation/bloc/weather_bloc.dart';

final injector = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs

  injector.registerFactory<WeatherBloc>(
    () => WeatherBloc(
      getWeatherUseCase: injector(),
      getHourlyForecastUseCase: injector(),
      getAirPollutionCoeffUseCase: injector(),
    ),
  );

  // Use cases
  injector.registerLazySingleton<GetWeatherUseCase>(
    () => GetWeatherUseCase(injector()),
  );
  injector.registerLazySingleton<GetHourlyForecastUseCase>(
    () => GetHourlyForecastUseCase(injector()),
  );

  injector.registerLazySingleton<GetAirPollutionCoeffUseCase>(
    () => GetAirPollutionCoeffUseCase(injector()),
  );

  // Repository
  injector.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(injector()),
  );

  // Data Sources
  injector.registerLazySingleton<WeatherDatasource>(
    () => WeatherDatasourceImpl(dioConsumer: injector()),
  );

  //! Core
  injector.registerLazySingleton(
    () => DioConsumer(),
  );

  //! External
  injector.registerLazySingleton(() => Dio());
}
