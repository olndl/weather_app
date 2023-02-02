import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class Utils {
  static viewWeatherDetails(BuildContext context, Widget body) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      //expand: true,
      isScrollControlled: true,
      builder: (context) => Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorsGuide.primary, width: .3),
          borderRadius: BorderRadius.circular(40),
        ),
        color: ColorsGuide.solid.withOpacity(0.5),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: SizedBox(
              height: 75.percentOfHeight,
              child: body,
            ),
          ),
        ),
      ),
    );
  }

  static String toDateTime(int timestamp) {
    return DateFormat.Hm(Platform.localeName).format(
      DateTime.fromMillisecondsSinceEpoch(
        timestamp * 1000,
      ),
    );
  }

  static String fromMtoKm(int m) {
    return (m / 1000).round() <= 0 ? '< 1' : (m / 1000).round().toString();
  }

  static int fromHPaToMMhg(int hPa) {
    return hPa ~/ 1.333;
  }

  static double fromDegreesToRadians(int degrees) {
    return degrees * (math.pi / 180);
  }

  static String fromDegreesToDirection(int degrees) {
    List<String> directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    degrees = (degrees * 8 / 360).round();
    return directions[degrees];
  }

  static bool isItDay() {
    return DateTime.now().hour >= 6 && DateTime.now().hour < 18 ? true : false;
  }

  static Widget weatherIcon(String mood, double width) {
    switch (mood) {
      case 'Thunderstorm':
        return isItDay()
            ? Assets.lib.src.assets.svg.thunderstromDay.svg(width: width)
            : Assets.lib.src.assets.svg.thunderstrom.svg(width: width);
      case 'Drizzle':
        return isItDay()
            ? Assets.lib.src.assets.svg.drizzleDay.svg(width: width)
            : Assets.lib.src.assets.svg.drizzleNight.svg(width: width);
      case 'Rain':
        return isItDay()
            ? Assets.lib.src.assets.svg.drizzleDay.svg(width: width)
            : Assets.lib.src.assets.svg.drizzleNight.svg(width: width);
      case 'Snow':
        return Assets.lib.src.assets.svg.snow.svg(width: width);
      case 'Atmosphere':
        return Assets.lib.src.assets.svg.fog.svg(width: width);
      case 'Clear':
        return isItDay()
            ? Assets.lib.src.assets.svg.clearDay.svg(width: width)
            : Assets.lib.src.assets.svg.clearNignt.svg(width: width);
      case 'Clouds':
        return isItDay()
            ? Assets.lib.src.assets.svg.cloudyDay.svg(width: width)
            : Assets.lib.src.assets.svg.thunderstrom.svg(width: width);
      default:
        Container();
    }
    return Container();
  }

  static String pressureComment(int pressure) {
    pressure = fromHPaToMMhg(pressure);
    return pressure > 749 && pressure < 766
        ? 'Normal atmospheric pressure'
        : 'This value of atmospheric pressure can affect your health';
  }
}
