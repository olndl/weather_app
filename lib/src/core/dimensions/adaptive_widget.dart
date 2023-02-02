import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/core/dimensions/dimension.dart';

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
);

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({Key? key, required this.builder}) : super(key: key);

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            Dimension.setPageSize(constraints, orientation);
            return builder(
              context,
              orientation,
            );
          },
        );
      },
    );
  }
}
