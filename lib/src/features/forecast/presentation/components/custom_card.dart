import 'package:flutter/material.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                maxHeight: 160,
              ),
              color: ColorsGuide.primaryPink,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '19C',
                      style: TextStyles.title1,
                    ),
                    Row(
                      children: [
                        Text(
                          'H: 18',
                          style: TextStyles.headline,
                        ),
                        Text(
                          'L: 12',
                          style: TextStyles.headline,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '12.10.2023',
                          style: TextStyles.body,
                        ),
                        Text(
                          'Cloudy',
                          style: TextStyles.body,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 55,
          right: -5,
          child: Assets.lib.src.assets.svg.moonClear.svg(width: 200),
        ),
      ],
    );
    // );
  }
}
