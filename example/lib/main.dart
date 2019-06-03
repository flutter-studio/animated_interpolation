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
  @override
  Widget build(BuildContext context) {
    GlobalKey<SmartAnimatedWidgetState> key = GlobalKey<SmartAnimatedWidgetState>();

    return GestureDetector(
      onTap: () {
        key.currentState.animate();
        print("**************tap*************");
      },
      child: SmartAnimatedWidget(
          configMap: slideOutDown,
          key: key,
          autoPlay: false,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            width: double.infinity,
            color: Colors.red.shade300,
            child: Center(
              child: Text("BounceIn"),
            ),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Column(
        children: <Widget>[
          AnimatedCell(),
        ],
      ),
    );
  }
}
