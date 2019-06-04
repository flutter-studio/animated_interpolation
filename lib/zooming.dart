import 'package:flutter/material.dart';
import 'animated_config.dart';
import 'dart:math';

Curve zoomingCurve = Cubic(0.175, 0.885, 0.32, 1);

Map<double, AnimatedConfig> createZooming(AnimatedType type, double pivotPoint) {
  double modifier = min(1, max(-1, pivotPoint));
  return {
    0: AnimatedConfig(
      opacity: 0,
      scale: 0.1,
      translateX: type == AnimatedType.translateX ? modifier * -1000 : 0,
      translateY: type == AnimatedType.translateY ? modifier * -1000 : 0,
    ),
    0.6: AnimatedConfig(
      opacity: 1,
      scale: 0.457,
      translateX: type == AnimatedType.translateX ? pivotPoint : 0,
      translateY: type == AnimatedType.translateY ? pivotPoint : 0,
    ),
    1: AnimatedConfig(
      scale: 1,
      translateX: 0,
      translateY: 0
    )
  };
}

Map<double, AnimatedConfig> createZoomingOut(AnimatedType type, double pivotPoint) {
  double modifier = min(1, max(-1, pivotPoint));
  return {
    1: AnimatedConfig(
      opacity: 0,
      scale: 0.1,
      translateX: type == AnimatedType.translateX ? modifier * -1000 : 0,
      translateY: type == AnimatedType.translateY ? modifier * -1000 : 0,
    ),
    0.4: AnimatedConfig(
      opacity: 1,
      scale: 0.457,
      translateX: type == AnimatedType.translateX ? pivotPoint : 0,
      translateY: type == AnimatedType.translateY ? pivotPoint : 0,
    ),
    0: AnimatedConfig(
      scale: 1,
      translateX: 0,
      translateY: 0
    )
  };
}

Map<double, AnimatedConfig> zoomOutDown = createZoomingOut(AnimatedType.translateY, 60);

Map<double, AnimatedConfig> zoomOutUp = createZoomingOut(AnimatedType.translateY, -60);

Map<double, AnimatedConfig> zoomOutLeft = createZoomingOut(AnimatedType.translateX, 10);

Map<double, AnimatedConfig> zoomOutRight = createZoomingOut(AnimatedType.translateX, -10);

Map<double, AnimatedConfig> zoomInDown = createZooming(AnimatedType.translateY, 60);

Map<double, AnimatedConfig> zoomInUp = createZooming(AnimatedType.translateY, -60);

Map<double, AnimatedConfig> zoomInLeft = createZooming(AnimatedType.translateX, 10);

Map<double, AnimatedConfig> zoomInRight = createZooming(AnimatedType.translateX, -10);
