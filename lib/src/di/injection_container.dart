import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/src/core/api/dio_consumer.dart';
import 'package:weather_app/src/features/weather/bloc/weather_cubit.dart';
import 'package:weather_app/src/features/weather/data/datasource/weather_datasource.dart';
import 'package:weather_app/src/features/weather/data/datasource/weather_datasource_impl.dart';
import 'package:weather_app/src/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_weather_usecase.dart';

final injector = GetIt.instance;

Future<void> init() async {
  //! Navigation

  //! Features

  // Blocs

  injector.registerFactory<WeatherCubit>(
    () => WeatherCubit(
      getWeatherUseCase: injector(),
    ),
  );

  // Use cases
  injector.registerLazySingleton<GetWeatherUseCase>(
    () => GetWeatherUseCase(injector()),
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
