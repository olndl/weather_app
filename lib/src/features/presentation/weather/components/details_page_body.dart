import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/features/domain/models/air_pollution.dart';
import 'package:weather_app/src/features/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/domain/models/weather.dart';
import 'package:weather_app/src/features/presentation/weather/components/currant_weather.dart';
import 'package:weather_app/src/features/presentation/weather/components/custom_button_icon.dart';
import 'package:weather_app/src/features/presentation/weather/components/custom_scaffold.dart';
import 'package:weather_app/src/features/presentation/weather/components/main_appbar.dart';
import 'package:weather_app/src/features/presentation/weather/components/weather_details.dart';
import 'package:weather_app/src/features/presentation/weather/components/weather_icon.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class DetailsPageBody extends StatelessWidget {
  final Weather weather;
  final HourlyForecast forecast;
  final AirPollution airPollution;

  const DetailsPageBody({
    Key? key,
    required this.weather,
    required this.forecast,
    required this.airPollution,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          MainAppBar(
            cityName: weather.name!,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 1.percentOfHeight,
            ),
          ),
          WeatherIcon(
            mood: weather.weather!.first.main!,
          ),
          CurrantWeather(
            weatherMood: weather.weather!.first.description!,
            temp: weather.main!.temp.round().toString(),
            humidity: '${weather.main!.humidity}',
            windSpeed: '${weather.wind!.speed!.round()}',
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.percentOfWidth,
                vertical: 3.percentOfHeight,
              ),
              child: CustomButtonIcon(
                icon: Assets.lib.src.assets.svg.arrowDown.svg(
                  colorFilter: ColorFilter.mode(
                    ColorsGuide.primary,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () {
                  Utils.viewWeatherDetails(
                    context,
                    WeatherDetails(
                      weather: weather,
                      forecast: forecast,
                      airPollution: airPollution,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
