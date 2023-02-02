import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/core/theme/typography.dart';

class CurrantWeather extends StatelessWidget {
  final String temp;
  final String weatherMood;
  const CurrantWeather({
    Key? key,
    required this.weatherMood,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$temp°',
            style: TextStyles.largeTitle,
          ),
          Text(
            weatherMood,
            style: TextStyles.headline,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'H: 18',
          //       style: TextStyles.headline,
          //     ),
          //     Text(
          //       'L: 12',
          //       style: TextStyles.headline,
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
