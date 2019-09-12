
import 'package:flutter/material.dart';
import 'package:animated_interpolation/animated_interpolation.dart';
class TabBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            SmartTabBar(
              indicatorBuilder: (context,controller,indicator,indicatorSize,tabKeys,old)=>SweetIndicatorPainter(
                controller: controller,
                indicatorSize: indicatorSize,
                indicator: indicator,
                tabKeys: tabKeys,
                old: old
              ),
              tabs: <Widget>[
                Tab(text: "1",),
                Tab(text: "2",),
                Tab(text: "3",)
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Container(),
                  Container(),
                  Container()
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
