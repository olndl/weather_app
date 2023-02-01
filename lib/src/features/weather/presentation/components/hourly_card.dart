import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';

class HourlyCard extends StatelessWidget {
  const HourlyCard({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [Text('12:00'), Text('21C')],
          ),
        ),
      ),
    );
  }
}
