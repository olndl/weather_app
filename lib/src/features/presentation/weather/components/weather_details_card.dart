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
  final String? param;
  final String? comment;
  final String? units;
  final bool isWind;
  final bool isAirQuality;
  final int? airCoeff;
  final int? degrees;
  final double width;
  final double height;

  const WeatherDetailsCard({
    Key? key,
    this.width = 50,
    this.height = 50,
    required this.title,
    required this.icon,
    this.param,
    this.comment,
    this.isWind = false,
    this.isAirQuality = false,
    this.units,
    this.degrees,
    this.airCoeff,
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
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(
          vertical: 1.percentOfHeight,
          horizontal: 3.percentOfWidth,
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
                param != null
                    ? Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(1.percentOfWidth),
                            child: Text(param!, style: TextStyles.title1),
                          ),
                          if (units != null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                units!,
                                style:
                                    TextStyles.callout.copyWith(fontSize: 14),
                              ),
                            ),
                        ],
                      )
                    : Container(),
              ],
            ),
            isAirQuality
                ? Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        width: 90.percentOfWidth,
                        height: 7,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.5),
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              ColorsGuide.lightSolid,
                              ColorsGuide.solid,
                              ColorsGuide.lightPink,
                              ColorsGuide.ultraPink,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: (13.3 * airCoeff!).percentOfWidth,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: ColorsGuide.darkSolid,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: ColorsGuide.primary,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            isWind
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Assets.lib.src.assets.svg.windRose
                              .svg(width: 15.percentOfWidth),
                          Positioned(
                            child: Transform.rotate(
                              angle: Utils.fromDegreesToRadians(degrees!),
                              child: Assets.lib.src.assets.svg.arrowUp.svg(
                                colorFilter: ColorFilter.mode(
                                  ColorsGuide.primary,
                                  BlendMode.srcIn,
                                ),
                                width: 5.percentOfWidth,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorsGuide.primary,
                            child: CircleAvatar(
                              backgroundColor: ColorsGuide.darkSolid,
                              radius: 19,
                              child: Text(
                                Utils.fromDegreesToDirection(degrees!, context),
                                style:
                                    TextStyles.callout.copyWith(fontSize: 14),
                              ),
                            ),
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
