import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/core/theme/typography.dart';

class CurrantWeather extends StatelessWidget {
  const CurrantWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '19C',
            style: TextStyles.largeTitle,
          ),
          Text(
            'Mostly Clear',
            style: TextStyles.headline,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'H: 18',
                style: TextStyles.headline,
              ),
              Text(
                'L: 12',
                style: TextStyles.headline,
              )
            ],
          )
        ],
      ),
    );
  }
}
