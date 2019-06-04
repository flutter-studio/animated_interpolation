import 'animated_config.dart';

Map<double, AnimatedConfig> bounceIn = {
  0: AnimatedConfig(opacity: 0, scale: 0.3),
  0.2: AnimatedConfig(scale: 1.1),
  0.4: AnimatedConfig(scale: 0.9),
  0.6: AnimatedConfig(opacity: 1, scale: 1.03),
  0.8: AnimatedConfig(scale: 0.97),
  1: AnimatedConfig(opacity: 1, scale: 1)
};
Map<double, AnimatedConfig> bounceInUp = {
  0: AnimatedConfig(opacity: 0, translateY: 800),
  0.6: AnimatedConfig(opacity: 1, translateY: -25),
  0.75: AnimatedConfig(translateY: 10),
  0.9: AnimatedConfig(translateY: -5),
  1: AnimatedConfig(translateY: 0)
};

Map<double, AnimatedConfig> bounceInDown = {
  0: AnimatedConfig(opacity: 0, translateY: -800),
  0.6: AnimatedConfig(opacity: 1, translateY: 25),
  0.75: AnimatedConfig(translateY: -10),
  0.9: AnimatedConfig(translateY: 5),
  1: AnimatedConfig(translateY: 0)
};
Map<double, AnimatedConfig> bounceInRight = {
  0: AnimatedConfig(opacity: 0, translateX: 600),
  0.6: AnimatedConfig(opacity: 1, translateX: -20),
  0.75: AnimatedConfig(translateX: 8),
  0.9: AnimatedConfig(translateX: -4),
  1: AnimatedConfig(translateX: 0)
};
Map<double, AnimatedConfig> bounceInLeft = {
  0: AnimatedConfig(opacity: 0, translateX: -600),
  0.6: AnimatedConfig(opacity: 1, translateX: 20),
  0.75: AnimatedConfig(translateX: -8),
  0.9: AnimatedConfig(translateX: 4),
  1: AnimatedConfig(translateX: 0)
};
Map<double, AnimatedConfig> bounceOut = {
  0: AnimatedConfig(opacity: 1,scale: 1),
  0.2: AnimatedConfig(scale: 0.9),
  0.5: AnimatedConfig(scale: 1.11,opacity: 1),
  0.55: AnimatedConfig(scale: 1.11,opacity: 1),
  1: AnimatedConfig(opacity: 0, scale: 0.3)
};

Map<double, AnimatedConfig> bounceOutUp = {
  0: AnimatedConfig(opacity: 1,translateY: 0),
  0.2: AnimatedConfig(translateY: -10,opacity: 1),
  0.4: AnimatedConfig(translateY: 20),
  0.45: AnimatedConfig(translateY: 20),
  0.55: AnimatedConfig(opacity: 1),
  1: AnimatedConfig(opacity: 0, translateY: -800)
};

Map<double, AnimatedConfig> bounceOutDown = {
  0: AnimatedConfig(opacity: 1,translateY: 0),
  0.2: AnimatedConfig(translateY: 10,opacity: 1),
  0.4: AnimatedConfig(translateY: -20),
  0.45: AnimatedConfig(translateY: -20),
  0.55: AnimatedConfig(opacity: 1),
  1: AnimatedConfig(opacity: 0, translateY: 800),
};


Map<double, AnimatedConfig> bounceOutRight = {
  0: AnimatedConfig(opacity: 1,translateX: 0),
  0.2: AnimatedConfig(translateX: 10,opacity: 1),
  0.4: AnimatedConfig(translateX: -20),
  0.45: AnimatedConfig(translateX: -20),
  0.55: AnimatedConfig(opacity: 1),
  1: AnimatedConfig(opacity: 0,translateX: 600)
};

Map<double, AnimatedConfig> bounceOutLeft = {
  0: AnimatedConfig(opacity: 1,translateX: 0),
  0.2: AnimatedConfig(translateX: -10,opacity: 1),
  0.4: AnimatedConfig(translateX: 20),
  0.45: AnimatedConfig(translateX: 20),
  0.55: AnimatedConfig(opacity: 1),
  1: AnimatedConfig(opacity: 0,translateX: -600)
};