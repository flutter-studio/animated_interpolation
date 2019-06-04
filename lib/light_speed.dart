import 'animated_config.dart';
import 'dart:math';
import 'package:flutter/material.dart';

// 角度转弧度
double degreeToRad(double degree) {
  return degree * pi / 180;
}

Map<double, AnimatedConfig> lightSpeedIn = {
  0: AnimatedConfig(opacity: 0, translateX: 200, skewX: degreeToRad(-30)),
  0.6: AnimatedConfig(opacity: 1, translateX: 0, skewX: degreeToRad(20)),
  0.8: AnimatedConfig(skewX: degreeToRad(-5)),
  1: AnimatedConfig(opacity: 1, translateX: 0, skewX: degreeToRad(0))
};
Curve lightSpeedInCurve = Curves.easeOut;
Curve lightSpeedOutCurve = Curves.easeIn;

Map<double, AnimatedConfig> lightSpeedOut = {
  0: AnimatedConfig(opacity: 1, translateX: 0, skewX: degreeToRad(0)),
  1: AnimatedConfig(opacity: 0, translateX: 200, skewX: degreeToRad(30))
};
