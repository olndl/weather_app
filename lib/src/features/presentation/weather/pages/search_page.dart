import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/gen/assets.gen.dart';
import 'package:weather_app/src/features/presentation/weather/components/custom_scaffold.dart';
import 'package:weather_app/src/features/presentation/weather/components/edit_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.lib.src.assets.svg.hover.svg(width: 140),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.percentOfWidth),
            child: const EditText(),
          ),
        ],
      ),
    );
  }
}
