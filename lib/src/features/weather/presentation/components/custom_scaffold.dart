import 'package:flutter/material.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final Gradient? gradient;
  final DecorationImage? image;
  final PreferredSizeWidget? appBar;
  const CustomScaffold({
    Key? key,
    this.body,
    this.gradient,
    this.image,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.percentOfWidth),
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(image: image, gradient: gradient),
      child: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.transparent,
        body: body,
      ),
    );
  }
}
