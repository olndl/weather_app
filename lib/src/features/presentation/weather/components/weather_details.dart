import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/features/presentation/weather/components/weather_details_card.dart';
import 'package:weather_app/src/gen/assets.gen.dart';
import 'package:weather_app/src/features/domain/models/air_pollution.dart';
import 'package:weather_app/src/features/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/domain/models/weather.dart';
import 'package:weather_app/src/features/presentation/weather/components/hourly_card.dart';

class WeatherDetails extends StatelessWidget {
  final Weather weather;
  final HourlyForecast forecast;
  final AirPollution airPollution;
  const WeatherDetails({
    Key? key,
    required this.weather,
    required this.forecast,
    required this.airPollution,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          child: Container(
            width: 60,
            height: 7,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                child: Center(
                  child: Text(
                    DateFormat.yMMMMEEEEd(Platform.localeName).format(
                      DateTime.now(),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyles.body,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 5),
                scrollDirection: Axis.horizontal,
                itemCount: forecast.list.take(8).length,
                itemBuilder: (BuildContext context, int index) {
                  return HourlyCard(
                    time: Utils.toDateTimeHM(forecast.list[index].dt),
                    temp: '${forecast.list[index].main.temp.round()}°',
                    hour: forecast.list[index].dt,
                    mood: weather.weather!.first.main!,
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: WeatherDetailsCard(
                width: 90.percentOfWidth,
                title: 'air quality'.toUpperCase(),
                param: airPollution.list?.first.main?.aqi.toString(),
                airCoeff: airPollution.list?.first.main?.aqi,
                icon: Assets.lib.src.assets.svg.air.svg(
                  color: ColorsGuide.secondary,
                ),
                isAirQuality: true,
                comment: Utils.airQualityComment(
                    airPollution.list?.first.main?.aqi ?? 0),
              ),
            ),
            Expanded(
              flex: 5,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  WeatherDetailsCard(
                    title: 'feels like'.toUpperCase(),
                    icon: Assets.lib.src.assets.svg.temp
                        .svg(color: ColorsGuide.secondary),
                    param: '${weather.main!.feelsLike!.round()}°',
                    comment: Utils.feelsLikeComment(
                      weather.main!.temp.round(),
                      weather.main!.feelsLike!.round(),
                    ),
                  ),
                  WeatherDetailsCard(
                    title: 'wind'.toUpperCase(),
                    icon: Assets.lib.src.assets.svg.wind
                        .svg(color: ColorsGuide.secondary, width: 15),
                    param: '${weather.wind!.speed!.round()}',
                    units: 'm/sec',
                    isWind: true,
                    degrees: weather.wind!.deg,
                  ),
                  WeatherDetailsCard(
                    title: 'sunrise'.toUpperCase(),
                    icon: Assets.lib.src.assets.svg.sunrise
                        .svg(color: ColorsGuide.secondary, width: 15),
                    param: Utils.toDateTimeHM(weather.sys!.sunrise!),
                    isWind: false,
                    comment:
                        'Sunset: ${Utils.toDateTimeHM(weather.sys!.sunset!)}',
                  ),
                  WeatherDetailsCard(
                    title: 'pressure'.toUpperCase(),
                    icon: Assets.lib.src.assets.svg.arrowDown
                        .svg(color: ColorsGuide.secondary, width: 15),
                    param: '${Utils.fromHPaToMMhg(weather.main!.pressure)}',
                    units: 'mm Hg',
                    comment: Utils.pressureComment(weather.main!.pressure),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
