import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/widgets/error_page.dart';
import 'package:weather_app/src/core/widgets/loading_page.dart';
import 'package:weather_app/src/features/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/src/features/presentation/bloc/weather_state.dart';
import 'package:weather_app/src/features/presentation/weather/components/details_page_body.dart';
import 'package:weather_app/src/features/presentation/weather/pages/search_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherIsNotSearched) {
          return const SearchPage();
        } else if (state is WeatherIsLoading) {
          return const LoadingPage();
        } else if (state is WeatherIsLoaded) {
          return DetailsPageBody(
              weather: state.getWeather,
              forecast: state.getForecast,
              airPollution: state.getAirPollution);
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
