import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/interface.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/features/weather/presentation/components/currant_weather.dart';
import 'package:weather_app/src/features/weather/presentation/components/custom_button.dart';
import 'package:weather_app/src/features/weather/presentation/components/custom_scaffold.dart';
import 'package:weather_app/src/features/weather/presentation/components/main_appbar.dart';
import 'package:weather_app/src/features/weather/presentation/components/weather_details.dart';
import 'package:weather_app/src/features/weather/presentation/components/weather_icon.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      image: DecorationImage(
        image: AssetImage(Assets.lib.src.assets.png.background.path),
        fit: BoxFit.cover,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const MainAppBar(),
          const WeatherIcon(),
          const CurrantWeather(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.percentOfWidth,
                vertical: 2.percentOfHeight,
              ),
              child: CustomButton(
                onPressed: () {
                  Utils.viewWeatherDetails(
                    context,
                    const WeatherDetails(),
                  );
                },
                title: Interface.more,
              ),
            ),
          )
          //SeasonElement(),
        ],
      ),
    );
  }
}
