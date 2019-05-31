English | [简体中文](./README_zh-CN.md)

# animated_interpolation

[![pub package](https://img.shields.io/pub/v/animated_interpolation.svg)](https://pub.dartlang.org/packages/animated_interpolation)

A flutter interpolation animation inspired by the React Native interpolation animation


## Usage
To use this plugin, add `animated_interpolation` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Example

``` dart
import 'package:flutter/material.dart';
import 'package:animated_interpolation/animated_interpolation.dart';
class AnimatedLogo1 extends AnimatedWidget {
  // The Tweens are static because they don't change.
  static final _opacityTween = new InterpolationTween<double>(inputRange: [0,0.2,1], outputRange: [0,0.5,1]);
  static final _sizeTween = new InterpolationTween(inputRange: [0,0.2,1], outputRange: [0,250,300]);

  AnimatedLogo1({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: new FlutterLogo(),
        ),
      ),
    );
  }
}

class LogoApp4 extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp4> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);


    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  Widget build(BuildContext context) {
    return new AnimatedLogo1(animation: animation);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
```
### Special thanks to react native vector ICONS library and its authors
