import 'package:flutter/material.dart';
import 'animated_interpolation.dart';

class AnimatedConfig {
  AnimatedConfig({
    this.opacity,
    this.scale,
    this.translateX,
    this.translateY,
    this.skewX,
    this.skewY,
    this.rotateX,
    this.rotateY,
    this.scaleX,
    this.scaleY,
    this.rotate,
  });
  final double opacity;
  final double scale;
  final double translateX;
  final double translateY;
  final double skewX;
  final double skewY;
  final double rotateX;
  final double rotateY;
  final double scaleX;
  final double scaleY;
  final double rotate;
}

enum AnimatedType { opacity, scale, translateX, translateY, skewX, skewY, rotateX, rotateY, scaleX, scaleY, rotate }

const Duration _kDefaultDuration = const Duration(seconds: 1);

class SmartAnimatedWidget extends StatefulWidget {
  SmartAnimatedWidget({
    Key key,
    this.from,
    this.to,
    this.configMap,
    this.child,
    this.curve,
    this.duration = _kDefaultDuration,
    this.autoPlay = false,
    this.onTransitionEnd,
  }) : super(key: key);
  final AnimatedConfig from;
  final AnimatedConfig to;
  final Map<double, AnimatedConfig> configMap;
  final Widget child;
  final Curve curve;
  final Duration duration;
  final bool autoPlay;
  final VoidCallback onTransitionEnd;

  @override
  SmartAnimatedWidgetState createState() => SmartAnimatedWidgetState();
}

