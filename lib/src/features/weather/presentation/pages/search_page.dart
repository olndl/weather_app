import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/interface.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/features/weather/presentation/components/custom_button.dart';
import 'package:weather_app/src/features/weather/presentation/components/custom_scaffold.dart';
import 'package:weather_app/src/features/weather/presentation/components/edit_text.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      image: DecorationImage(
        image: AssetImage(Assets.lib.src.assets.png.background.path),
        fit: BoxFit.cover,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.lib.src.assets.svg.hover.svg(width: 140),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.percentOfWidth),
            child: const EditText(),
          ),
          SizedBox(
            height: 2.percentOfHeight,
          ),
          const CustomButton(title: Interface.approve)
        ],
      ),
    );
  }
}
