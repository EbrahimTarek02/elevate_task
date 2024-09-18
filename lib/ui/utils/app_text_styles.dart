import 'package:flutter/material.dart';

double getResponsiveSize(BuildContext context, {required double size}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = size * scaleFactor;

  double lowerLimit = size * .7;
  double upperLimit = size * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width < 600) {
    return width / 400;
  }
  else {
    return width / 700;
  }
}