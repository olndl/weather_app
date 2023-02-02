import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';

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
              height: 80.percentOfHeight,
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}
