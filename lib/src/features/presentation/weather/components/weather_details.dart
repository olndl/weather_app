import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/localization/localization.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/features/domain/models/air_pollution.dart';
import 'package:weather_app/src/features/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/domain/models/weather.dart';
import 'package:weather_app/src/features/presentation/weather/components/hourly_card.dart';
import 'package:weather_app/src/features/presentation/weather/components/weather_details_card.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

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
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.percentOfWidth,
                  vertical: 1.percentOfHeight,
                ),
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
              flex: 3,
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
              flex: 3,
              child: WeatherDetailsCard(
                width: 90.percentOfWidth,
                title: Localization.of(context).aqi.toUpperCase(),
                param: airPollution.list?.first.main?.aqi.toString(),
                airCoeff: airPollution.list?.first.main?.aqi,
                icon: Assets.lib.src.assets.svg.air.svg(
                  colorFilter: ColorFilter.mode(
                    ColorsGuide.secondary,
                    BlendMode.srcIn,
                  ),
                ),
                isAirQuality: true,
                comment: Utils.airQualityComment(
                  airPollution.list?.first.main?.aqi ?? 0,
                  context,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: GridView.count(
                primary: false,
                padding: EdgeInsets.all(3.percentOfWidth),
                crossAxisSpacing: 3.percentOfWidth,
                mainAxisSpacing: 3.percentOfWidth,
                crossAxisCount: 2,
                children: <Widget>[
                  WeatherDetailsCard(
                    width: 20.percentOfWidth,
                    height: 20.percentOfWidth,
                    title: Localization.of(context).feelsLike.toUpperCase(),
                    icon: Assets.lib.src.assets.svg.temp.svg(
                      colorFilter: ColorFilter.mode(
                        ColorsGuide.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    param: '${weather.main!.feelsLike!.round()}°',
                    comment: Utils.feelsLikeComment(
                      weather.main!.temp.round(),
                      weather.main!.feelsLike!.round(),
                      context,
                    ),
                  ),
                  WeatherDetailsCard(
                    width: 20.percentOfWidth,
                    height: 20.percentOfWidth,
                    title: Localization.of(context).wind.toUpperCase(),
                    icon: Assets.lib.src.assets.svg.wind.svg(
                      colorFilter: ColorFilter.mode(
                        ColorsGuide.secondary,
                        BlendMode.srcIn,
                      ),
                      width: 15,
                    ),
                    param: '${weather.wind!.speed!.round()}',
                    units: Localization.of(context).msec,
                    isWind: true,
                    degrees: weather.wind!.deg,
                  ),
                  WeatherDetailsCard(
                    width: 20.percentOfWidth,
                    height: 20.percentOfWidth,
                    title: Localization.of(context).sunrise.toUpperCase(),
                    icon: Assets.lib.src.assets.svg.sunrise.svg(
                      colorFilter: ColorFilter.mode(
                        ColorsGuide.secondary,
                        BlendMode.srcIn,
                      ),
                      width: 15,
                    ),
                    param: Utils.toDateTimeHM(
                      weather.sys!.sunrise!,
                    ),
                    isWind: false,
                    comment:
                        '${Localization.of(context).sunset}: ${Utils.toDateTimeHM(weather.sys!.sunset!)}',
                  ),
                  WeatherDetailsCard(
                    width: 20.percentOfWidth,
                    height: 20.percentOfWidth,
                    title: Localization.of(context).pressure.toUpperCase(),
                    icon: Assets.lib.src.assets.svg.arrowDown.svg(
                      colorFilter: ColorFilter.mode(
                        ColorsGuide.secondary,
                        BlendMode.srcIn,
                      ),
                      width: 15,
                    ),
                    param: '${Utils.fromHPaToMMhg(weather.main!.pressure)}',
                    units: Localization.of(context).mmhg,
                    comment:
                        Utils.pressureComment(weather.main!.pressure, context),
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
