import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class SeasonElement extends StatelessWidget {
  const SeasonElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            EdgeInsets.only(top: 20.percentOfHeight, bottom: 1.percentOfHeight),
        child: Assets.lib.src.assets.svg.house.svg(),
      ),
    );
  }
}
