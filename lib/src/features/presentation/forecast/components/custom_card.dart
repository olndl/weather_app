import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class CustomCard extends StatelessWidget {
  final String temp;
  final String wind;
  final String humidity;
  final String date;
  final String mood;
  final String description;

  const CustomCard({
    Key? key,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.date,
    required this.mood,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0, right: 5, left: 5, top: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(40.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SizedBox(
            height: 100,
            child: Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(
                maxWidth: 300,
                maxHeight: 100,
              ),
              color: Colors.grey.shade200.withOpacity(.2),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  title: Column(
                    children: [
                      Text(
                        '$temp°',
                        style: TextStyles.title1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 1.percentOfHeight,
                      ),
                      Text(
                        date,
                        style: TextStyles.callout.copyWith(fontSize: 14),
                      )
                    ],
                  ),
                  leading: Image.asset(
                    Utils.weatherIcon(
                      mood,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Assets.lib.src.assets.svg.wind
                            .svg(width: 25, color: ColorsGuide.primary),
                      ),
                      SizedBox(
                        height: .5.percentOfHeight,
                      ),
                      Text('$wind m/sec',
                          style: TextStyles.callout.copyWith(fontSize: 15)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
