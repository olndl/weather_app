import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class WeatherDetailsCard extends StatelessWidget {
  final String title;
  final SvgPicture icon;
  final String param;
  final String? comment;
  final String? units;
  final bool isWind;
  final int? degrees;
  const WeatherDetailsCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.param,
    this.comment,
    required this.isWind,
    this.units,
    this.degrees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: ColorsGuide.darkSolid,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ColorsGuide.solid, width: .3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 20.percentOfWidth,
        height: 20.percentOfWidth,
        padding: EdgeInsets.symmetric(
          vertical: 2.percentOfHeight,
          horizontal: 4.percentOfWidth,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: icon,
                    ),
                    Text(
                      title,
                      style: TextStyles.callout.copyWith(
                        fontSize: 16,
                        color: ColorsGuide.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(param, style: TextStyles.title1),
                    SizedBox(
                      width: .5.percentOfWidth,
                    ),
                    if (units != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          units!,
                          style: TextStyles.callout.copyWith(fontSize: 14),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            isWind
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Assets.lib.src.assets.svg.windRose
                              .svg(width: 20.percentOfWidth),
                          Positioned(
                            child: Transform.rotate(
                              angle: Utils.fromDegreesToRadians(degrees!),
                              child: Assets.lib.src.assets.svg.arrowUp.svg(
                                color: ColorsGuide.primary,
                                width: 5.percentOfWidth,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            Utils.fromDegreesToDirection(degrees!),
                            style: TextStyles.callout,
                          ),
                          SizedBox(
                            height: 1.percentOfHeight,
                          ),
                          Text(
                            '$degrees°',
                            style: TextStyles.callout,
                          ),
                        ],
                      )
                    ],
                  )
                : Text(
                    comment ?? '',
                    style: TextStyles.callout.copyWith(fontSize: 16),
                  ),
          ],
        ),
      ),
    );
  }
}
