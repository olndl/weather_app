import 'package:flutter/material.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/features/weather/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/features/weather/domain/models/weather.dart';
import 'package:weather_app/src/features/weather/presentation/components/hourly_card.dart';
import 'package:weather_app/src/features/weather/presentation/components/weather_details_card.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class WeatherDetails extends StatelessWidget {
  final Weather weather;
  final HourlyForecast forecast;
  const WeatherDetails({
    Key? key,
    required this.weather,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: .5,
      expand: false,
      builder: (_, controller) => Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'today',
                style: TextStyles.title1,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 5),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: forecast.list.take(8).length,
              itemBuilder: (BuildContext context, int index) {
                return HourlyCard(
                  time: Utils.toDateTime(forecast.list[index].dt),
                  temp: '${forecast.list[index].main.temp.round()}°',
                );
              },
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                WeatherDetailsCard(
                  title: 'wind'.toUpperCase(),
                  icon: Assets.lib.src.assets.svg.wind
                      .svg(color: ColorsGuide.secondary, width: 15),
                  param: '${weather.wind.speed.round()}',
                  units: 'm/sec',
                  isWind: true,
                  degrees: weather.wind.deg,
                ),
                WeatherDetailsCard(
                  title: 'sunrise'.toUpperCase(),
                  icon: Assets.lib.src.assets.svg.sunrise
                      .svg(color: ColorsGuide.secondary, width: 15),
                  param: Utils.toDateTime(weather.sys.sunrise),
                  isWind: false,
                  comment: 'Sunset: ${Utils.toDateTime(weather.sys.sunset)}',
                ),
                // WeatherDetailsCard(
                //   title: 'feels like'.toUpperCase(),
                //   icon: Assets.lib.src.assets.svg.temp
                //       .svg(color: ColorsGuide.secondary),
                //   param: '${weather.main.feelsLike.round()}°',
                //   isWind: false,
                //   comment: 'comment',
                // ),
                // WeatherDetailsCard(
                //   title: 'humidity'.toUpperCase(),
                //   icon: Assets.lib.src.assets.svg.humidity
                //       .svg(color: ColorsGuide.secondary),
                //   param: '${weather.main.humidity}%',
                //   isWind: false,
                //   comment: 'The dew point',
                // ),
                WeatherDetailsCard(
                  title: 'visibility'.toUpperCase(),
                  icon: Assets.lib.src.assets.svg.eye
                      .svg(color: ColorsGuide.secondary, width: 15),
                  param: Utils.fromMtoKm(weather.visibility),
                  units: 'km',
                  isWind: false,
                  comment: 'Moderate',
                ),
                WeatherDetailsCard(
                  title: 'pressure'.toUpperCase(),
                  icon: Assets.lib.src.assets.svg.arrowDown
                      .svg(color: ColorsGuide.secondary, width: 15),
                  param: '${Utils.fromHPaToMMhg(weather.main.pressure)}',
                  units: 'mm Hg',
                  isWind: false,
                  comment: Utils.pressureComment(weather.main.pressure),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
