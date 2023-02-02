import 'package:flutter/material.dart';
import 'package:weather_app/src/core/theme/typography.dart';
import 'package:weather_app/src/features/forecast/presentation/pages/forecast_page.dart';
import 'package:weather_app/src/features/weather/presentation/pages/search_page.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class MainAppBar extends StatelessWidget {
  final String cityName;
  const MainAppBar({Key? key, required this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      title: Text(
        cityName,
        style: TextStyles.title1,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchPage()),
          );
        },
        icon: Assets.lib.src.assets.svg.hover.svg(width: 60),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ForecastPage()),
            );
          },
          icon: Assets.lib.src.assets.svg.addition.svg(width: 25),
        )
      ],
    );
  }
}
