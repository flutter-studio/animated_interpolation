import 'animated_config.dart';

Map<double, AnimatedConfig> createSlide(AnimatedType type, double fromValue) {
  return {
    0: AnimatedConfig(translateX: type == AnimatedType.translateX ? fromValue : 0, translateY: type == AnimatedType.translateY ? fromValue : 0),
    1: AnimatedConfig(translateX: 0, translateY: 0)
  };
}

Map<double, AnimatedConfig> createSlideOut(AnimatedType type, double fromValue) {
  return {
    0: AnimatedConfig(translateX: 0, translateY: 0),
    1: AnimatedConfig(translateX: type == AnimatedType.translateX ? fromValue : 0, translateY: type == AnimatedType.translateY ? fromValue : 0),
  };
}

Map<double, AnimatedConfig> slideOutDown = createSlideOut(AnimatedType.translateY, 100);
Map<double, AnimatedConfig> slideOutUp = createSlideOut(AnimatedType.translateY, -100);
Map<double, AnimatedConfig> slideOutLeft = createSlideOut(AnimatedType.translateX, -100);
Map<double, AnimatedConfig> slideOutRight = createSlideOut(AnimatedType.translateX, 100);

Map<double, AnimatedConfig> slideInDown = createSlide(AnimatedType.translateY, 100);
Map<double, AnimatedConfig> slideInUp = createSlide(AnimatedType.translateY, -100);
Map<double, AnimatedConfig> slideInLeft = createSlide(AnimatedType.translateX, -100);
Map<double, AnimatedConfig> slideInRight = createSlide(AnimatedType.translateX, 100);
