import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/src/core/api/dio_consumer.dart';
import 'package:weather_app/src/features/weather/data/datasource/weather_datasource.dart';
import 'package:weather_app/src/features/weather/data/datasource/weather_datasource_impl.dart';
import 'package:weather_app/src/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_hourly_forecast_usecase.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/src/features/weather/presentation/bloc/weather_cubit.dart';

final injector = GetIt.instance;

Future<void> init() async {
  //! Navigation

  //! Features

  // Blocs

  injector.registerFactory<WeatherCubit>(
    () => WeatherCubit(
      getWeatherUseCase: injector(),
      getHourlyForecastUseCase: injector(),
    ),
  );

  // Use cases
  injector.registerLazySingleton<GetWeatherUseCase>(
    () => GetWeatherUseCase(injector()),
  );
  injector.registerLazySingleton<GetHourlyForecastUseCase>(
    () => GetHourlyForecastUseCase(injector()),
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
