import 'package:flutter/material.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/features/weather/domain/models/weather.dart';
import 'package:weather_app/src/features/weather/presentation/components/hourly_card.dart';
import 'package:weather_app/src/features/weather/presentation/components/weather_details_card.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class WeatherDetails extends StatelessWidget {
  final Weather weather;
  const WeatherDetails({Key? key, required this.weather}) : super(key: key);

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
                'hourly forecast',
                style: TextStyles.body,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 5),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: const <Widget>[
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
                HourlyCard(),
              ],
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
                  title: 'feels like'.toUpperCase(),
                  icon: Assets.lib.src.assets.svg.temp
                      .svg(color: ColorsGuide.secondary),
                  param: '${weather.main.feelsLike.round()}°',
                  comment: 'comment',
                ),
                WeatherDetailsCard(
                  title: 'humidity'.toUpperCase(),
                  icon: Assets.lib.src.assets.svg.humidity
                      .svg(color: ColorsGuide.secondary),
                  param: '${weather.main.humidity}%',
                  comment: 'Moderate',
                ),
                WeatherDetailsCard(
                  title: 'visibility'.toUpperCase(),
                  icon: Assets.lib.src.assets.svg.eye
                      .svg(color: ColorsGuide.secondary, width: 15),
                  param: '${(weather.visibility / 1000).round()} km',
                  comment: 'Moderate',
                ),
                WeatherDetailsCard(
                  title: 'pressure'.toUpperCase(),
                  icon: Assets.lib.src.assets.svg.arrowDown
                      .svg(color: ColorsGuide.secondary, width: 15),
                  param: '${(weather.main.pressure / 1.33).round()} mm Hg',
                  comment: 'Moderate',
                ),
                WeatherDetailsCard(
                  title: 'clouds'.toUpperCase(),
                  icon: Assets.lib.src.assets.svg.cloud
                      .svg(color: ColorsGuide.secondary, width: 15),
                  param: '${weather.clouds.all}%',
                  comment: 'Moderate',
                ),
                WeatherDetailsCard(
                  title: 'sunrise'.toUpperCase(),
                  icon: Assets.lib.src.assets.svg.sunrise
                      .svg(color: ColorsGuide.secondary, width: 15),
                  param:
                      '${DateTime.fromMillisecondsSinceEpoch(weather.sys.sunrise * 1000)}',
                  comment: 'Moderate',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
