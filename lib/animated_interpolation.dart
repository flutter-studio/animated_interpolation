import 'package:flutter/material.dart';
export 'fading.dart';
export 'animated_config.dart';
export 'bounce.dart';
export 'sliding.dart';
export 'zooming.dart';
export 'light_speed.dart';
export 'attention_seekers.dart';
export 'flippers.dart';
export 'smart_tabbar.dart';
export 'sweet_indicator_painter.dart';
///
/// 加强型的tween，可设置多个插值，受到React Native的插值动画启发
/// 和tween使用方法一样
/// 示例：
/// InterpolationTween(inputRange: [0,0.2,1], outputRange: [0,250,300]).evaluate(animation)
///
///
class InterpolationTween extends Animatable<double> {
  InterpolationTween({
    @required this.inputRange,
    @required this.outputRange,
    this.curve = const _Linear._(),
    this.extrapolate,
    this.extrapolateLeft = ExtrapolateType.extend,
    this.extrapolateRight = ExtrapolateType.extend,
  });

  final List<double> inputRange;
  final List<double> outputRange;
  final Curve curve;
  final ExtrapolateType extrapolate;
  final ExtrapolateType extrapolateLeft;
  final ExtrapolateType extrapolateRight;

  @override
  double transform(double t) => createInterpolation(InterpolationConfigType(
      inputRange: inputRange,
      outputRange: outputRange,
      curve: curve,
      extrapolate: extrapolate,
      extrapolateLeft: extrapolateLeft,
      extrapolateRight: extrapolateRight))(t);
}

class ColorInterpolationTween extends Animatable<Color> {
  ColorInterpolationTween({
    @required this.inputRange,
    @required this.outputRange,
    this.curve = const _Linear._(),
    this.extrapolate,
    this.extrapolateLeft = ExtrapolateType.extend,
    this.extrapolateRight = ExtrapolateType.extend,
  });

  final List<double> inputRange;
  final List<Color> outputRange;
  final Curve curve;
  final ExtrapolateType extrapolate;
  final ExtrapolateType extrapolateLeft;
  final ExtrapolateType extrapolateRight;
  @override
  Color transform(double t) {
    // TODO: implement transform
    return Color.fromARGB(
      createInterpolation(InterpolationConfigType(
              inputRange: inputRange,
              outputRange: outputRange.map((color) => color.alpha.toDouble()).toList(),
              curve: curve,
              extrapolate: extrapolate,
              extrapolateLeft: extrapolateLeft,
              extrapolateRight: extrapolateRight))(t)
          .toInt()
          .clamp(0, 255),
      createInterpolation(InterpolationConfigType(
              inputRange: inputRange,
              outputRange: outputRange.map((color) => color.red.toDouble()).toList(),
              curve: curve,
              extrapolate: extrapolate,
              extrapolateLeft: extrapolateLeft,
              extrapolateRight: extrapolateRight))(t)
          .toInt()
          .clamp(0, 255),
      createInterpolation(InterpolationConfigType(
              inputRange: inputRange,
              outputRange: outputRange.map((color) => color.green.toDouble()).toList(),
              curve: curve,
              extrapolate: extrapolate,
              extrapolateLeft: extrapolateLeft,
              extrapolateRight: extrapolateRight))(t)
          .toInt()
          .clamp(0, 255),
      createInterpolation(InterpolationConfigType(
              inputRange: inputRange,
              outputRange: outputRange.map((color) => color.blue.toDouble()).toList(),
              curve: curve,
              extrapolate: extrapolate,
              extrapolateLeft: extrapolateLeft,
              extrapolateRight: extrapolateRight))(t)
          .toInt()
          .clamp(0, 255),
    );
  }
}

enum ExtrapolateType {
  extend,
  identity,
  clamp,
}

typedef DoubleCallBack<double> = double Function(double value);

class _Linear extends Curve {
  const _Linear._();

  @override
  double transformInternal(double t) => t;
}

///
/// 插值配置对象
///
class InterpolationConfigType {
  InterpolationConfigType({
    @required this.inputRange,
    @required this.outputRange,
    this.curve = const _Linear._(),
    this.extrapolate,
    this.extrapolateLeft = ExtrapolateType.extend,
    this.extrapolateRight = ExtrapolateType.extend,
  })  : assert(inputRange != null),
        assert(outputRange != null),
        assert(inputRange.length >= 2),
        assert(outputRange.length >= 2),
        assert(inputRange.length == outputRange.length);

  final List<double> inputRange;
  final List<double> outputRange;
  final Curve curve;
  final ExtrapolateType extrapolate;
  final ExtrapolateType extrapolateLeft;
  final ExtrapolateType extrapolateRight;
}

///
/// 找到输入值所属范围
///
int findRange(double input, List<double> inputRange) {
  int i;
  for (i = 1; i < inputRange.length - 1; ++i) {
    if (inputRange[i] >= input) {
      break;
    }
  }
  return i - 1;
}

///
/// 创造插值函数
///
DoubleCallBack<double> createInterpolation(InterpolationConfigType config) {
  return (double input) {
    int range = findRange(input, config.inputRange);

    ExtrapolateType extrapolateLeft = config.extrapolateLeft;
    if (config.extrapolate != null) extrapolateLeft = config.extrapolate;

    ExtrapolateType extrapolateRight = config.extrapolateRight;
    if (config.extrapolate != null) extrapolateRight = config.extrapolate;
    ///
    /// 由于flutter中Curve.transform使用assert限制在0-1之间
    /// 所以其ExtrapolateType固定设置为clamp，此处于React Native
    /// 中不同
    ///
    return interpolate(
      input: input,
      inputMin: config.inputRange[range],
      inputMax: config.inputRange[range + 1],
      outputMin: config.outputRange[range],
      outputMax: config.outputRange[range + 1],
      curve: config.curve,
      extrapolateLeft: ExtrapolateType.clamp,
      extrapolateRight: ExtrapolateType.clamp,
    );
  };
}

///
/// 插值计算实现
///
double interpolate({
  double input,
  double inputMin,
  double inputMax,
  double outputMin,
  double outputMax,
  Curve curve = const _Linear._(),
  ExtrapolateType extrapolateLeft,
  ExtrapolateType extrapolateRight,
}) {
  double result = input;

  // Extrapolate
  if (result < inputMin) {
    if (extrapolateLeft == ExtrapolateType.identity) {
      return result;
    } else if (extrapolateLeft == ExtrapolateType.clamp) {
      result = inputMin;
    } else if (extrapolateLeft == ExtrapolateType.extend) {
      // noop
    }
  }

  if (result > inputMax) {
    if (extrapolateRight == ExtrapolateType.identity) {
      return result;
    } else if (extrapolateRight == ExtrapolateType.clamp) {
      result = inputMax;
    } else if (extrapolateRight == ExtrapolateType.extend) {
      // noop
    }
  }

  if (outputMin == outputMax) {
    return outputMin;
  }

  if (inputMin == inputMax) {
    if (input <= inputMin) {
      return outputMin;
    }
    return outputMax;
  }

  // Input Range
  if (inputMin == -double.infinity) {
    result = -result;
  } else if (inputMax == double.infinity) {
    result = result - inputMin;
  } else {
    result = (result - inputMin) / (inputMax - inputMin);
  }

  // Easing
  if(curve == null)curve = _Linear._();
  result = curve.transform(result);

  // Output Range
  if (outputMin == -double.infinity) {
    result = -result;
  } else if (outputMax == double.infinity) {
    result = result + outputMin;
  } else {
    result = result * (outputMax - outputMin) + outputMin;
  }

  return result;
}
