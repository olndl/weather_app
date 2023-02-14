import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/core/utils/utils.dart';

class HourlyCard extends StatelessWidget {
  final String time;
  final String temp;
  final String mood;
  final int hour;
  const HourlyCard({
    Key? key,
    required this.time,
    required this.temp,
    required this.mood,
    required this.hour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.percentOfWidth),
      child: Card(
        elevation: 10,
        color: ColorsGuide.solid,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorsGuide.primary, width: .3),
          borderRadius: BorderRadius.circular(50),
        ),
        child: SizedBox(
          width: 20.percentOfWidth,
          height: 10.percentOfHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyles.callout.copyWith(
                  fontSize: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  Utils.weatherIcon(
                    mood,
                    hour: DateTime.fromMillisecondsSinceEpoch(
                      hour * 1000,
                    ).hour,
                  ),
                ),
              ),
              Text(
                temp,
                style: TextStyles.callout.copyWith(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
