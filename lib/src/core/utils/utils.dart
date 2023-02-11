import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/features/weather/domain/models/hourly_forecast.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class Utils {
  static viewWeatherDetails(BuildContext context, Widget body) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: ColorsGuide.primary, width: .3),
              borderRadius: BorderRadius.circular(40),
            ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
          initialChildSize: .4,
          maxChildSize: .9,
          minChildSize: .32,
          builder: (BuildContext context, ScrollController scrollController){
            return SingleChildScrollView(
              controller: scrollController,
              child: Card(
                elevation: 5,
                color: ColorsGuide.solid.withOpacity(0.5),
                  child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: SizedBox(
                      height: 100.percentOfHeight,
                      child: body,),),
            ),),);
          },
      ),
    );
  }

  static String toDateTimeHM(int timestamp) {
    return DateFormat.Hm(Platform.localeName).format(
      DateTime.fromMillisecondsSinceEpoch(
        timestamp * 1000,
      ),
    );
  }

  static String toDateTimeYME(int timestamp) {
    return DateFormat.yMMMd(Platform.localeName).format(
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

  static bool isItDay({int? hour}) {
    hour = hour ?? DateTime.now().hour;
    return hour >= 6 && hour < 18 ? true : false;
  }

  static String weatherIcon(String mood, {int? hour}) {
    switch (mood) {
      case 'Thunderstorm':
        return isItDay(hour: hour)
            ? Assets.lib.src.assets.png.dayStorm.path
            : Assets.lib.src.assets.png.nightStorm.path;
      case 'Drizzle':
        return isItDay(hour: hour)
            ? Assets.lib.src.assets.png.dayRain.path
            : Assets.lib.src.assets.png.nightRain.path;
      case 'Rain':
        return isItDay(hour: hour)
            ? Assets.lib.src.assets.png.dayRain.path
            : Assets.lib.src.assets.png.nightRain.path;
      case 'Snow':
        return isItDay(hour: hour)
            ? Assets.lib.src.assets.png.daySnow.path
            : Assets.lib.src.assets.png.nightSnow.path;
      case 'Atmosphere':
        return isItDay(hour: hour)
            ? Assets.lib.src.assets.png.dayFog.path
            : Assets.lib.src.assets.png.nightFog.path;
      case 'Clear':
        return isItDay(hour: hour)
            ? Assets.lib.src.assets.png.dayClear.path
            : Assets.lib.src.assets.png.clearNight.path;
      case 'Clouds':
        return isItDay(hour: hour)
            ? Assets.lib.src.assets.png.dayClouds.path
            : Assets.lib.src.assets.png.nightClouds.path;
      default:
        Assets.lib.src.assets.png.dayClear.path;
    }
    return Assets.lib.src.assets.png.dayClear.path;
  }

  static String pressureComment(int pressure) {
    pressure = fromHPaToMMhg(pressure);
    return pressure > 749 && pressure < 766
        ? 'Normal atmospheric pressure'
        : 'This value of atmospheric pressure can affect your health';
  }

  static String feelsLikeComment(int temp, int feelsLike) {
    if (!temp.isNegative) {
      if (feelsLike.isNegative) {
        return 'Feels colder';
      } else {
        if (feelsLike - temp > 0) {
          return 'Feels warmer';
        } else {
          return 'Feels colder';
        }
      }
    } else {
      if (!feelsLike.isNegative) {
        return 'Feels warmer';
      } else {
        if (feelsLike - temp > 0) {
          return 'Feels warmer';
        } else {
          return 'Feels colder';
        }
      }
    }
  }

  static List<HoursForecastList> mergeSort(List<HoursForecastList> array) {
    if (array.length <= 1) {
      return array;
    }

    int splitIndex = array.length ~/ 2;

    List<HoursForecastList> leftArray = mergeSort(array.sublist(0, splitIndex));
    List<HoursForecastList> rightArray = mergeSort(array.sublist(splitIndex));

    return merge(leftArray, rightArray);
  }

  static List<HoursForecastList> merge(
      List<HoursForecastList> leftArray, List<HoursForecastList> rightArray,) {
    List<HoursForecastList> result = [];
    int? i = 0;
    int? j = 0;

    while (i! < leftArray.length && j! < rightArray.length) {
      if (leftArray[i].main.temp <= rightArray[j].main.temp) {
        result.add(leftArray[i]);
        i++;
      } else {
        result.add(rightArray[j]);
        j++;
      }
    }

    while (i! < leftArray.length) {
      result.add(leftArray[i]);
      i++;
    }

    while (j! < rightArray.length) {
      result.add(rightArray[j]);
      j++;
    }

    return result;
  }

}
