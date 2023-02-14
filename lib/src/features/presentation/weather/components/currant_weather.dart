import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class CurrantWeather extends StatelessWidget {
  final String temp;
  final String weatherMood;
  final String humidity;
  final String windSpeed;
  const CurrantWeather({
    Key? key,
    required this.weatherMood,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            '$temp°',
            style: TextStyles.largeTitle,
          ),
          Text(
            weatherMood,
            style: TextStyles.headline,
          ),
          SizedBox(
            height: 2.percentOfHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.lib.src.assets.svg.wind
                  .svg(width: 25, color: ColorsGuide.primary),
              SizedBox(
                width: .5.percentOfWidth,
              ),
              Text('$windSpeed m/sec', style: TextStyles.headline),
              SizedBox(
                width: 2.percentOfWidth,
              ),
              Assets.lib.src.assets.svg.humidity.svg(
                width: 25,
                color: ColorsGuide.primary,
              ),
              SizedBox(
                width: .5.percentOfWidth,
              ),
              Text('$humidity%', style: TextStyles.headline),
            ],
          )
        ],
      ),
    );
  }
}
