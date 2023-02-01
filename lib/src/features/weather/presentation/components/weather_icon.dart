import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Assets.lib.src.assets.svg.moonClear.svg(width: 70.percentOfWidth),
    );
  }
}
