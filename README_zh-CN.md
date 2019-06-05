[English](./README.md) | 简体中文

# animated_interpolation

[![pub package](https://img.shields.io/pub/v/animated_interpolation.svg)](https://pub.dartlang.org/packages/animated_interpolation)


<div align=start>
<img src="https://github.com/flutter-studio/animated_interpolation/blob/master/untitled.gif" width = "280" alt="图片名称" align=center />
<img src="https://github.com/flutter-studio/animated_interpolation/blob/master/untitled2.gif" width = "280" alt="图片名称" align=center />
  </div>

<br/>
<br/>

一个flutter插值动画插件，受到React Native插值动画的启发


## 使用
要使用此插件包,请将animated_interpolation作为依赖项添加到您的`pubspec.yaml`文件中,详见[dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### InterpolationTween


#### 构造器

| Parameter  |Required | Default   | Description |
| :------------ |:--------:|:---------------:| :-----|
| inputRange | YES | NULL  | 设置输入的范围,eg: ```[0,0.2,0.5,0.8,1]``` |
| outputRange |YES| NULL | 设置输入的范围 eg: ```[10,100,105,200,300]``` |
| curve |NO| ```_Linear._()``` | 设置输入输出的动画曲线 |
| extrapolate |NO| NULL | it will extrapolate the curve beyond the ranges given, but you can also have it clamp the output value |
| extrapolateLeft |NO| ExtrapolateType.extend  | It will extrapolate the curve beyond the given left range |
| extrapolateRight |NO| ExtrapolateType.extend  | It will extrapolate the curve beyond the given right range |


### SmartAnimatedWidget

#### constructor

| Parameter  |Required | Default   | Description |
| :------------ |:--------:|:---------------:| :-----|
| from | No | NULL  | 类似于css3里keyframes中的from,eg: ```AnimatedConfig(opacity: 0)``` |
| to |No| NULL | 类似于css3里keyframes中的to ,eg:```AnimatedConfig(opacity:1)```|
| configMap |NO| NULL |  类似于Css3中的keyframes,eg:```{0:AnimatedConfig(opacity:0,translateX: 200),0.2:AnimatedConfig(opacity:1,translateX:100),1:AnimatedConfig(opacity:1,translateX:0)}``` |
| curve |NO| ```_Linear._()``` | 输入输出曲线 |
| duration |NO| Duration(seconds: 1)  | 动画执行时间 |
| autoPlay |NO| false  | 动画是否自动执行 |

#### method

| method  | Description |
| :------------ |:--------:|
| animate | 执行对应的动画 |


#### configMap

已经存在的configMap如下:

* fadeInDown
* fadeInUp
* fadeInLeft
* fadeInRight
* fadeInDownBig
* fadeInUpBig
* fadeInLeftBig
* fadeInRightBig

* fadeOutDown
* fadeOutUp
* fadeOutLeft
* fadeOutRight
* fadeOutDownBig
* fadeOutUpBig
* fadeOutLeftBig
* fadeOutRightBig
<br/><br/>
 .......
更多configMap信息详见 [更多详情](https://github.com/flutter-studio/animated_interpolation/tree/master/lib)

## 示例

```
import 'package:flutter/material.dart';
import 'package:animated_interpolation/animated_interpolation.dart';
SmartAnimatedWidget(
        configMap: fadeInDown,
        autoPlay: true,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          width: double.infinity,
          color: Colors.red.shade300,
          child: Center(
            child: Text(text),
          ),
        ),
      )

```

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
