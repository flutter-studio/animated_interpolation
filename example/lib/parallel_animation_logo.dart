import 'package:flutter/material.dart';
import 'package:animated_interpolation/animated_interpolation.dart';
class AnimatedLogo1 extends AnimatedWidget {
  // The Tweens are static because they don't change.
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new InterpolationTween(inputRange: [0,0.2,1], outputRange: [0,250,300]);
  static final _colorTween = ColorInterpolationTween(inputRange: [0,0.2,1],outputRange: [Colors.white,Colors.green,Colors.red]);

  AnimatedLogo1({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
        opacity: createInterpolation(InterpolationConfigType(inputRange: [0,1], outputRange: [0.1,1]))(animation.value),
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: new FlutterLogo(),
          color: _colorTween.evaluate(animation),
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