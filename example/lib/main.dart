import 'package:flutter/material.dart';
import 'parallel_animation_logo.dart';
import 'package:animated_interpolation/animated_interpolation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class AnimatedCell extends StatelessWidget {
  AnimatedCell({this.configMap,this.text,this.autoPlay = false,this.curve});
  final Map<double,AnimatedConfig> configMap;
  final String text;
  final bool autoPlay;
  final Curve curve;
  @override
  Widget build(BuildContext context) {
    GlobalKey<SmartAnimatedWidgetState> key = GlobalKey<SmartAnimatedWidgetState>();

    return GestureDetector(
      onTap: () {
        key.currentState.animate();
      },
      child: SmartAnimatedWidget(
          configMap: configMap,
          key: key,
          autoPlay: autoPlay,
          curve: curve,
          onTransitionEnd: (){
            Future.delayed(Duration(milliseconds: 200),(){
              if(autoPlay == false)key.currentState.reset();
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            width: double.infinity,
            color: Colors.red.shade300,
            child: Center(
              child: Text(text),
            ),
          )),
    );
  }
}

List<AnimatedCell> cells= [
  AnimatedCell(configMap: fadeInDown,text: "fadeInDown",autoPlay: true,),
  AnimatedCell(configMap: fadeInUp,text: "fadeInUp",autoPlay: true,),
  AnimatedCell(configMap: fadeInLeft,text: "fadeInLeft",autoPlay: true,),
  AnimatedCell(configMap: fadeInRight,text: "fadeInRight",autoPlay: true,),
  AnimatedCell(configMap: bounceIn,text: "bounceIn",autoPlay: true,),
  AnimatedCell(configMap: bounceInUp,text: "bounceInUp",autoPlay: true,),
  AnimatedCell(configMap: bounceInDown,text: "bounceInDown",autoPlay: true,),
  AnimatedCell(configMap: bounceInLeft,text: "bounceInLeft",autoPlay: true,),
  AnimatedCell(configMap: bounceInRight,text: "bounceInRight",autoPlay: true,),
  AnimatedCell(configMap: bounceOut,text: "bounceout"),
  AnimatedCell(configMap: bounceOutDown,text: "bounceOutDown"),
  AnimatedCell(configMap: bounceOutUp,text: "bounceOutUp"),
  AnimatedCell(configMap: bounceOutLeft,text: "bounceOutLeft"),
  AnimatedCell(configMap: bounceOutRight,text: "bounceOutRight"),
  AnimatedCell(configMap: slideInUp,text: "slideInUp",autoPlay: true,),
  AnimatedCell(configMap: slideInDown,text: "slideInDown",autoPlay: true,),
  AnimatedCell(configMap: slideInLeft,text: "slideInLeft",autoPlay: true,),
  AnimatedCell(configMap: slideInRight,text: "slideInRight",autoPlay: true,),
  AnimatedCell(configMap: slideOutUp,text: "slideOutUp"),
  AnimatedCell(configMap: slideOutDown,text: "slideOutDown"),
  AnimatedCell(configMap: slideOutLeft,text: "slideOutLeft"),
  AnimatedCell(configMap: slideOutRight,text: "slideOutRight"),
  AnimatedCell(configMap: lightSpeedIn,text: "lightSpeedIn",autoPlay: true,curve: lightSpeedInCurve,),
  AnimatedCell(configMap: lightSpeedOut,text: "lightSpeedOut",curve: lightSpeedOutCurve,),
  AnimatedCell(configMap: flipInX,text: "flipInX",autoPlay: true,curve: flipInCurve,),
  AnimatedCell(configMap: flipInY,text: "flipInX",autoPlay: true,curve: flipInCurve,),
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: cells,
        ),
      ),
    );
  }
}
