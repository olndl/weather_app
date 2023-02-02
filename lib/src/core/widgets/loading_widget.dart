import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/features/weather/presentation/components/custom_scaffold.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      image: DecorationImage(
        image: AssetImage(Assets.lib.src.assets.png.background.path),
        fit: BoxFit.cover,
      ),
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
