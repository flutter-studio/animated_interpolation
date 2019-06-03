import 'package:flutter/material.dart';
import 'animated_interpolation.dart';

class AnimatedConfig {
  AnimatedConfig({
    this.opacity = 1,
    this.scale = 1,
    this.translateX = 0,
    this.translateY = 0,
    this.skewX = 0,
    this.skewY = 0,
    this.rotateX = 0,
    this.rotateY = 0,
  });
  final double opacity;
  final double scale;
  final double translateX;
  final double translateY;
  final double skewX;
  final double skewY;
  final double rotateX;
  final double rotateY;
}

enum AnimatedType { opacity, scale, translateX, translateY, skewX, skewY, rotateX, rotateY }

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
  }) : super(key: key);
  final AnimatedConfig from;
  final AnimatedConfig to;
  final Map<double, AnimatedConfig> configMap;
  final Widget child;
  final Curve curve;
  final Duration duration;
  final bool autoPlay;

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
        _animating = false;
      }
    });
  }

  animate({Duration duration}) {
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
    InterpolationTween scaleTween;
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
      scaleTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.scale, tc.scale], curve: widget.curve);
      translateXTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.translateX, tc.translateX], curve: widget.curve);
      translateYTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.translateY, tc.translateY], curve: widget.curve);
      skewXTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.skewX, tc.skewX], curve: widget.curve);
      skewYTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.skewY, tc.skewY], curve: widget.curve);
      rotateXTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.rotateX, tc.rotateX], curve: widget.curve);
      rotateYTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.rotateY, tc.rotateY], curve: widget.curve);
      opacityTween = InterpolationTween(inputRange: inputRange, outputRange: [fc.opacity, tc.opacity], curve: widget.curve);
    }
    if (widget.configMap != null) {
      List<double> inputRange = [];
      List<double> scaleOutRange = [];
      List<double> translateXOutRange = [];
      List<double> translateYOutRange = [];
      List<double> skewXOutRange = [];
      List<double> skewYOutRange = [];
      List<double> rotateXOutRange = [];
      List<double> rotateYOutRange = [];
      List<double> opacityOutRange = [];
      List<double> keysList = widget.configMap.keys.toList();
      keysList.sort(); //从小到大排序
      for (int i = 0; i < keysList.length; i++) {
        double key = keysList.elementAt(i);
        inputRange.add(key);
        scaleOutRange.add(widget.configMap[key].scale);
        translateXOutRange.add(widget.configMap[key].translateX);
        translateYOutRange.add(widget.configMap[key].translateY);
        skewXOutRange.add(widget.configMap[key].skewX);
        skewYOutRange.add(widget.configMap[key].skewY);
        rotateXOutRange.add(widget.configMap[key].rotateX);
        rotateYOutRange.add(widget.configMap[key].rotateY);
        opacityOutRange.add(widget.configMap[key].opacity);
      }
      scaleTween = InterpolationTween(inputRange: inputRange, outputRange: scaleOutRange, curve: widget.curve);
      translateXTween = InterpolationTween(inputRange: inputRange, outputRange: translateXOutRange, curve: widget.curve);
      translateYTween = InterpolationTween(inputRange: inputRange, outputRange: translateYOutRange, curve: widget.curve);
      skewXTween = InterpolationTween(inputRange: inputRange, outputRange: skewXOutRange, curve: widget.curve);
      skewYTween = InterpolationTween(inputRange: inputRange, outputRange: skewYOutRange, curve: widget.curve);
      rotateXTween = InterpolationTween(inputRange: inputRange, outputRange: rotateXOutRange, curve: widget.curve);
      rotateYTween = InterpolationTween(inputRange: inputRange, outputRange: rotateYOutRange, curve: widget.curve);
      opacityTween = InterpolationTween(inputRange: inputRange, outputRange: opacityOutRange, curve: widget.curve);
    }

    return Transform.scale(
      scale: scaleTween.evaluate(_animation),
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
          child: Transform(
            transform: Matrix4.rotationX(
              rotateXTween.evaluate(_animation),
            ),
            child: Transform(
              transform: Matrix4.rotationY(
                rotateYTween.evaluate(_animation),
              ),
              child: Opacity(
                opacity: opacityTween.evaluate(_animation),
                child: _child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
