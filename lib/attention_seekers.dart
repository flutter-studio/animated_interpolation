import 'animated_config.dart';
import 'light_speed.dart' show degreeToRad;

Map<double, AnimatedConfig> bounce = {
  0: AnimatedConfig(translateY: 0),
  0.2: AnimatedConfig(translateY: 0),
  0.4: AnimatedConfig(translateY: -30),
  0.43: AnimatedConfig(translateY: -30),
  0.53: AnimatedConfig(translateY: 0),
  0.7: AnimatedConfig(translateY: -15),
  0.8: AnimatedConfig(translateY: 0),
  0.9: AnimatedConfig(translateY: -4),
  1: AnimatedConfig(translateY: 0)
};
Map<double, AnimatedConfig> flash = {
  0: AnimatedConfig(opacity: 1),
  0.25: AnimatedConfig(opacity: 0),
  0.5: AnimatedConfig(opacity: 1),
  0.75: AnimatedConfig(opacity: 0),
  1: AnimatedConfig(opacity: 1)
};
Map<double, AnimatedConfig> jello = {
  0: AnimatedConfig(skewX: degreeToRad(0), skewY: degreeToRad(0)),
  0.111: AnimatedConfig(skewY: degreeToRad(0), skewX: degreeToRad(0)),
  0.222: AnimatedConfig(skewX: degreeToRad(-12.5), skewY: degreeToRad(-12.5)),
  0.333: AnimatedConfig(skewY: degreeToRad(6.25), skewX: degreeToRad(6.25)),
  0.444: AnimatedConfig(skewX: degreeToRad(-3.125), skewY: degreeToRad(-3.125)),
  0.555: AnimatedConfig(skewY: degreeToRad(1.5625), skewX: degreeToRad(1.5625)),
  0.666: AnimatedConfig(skewX: degreeToRad(-0.78125), skewY: degreeToRad(-0.78125)),
  0.777: AnimatedConfig(skewY: degreeToRad(0.390625), skewX: degreeToRad(0.390625)),
  0.888: AnimatedConfig(skewX: degreeToRad(-0.1953125), skewY: degreeToRad(-0.1953125)),
  1: AnimatedConfig(skewX: degreeToRad(0), skewY: degreeToRad(0))
};
Map<double, AnimatedConfig> pulse = {
  0:AnimatedConfig(scale: 1),
  0.5:AnimatedConfig(scale: 1.05),
  1:AnimatedConfig(scale: 1)
};
Map<double, AnimatedConfig> rotate = {
  0:AnimatedConfig(rotateX: degreeToRad(0),rotateY: degreeToRad(1)),
  0.25:AnimatedConfig(rotateY: degreeToRad(90),rotateX: degreeToRad(90)),
  0.5:AnimatedConfig(rotateX: degreeToRad(180),rotateY: degreeToRad(180)),
  0.75:AnimatedConfig(rotateX: degreeToRad(270),rotateY: degreeToRad(270)),
  1:AnimatedConfig(rotateY: degreeToRad(360),rotateX: degreeToRad(760))
};
Map<double, AnimatedConfig> shake = {
  0: AnimatedConfig(translateX: 0),
  0.1:AnimatedConfig(translateX: -10),
  0.2:AnimatedConfig(translateX: 10),
  0.3:AnimatedConfig(translateX: -10),
  0.4:AnimatedConfig(translateX: 10),
  0.5:AnimatedConfig(translateX: -10),
  0.6:AnimatedConfig(translateX: 10),
  0.7:AnimatedConfig(translateX: -10),
  0.8:AnimatedConfig(translateX: 10),
  0.9:AnimatedConfig(translateX: 10),
  1: AnimatedConfig(translateX: 0),
};
Map<double, AnimatedConfig> swing = {
  0:AnimatedConfig(rotateX: degreeToRad(0),rotateY: degreeToRad(0)),
  0.2:AnimatedConfig(rotateY: degreeToRad(15),rotateX: degreeToRad(15)),
  0.4:AnimatedConfig(rotateY: degreeToRad(-10),rotateX: degreeToRad(-10)),
  0.6:AnimatedConfig(rotateY: degreeToRad(5),rotateX: degreeToRad(5)),
  0.8:AnimatedConfig(rotateY: degreeToRad(-5),rotateX: degreeToRad(-5)),
  1:AnimatedConfig(rotateY: degreeToRad(0),rotateX: degreeToRad(0)),
};
Map<double, AnimatedConfig> rubberBand = {
  0: AnimatedConfig(scaleX: 1,scaleY: 1),
  0.3: AnimatedConfig(scaleX: 1.25,scaleY: 0.75),
  0.4: AnimatedConfig(scaleX: 0.75,scaleY: 1.25),
  0.5: AnimatedConfig(scaleX: 1.15,scaleY: 0.85),
  0.65: AnimatedConfig(scaleX: 0.95,scaleY: 1.05),
  0.75: AnimatedConfig(scaleX: 1.05,scaleY: 0.95),
  1: AnimatedConfig(scaleX: 1,scaleY: 1),
};
Map<double, AnimatedConfig> tada = {
  0:AnimatedConfig(scale: 1,rotate: degreeToRad(0)),
  0.1:AnimatedConfig(scale: 0.9,rotate: degreeToRad(-3)),
  0.2:AnimatedConfig(scale: 0.9,rotate: degreeToRad(-3)),
  0.3:AnimatedConfig(scale: 1.1,rotate: degreeToRad(-3)),
  0.4:AnimatedConfig(rotate: degreeToRad(3)),
  0.5:AnimatedConfig(rotate: degreeToRad(-3)),
  0.6:AnimatedConfig(rotate: degreeToRad(3)),
  0.7:AnimatedConfig(rotate: degreeToRad(-3)),
  0.8:AnimatedConfig(rotate: degreeToRad(3)),
  0.9:AnimatedConfig(scale: 1.1,rotate: degreeToRad(3)),
  1:AnimatedConfig(scale: 1,rotate: degreeToRad(0)),
};
Map<double, AnimatedConfig> wobble = {
  0: AnimatedConfig(rotate: degreeToRad(0),translateX: 0),
  0.15: AnimatedConfig(rotate: degreeToRad(-5),translateX: -25),
  0.3: AnimatedConfig(rotate: degreeToRad(3),translateX: 20),
  0.45: AnimatedConfig(rotate: degreeToRad(-3),translateX: -15),
  0.6: AnimatedConfig(rotate: degreeToRad(2),translateX: 10),
  0.75: AnimatedConfig(rotate: degreeToRad(-1),translateX: -5),
  0: AnimatedConfig(rotate: degreeToRad(0),translateX: 0),
};