import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/interface.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/features/weather/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/weather/domain/models/weather.dart';
import 'package:weather_app/src/features/weather/presentation/components/currant_weather.dart';
import 'package:weather_app/src/features/weather/presentation/components/custom_button.dart';
import 'package:weather_app/src/features/weather/presentation/components/custom_scaffold.dart';
import 'package:weather_app/src/features/weather/presentation/components/main_appbar.dart';
import 'package:weather_app/src/features/weather/presentation/components/weather_details.dart';
import 'package:weather_app/src/features/weather/presentation/components/weather_icon.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class DetailsPageBody extends StatelessWidget {
  final Weather weather;
  final HourlyForecast forecast;
  const DetailsPageBody({
    Key? key,
    required this.weather,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      image: DecorationImage(
        image: AssetImage(Assets.lib.src.assets.png.background.path),
        fit: BoxFit.cover,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          MainAppBar(
            cityName: weather.name,
          ),
          WeatherIcon(
            mood: weather.weather.first.main,
          ),
          CurrantWeather(
            weatherMood: weather.weather.first.description,
            temp: weather.main.temp.round().toString(),
            humidity: '${weather.main.humidity}',
            windSpeed: '${weather.wind.speed.round()}',
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.percentOfWidth,
                vertical: 5.percentOfHeight,
              ),
              child: CustomButton(
                onPressed: () {
                  Utils.viewWeatherDetails(
                    context,
                    WeatherDetails(
                      weather: weather,
                      forecast: forecast,
                    ),
                  );
                },
                title: Interface.more,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
