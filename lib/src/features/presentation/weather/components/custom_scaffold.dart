import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/gen/assets.gen.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final Gradient? gradient;
  final PreferredSizeWidget? appBar;
  const CustomScaffold({
    Key? key,
    this.body,
    this.gradient,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.percentOfWidth),
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.lib.src.assets.png.background.path),
          fit: BoxFit.cover,
        ),
        gradient: gradient,
      ),
      child: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.transparent,
        body: body,
      ),
    );
  }
}
