import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';

class WeatherDetailsCard extends StatelessWidget {
  final String title;
  final SvgPicture icon;
  final String param;
  final String? comment;
  const WeatherDetailsCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.param,
    this.comment,
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
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    icon,
                    const SizedBox(
                      width: 5,
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
                Text(param, style: TextStyles.title1),
              ],
            ),
            Text(
              comment ?? '',
              style: TextStyles.callout,
            ),
          ],
        ),
      ),
    );
  }
}
