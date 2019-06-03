import 'animated_config.dart';

Map<double, AnimatedConfig> createFade(AnimatedType type, double fromValue) {
  return {
    0: AnimatedConfig(opacity: 0, translateX: type == AnimatedType.translateX ? fromValue : 0, translateY: type == AnimatedType.translateY ? fromValue : 0),
    1: AnimatedConfig(opacity: 1)
  };
}

Map<double, AnimatedConfig> fadeInDown = createFade(AnimatedType.translateY, 100);
Map<double, AnimatedConfig> fadeInUp = createFade(AnimatedType.translateY, -100);
Map<double, AnimatedConfig> fadeInLeft = createFade(AnimatedType.translateX, -100);
Map<double, AnimatedConfig> fadeInRight = createFade(AnimatedType.translateY, 100);
Map<double, AnimatedConfig> fadeInDownBig = createFade(AnimatedType.translateY, 500);
Map<double, AnimatedConfig> fadeInUpBig = createFade(AnimatedType.translateY, -500);
Map<double, AnimatedConfig> fadeInLeftBig = createFade(AnimatedType.translateX, -500);
Map<double, AnimatedConfig> fadeInRightBig = createFade(AnimatedType.translateY, 500);
