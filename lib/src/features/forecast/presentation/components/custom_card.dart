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
  const CustomCard(
      {Key? key,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.date,
      required this.mood,
      required this.description,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(40.0),
        ),
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(
            maxWidth: 300,
            maxHeight: 140,
          ),
          color: ColorsGuide.primaryPink,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: ListTile(
              title: Text(
                '$temp°',
                style: TextStyles.title1,
                textAlign: TextAlign.center,
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.lib.src.assets.svg.wind
                          .svg(width: 25, color: ColorsGuide.primary),
                      SizedBox(
                        width: .5.percentOfWidth,
                      ),
                      Text('$wind m/sec', style: TextStyles.callout),
                      SizedBox(
                        width: 3.percentOfWidth,
                      ),
                      Assets.lib.src.assets.svg.humidity.svg(
                        width: 25,
                        color: ColorsGuide.primary,
                      ),
                      SizedBox(
                        width: .5.percentOfWidth,
                      ),
                      Text('$humidity%', style: TextStyles.callout),
                    ],
                  ),
                  SizedBox(
                    height: .5.percentOfHeight,
                  ),
                  Text(
                    description,
                    style: TextStyles.callout.copyWith(fontSize: 14),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: .5.percentOfHeight,
                  ),
                  Text(
                    date,
                    style: TextStyles.callout,
                  )
                ],
              ),
              leading: Image.asset(
                Utils.weatherIcon(
                  mood,
                ),
                height: 90,
              ),
            ),
          ),
        ),
      ),
    );
    // );
  }
}
