import 'package:flutter/material.dart';
import 'package:weather_app/src/core/theme/typography.dart';
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
      leading: Assets.lib.src.assets.svg.hover.svg(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Assets.lib.src.assets.svg.addition.svg(),
        )
      ],
    );
  }
}