class SmartAnimatedWidgetState extends State<SmartAnimatedWidget> with SingleTickerProviderStateMixin<SmartAnimatedWidget> {
  AnimationController _controller;
  Animation<double> _animation;
  bool _animating = false; //是否正在动画

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    if (widget.autoPlay == true) {
      _controller.forward();
      _animating = true;
    }
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onTransitionEnd != null) widget.onTransitionEnd();
        _animating = false;
      }
    });
  }

  reset() {
    _controller?.reset();
  }

  animate() {
    if (_animating == false) {
      _controller.reset();
      _controller.forward();
      _animating = true;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget child) => this.buildWidget(child),
      child: widget.child,
    );
  }

  Widget buildWidget(Widget _child) {
    InterpolationTween opacityTween;
    InterpolationTween scaleXTween;
    InterpolationTween scaleYTween;
    InterpolationTween translateXTween;
    InterpolationTween translateYTween;
    InterpolationTween skewXTween;
    InterpolationTween skewYTween;
    InterpolationTween rotateXTween;
    InterpolationTween rotateYTween;
    List<double> inputRange = [0, 1];
    if (widget.from != null && widget.to != null) {
      AnimatedConfig fc = widget.from;
      AnimatedConfig tc = widget.to;
      scaleXTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.scaleX ?? fc.scale ?? 1, tc.scaleX ?? tc.scale ?? 1], curve: widget.curve);
      scaleYTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.scaleY ?? fc.scale ?? 1, tc.scaleY ?? tc.scale ?? 1], curve: widget.curve);
      translateXTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.translateX ?? 0, tc.translateX ?? 0], curve: widget.curve);
      translateYTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.translateY ?? 0, tc.translateY ?? 0], curve: widget.curve);
      skewXTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.skewX ?? 0, tc.skewX ?? 0], curve: widget.curve);
      skewYTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.skewY ?? 0, tc.skewY ?? 0], curve: widget.curve);
      rotateXTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.rotateX ?? fc.rotate ?? 0, tc.rotateX ?? tc.rotate ?? 0], curve: widget.curve);
      rotateYTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.rotateY ?? fc.rotate ?? 0, tc.rotateY ?? tc.rotate ?? 0], curve: widget.curve);
      opacityTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.opacity ?? 1, tc.opacity ?? 1], curve: widget.curve);
    }
    if (widget.configMap != null) {
      List<double> scaleXOutRange = [], scaleXInputRange = [];
      List<double> scaleYOutRange = [], scaleYInputRange = [];
      List<double> translateXOutRange = [], translateXInputRange = [];
      List<double> translateYOutRange = [], translateYInputRange = [];
      List<double> skewXOutRange = [], skewXInputRange = [];
      List<double> skewYOutRange = [], skewYInputRange = [];
      List<double> rotateXOutRange = [], rotateXInputRange = [];
      List<double> rotateYOutRange = [], rotateYInputRange = [];
      List<double> opacityOutRange = [], opacityInputRange = [];
      List<double> keysList = widget.configMap.keys.toList();
      Map<double, AnimatedConfig> configs = widget.configMap;
      keysList.sort(); //从小到大排序
      for (int i = 0; i < keysList.length; i++) {
        double key = keysList.elementAt(i);
        AnimatedConfig config = configs[key];
        if (config.scaleX != null || config.scale != null) {
          scaleXInputRange.add(key);
          scaleXOutRange.add(config.scaleX ?? config.scale);
        }
        if (config.scaleY != null || config.scale != null) {
          scaleYInputRange.add(key);
          scaleYOutRange.add(config.scaleY ?? config.scale);
        }

        if (config.translateX != null) {
          translateXInputRange.add(key);
          translateXOutRange.add(config.translateX);
        }
        if (config.translateY != null) {
          translateYInputRange.add(key);
          translateYOutRange.add(config.translateY);
        }
        if (config.skewX != null) {
          skewXInputRange.add(key);
          skewXOutRange.add(config.skewX);
        }
        if (config.skewY != null) {
          skewYInputRange.add(key);
          skewYOutRange.add(config.skewY);
        }
        if (config.rotateX != null || config.rotate != null) {
          rotateXInputRange.add(key);
          rotateXOutRange.add(config.rotateX ?? config.rotate);
        }
        if (config.rotateY != null || config.rotate != null) {
          rotateYInputRange.add(key);
          rotateYOutRange.add(config.rotateY ?? config.rotate);
        }
        if (config.opacity != null) {
          opacityInputRange.add(key);
          opacityOutRange.add(config.opacity);
        }
      }

      ///获取默认的输入
      List<double> _defaultIR(List<double> ir) => ir.length > 0 ? ir : [0, 1];
      Map<AnimatedType, double> _defaultORMap = {
        AnimatedType.opacity: 1,
        AnimatedType.scale: 1,
        AnimatedType.translateX: 0,
        AnimatedType.translateY: 0,
        AnimatedType.skewX: 0,
        AnimatedType.skewY: 0,
        AnimatedType.rotateX: 0,
        AnimatedType.rotateY: 0,
        AnimatedType.scaleY: 1,
        AnimatedType.scaleX: 1
      };

      ///获取默认的输出
      List<double> _defaultOR(List<double> or, AnimatedType type) => or.length > 0 ? or : [_defaultORMap[type], _defaultORMap[type]];
      scaleXTween =
          InterpolationTween(inputRange: _defaultIR(scaleXInputRange), outputRange: _defaultOR(scaleXOutRange, AnimatedType.scaleX), curve: widget.curve);
      scaleYTween =
          InterpolationTween(inputRange: _defaultIR(scaleYInputRange), outputRange: _defaultOR(scaleYOutRange, AnimatedType.scaleY), curve: widget.curve);
      translateXTween = InterpolationTween(
          inputRange: _defaultIR(translateXInputRange), outputRange: _defaultOR(translateXOutRange, AnimatedType.translateX), curve: widget.curve);
      translateYTween = InterpolationTween(
          inputRange: _defaultIR(translateYInputRange), outputRange: _defaultOR(translateYOutRange, AnimatedType.translateY), curve: widget.curve);
      skewXTween = InterpolationTween(inputRange: _defaultIR(skewXInputRange), outputRange: _defaultOR(skewXOutRange, AnimatedType.skewX), curve: widget.curve);
      skewYTween = InterpolationTween(inputRange: _defaultIR(skewYInputRange), outputRange: _defaultOR(skewYOutRange, AnimatedType.skewY), curve: widget.curve);
      rotateXTween =
          InterpolationTween(inputRange: _defaultIR(rotateXInputRange), outputRange: _defaultOR(rotateXOutRange, AnimatedType.rotateX), curve: widget.curve);
      rotateYTween =
          InterpolationTween(inputRange: _defaultIR(rotateYInputRange), outputRange: _defaultOR(rotateYOutRange, AnimatedType.rotateY), curve: widget.curve);
      opacityTween =
          InterpolationTween(inputRange: _defaultIR(opacityInputRange), outputRange: _defaultOR(opacityOutRange, AnimatedType.opacity), curve: widget.curve);
    }

    return Transform(
      transform: Matrix4.diagonal3Values(
        scaleXTween.evaluate(_animation),
        scaleYTween.evaluate(_animation),
        1.0,
      ),
      alignment: Alignment.center,
      child: Transform.translate(
        offset: Offset(
          translateXTween.evaluate(_animation),
          translateYTween.evaluate(_animation),
        ),
        child: Transform(
          transform: Matrix4.skew(
            skewXTween.evaluate(_animation),
            skewYTween.evaluate(_animation),
          ),
          alignment: Alignment.center,
          child: Transform(
            transform: Matrix4.identity()

              /// 设置perspective，详情见https://medium.com/flutter/perspective-on-flutter-6f832f4d912e
              ..setEntry(3, 2, 0.001)
              ..rotateY(rotateYTween.evaluate(_animation))
              ..rotateX(rotateXTween.evaluate(_animation)),
            alignment: Alignment.center,
            child: Opacity(
              opacity: opacityTween.evaluate(_animation),
              child: _child,
            ),
          ),
        ),
      ),
    );
  }
}
