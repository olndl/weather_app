import 'package:flutter/cupertino.dart';

class Dimension {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late double height;
  static late double width;

  static void setPageSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth;
      height = boxConstraints.maxHeight;
    } else {
      width = boxConstraints.maxHeight;
      height = boxConstraints.maxWidth;
    }
  }
}
