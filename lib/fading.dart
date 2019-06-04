import 'animated_config.dart';

Map<double, AnimatedConfig> createFade(AnimatedType type, double fromValue) {
  return {
    0: AnimatedConfig(opacity: 0, translateX: type == AnimatedType.translateX ? fromValue : 0, translateY: type == AnimatedType.translateY ? fromValue : 0),
    1: AnimatedConfig(opacity: 1,translateX: 0,translateY: 0)
  };
}

Map<double, AnimatedConfig> createFadeOut(AnimatedType type, double toValue) {
  return {
    1: AnimatedConfig(opacity: 0, translateX: type == AnimatedType.translateX ? toValue : 0, translateY: type == AnimatedType.translateY ? toValue : 0),
    0: AnimatedConfig(opacity: 1,translateX: 0,translateY: 0)
  };
}

Map<double, AnimatedConfig> fadeIn = {
  0: AnimatedConfig(opacity: 0),
  1: AnimatedConfig(opacity: 1)
};


Map<double, AnimatedConfig> fadeOut = {
  1: AnimatedConfig(opacity: 0),
  0: AnimatedConfig(opacity: 1)
};


Map<double, AnimatedConfig> fadeInDown = createFade(AnimatedType.translateY, 100);
Map<double, AnimatedConfig> fadeInUp = createFade(AnimatedType.translateY, -100);
Map<double, AnimatedConfig> fadeInLeft = createFade(AnimatedType.translateX, -100);
Map<double, AnimatedConfig> fadeInRight = createFade(AnimatedType.translateX, 100);
Map<double, AnimatedConfig> fadeInDownBig = createFade(AnimatedType.translateY, 500);
Map<double, AnimatedConfig> fadeInUpBig = createFade(AnimatedType.translateY, -500);
Map<double, AnimatedConfig> fadeInLeftBig = createFade(AnimatedType.translateX, -500);
Map<double, AnimatedConfig> fadeInRightBig = createFade(AnimatedType.translateY, 500);

Map<double, AnimatedConfig> fadeOutDown = createFadeOut(AnimatedType.translateY, 100);
Map<double, AnimatedConfig> fadeOutUp = createFadeOut(AnimatedType.translateY, -100);
Map<double, AnimatedConfig> fadeOutLeft = createFadeOut(AnimatedType.translateX, -100);
Map<double, AnimatedConfig> fadeOutRight = createFadeOut(AnimatedType.translateX, 100);
Map<double, AnimatedConfig> fadeOutDownBig = createFadeOut(AnimatedType.translateY, 500);
Map<double, AnimatedConfig> fadeOutUpBig = createFadeOut(AnimatedType.translateY, -500);
Map<double, AnimatedConfig> fadeOutLeftBig = createFadeOut(AnimatedType.translateX, -500);
Map<double, AnimatedConfig> fadeOutRightBig = createFadeOut(AnimatedType.translateY, 500);
