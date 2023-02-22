import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/features/presentation/weather/components/custom_scaffold.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(1.percentOfHeight),
          child: CircularProgressIndicator(
            color: ColorsGuide.primary,
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}
