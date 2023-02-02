import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/utils/utils.dart';

class WeatherIcon extends StatelessWidget {
  final String mood;
  const WeatherIcon({Key? key, required this.mood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Utils.weatherIcon(mood, 70.percentOfWidth),
    );
  }
}
