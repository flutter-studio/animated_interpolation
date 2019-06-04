import 'animated_config.dart';
import 'light_speed.dart' show degreeToRad;
import 'package:flutter/material.dart';

Curve flipInCurve = Curves.easeIn;
Map<double, AnimatedConfig> flipInX = {
  0: AnimatedConfig(opacity: 0, rotateX: degreeToRad(90)),
  0.4: AnimatedConfig(rotateX: degreeToRad(-20)),
  0.6: AnimatedConfig(opacity: 1, rotateX: degreeToRad(10)),
  0.8: AnimatedConfig(rotateX: degreeToRad(-5)),
  1: AnimatedConfig(opacity: 1, rotateX: degreeToRad(0))
};

Map<double, AnimatedConfig> flipInY = {
  0: AnimatedConfig(opacity: 0, rotateY: degreeToRad(90)),
  0.4: AnimatedConfig(rotateY: degreeToRad(-20)),
  0.6: AnimatedConfig(opacity: 1, rotateY: degreeToRad(10)),
  0.8: AnimatedConfig(rotateY: degreeToRad(-5)),
  1: AnimatedConfig(opacity: 1, rotateY: degreeToRad(0))
};

Map<double, AnimatedConfig> flipOutX = {
  0: AnimatedConfig(opacity: 1, rotateX: degreeToRad(0)),
  0.3: AnimatedConfig(opacity: 1, rotateX: degreeToRad(-20)),
  1: AnimatedConfig(opacity: 0, rotateX: degreeToRad(90))
};
Map<double, AnimatedConfig> flipOutY = {
  0: AnimatedConfig(opacity: 1, rotateY: degreeToRad(0)),
  0.3: AnimatedConfig(opacity: 1, rotateY: degreeToRad(-20)),
  1: AnimatedConfig(opacity: 0, rotateY: degreeToRad(90))
};
