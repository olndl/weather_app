import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/widgets/loading_page.dart';
import 'package:weather_app/src/core/widgets/error_page.dart';
import 'package:weather_app/src/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/src/features/presentation/bloc/weather_state.dart';
import 'package:weather_app/src/features/presentation/weather/pages/search_page.dart';
import 'package:weather_app/src/features/presentation/forecast/components/forecast_page_body.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (BuildContext context, WeatherState state) {
        if (state is WeatherIsNotSearched) {
          return const SearchPage();
        } else if (state is WeatherIsLoading) {
          return const LoadingPage();
        } else if (state is WeatherIsLoaded) {
          return ForecastPageBody(forecastAll: state.getForecast);
        } else if (state is WeatherIsNotLoaded) {
          return ErrorPage(
            errorMsg: state.getError,
          );
        } else {
          return const ErrorPage(errorMsg: 'Oops!');
        }
      },
    );
  }
}
