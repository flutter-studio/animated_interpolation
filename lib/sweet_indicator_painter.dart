import 'smart_tabbar.dart';
import 'package:flutter/material.dart';
import 'animated_interpolation.dart';
///
///
/// 一个好看的IndicatorPainter，
/// 放入SmartTabBar的indicatorBuilder可观察到结果
class SweetIndicatorPainter extends IndicatorPainter {
  SweetIndicatorPainter({
    @required TabController controller,
    @required Decoration indicator,
    @required TabBarIndicatorSize indicatorSize,
    @required List<GlobalKey> tabKeys,
    IndicatorPainter old,
  }) : super(
            controller: controller,
            indicator: indicator,
            indicatorSize: indicatorSize,
            tabKeys: tabKeys,
            old: old);

  BoxPainter _painter;
  bool _needsPaint = false;
  void markNeedsPaint() {
    _needsPaint = true;
  }

  @override
  void dispose() {
    _painter?.dispose();
  }

  Rect indicatorRect(Size tabBarSize, int tabIndex) {
    assert(currentTabOffsets != null);
    assert(currentTextDirection != null);
    assert(currentTabOffsets.isNotEmpty);
    assert(tabIndex >= 0);
    assert(tabIndex <= maxTabIndex);
    double tabLeft, tabRight;
    switch (currentTextDirection) {
      case TextDirection.rtl:
        tabLeft = currentTabOffsets[tabIndex + 1];
        tabRight = currentTabOffsets[tabIndex];
        break;
      case TextDirection.ltr:
        tabLeft = currentTabOffsets[tabIndex];
        tabRight = currentTabOffsets[tabIndex + 1];
        break;
    }
    double delta = (tabRight - tabLeft - 20) / 2;
    tabLeft += delta;
    tabRight -= delta;

    double getDelta(int tabIndex) {
      final double _tabLeft = currentTabOffsets[tabIndex];
      final double _tabRight = currentTabOffsets[tabIndex + 1];
      return (_tabRight - _tabLeft - 20) / 2;
    }

    double value = controller.animation.value;
    int step = (tabIndex - controller.previousIndex).abs();
    if (value == tabIndex)
      return Rect.fromLTRB(tabLeft, 0.0, tabRight, tabBarSize.height);
    //return Rect.fromLTWH(tabLeft, 0.0, tabRight - tabLeft, tabBarSize.height);
    else if (value > tabIndex.toDouble()) {
      return Rect.fromLTRB(
          tabLeft +
              (currentTabOffsets[tabIndex + step] -
                      tabLeft +
                      getDelta(tabIndex + step)) *
                  InterpolationTween(
                    inputRange: [
                      tabIndex.toDouble(),
                      tabIndex.toDouble() + step/2.0,
                      tabIndex.toDouble() + step
                    ],
                    outputRange: [0, 0, 1],
                  ).evaluate(
                    controller.animation,
                  ),
          0.0,
          tabRight +
              (currentTabOffsets[tabIndex + step + 1] -
                      tabRight -
                      getDelta(tabIndex + step)) *
                  InterpolationTween(
                    inputRange: [
                      tabIndex.toDouble(),
                      tabIndex.toDouble() + step/2,
                      tabIndex.toDouble() + step
                    ],
                    outputRange: [0, 1, 1],
                  ).evaluate(
                    controller.animation,
                  ),
          tabBarSize.height);
    } else
      return Rect.fromLTRB(
          tabLeft +
              (currentTabOffsets[tabIndex - step] -
                      tabLeft +
                      getDelta(tabIndex - step)) *
                  InterpolationTween(
                    inputRange: [
                      tabIndex.toDouble() - step,
                      tabIndex.toDouble() - step/2,
                      tabIndex.toDouble(),
                    ],
                    outputRange: [1, 1, 0],
                  ).evaluate(
                    controller.animation,
                  ),
          0.0,
          tabRight +
              (currentTabOffsets[tabIndex] -
                      tabRight -
                      getDelta(tabIndex - step)) *
                  InterpolationTween(
                    inputRange: [
                      tabIndex.toDouble() - step,
                      tabIndex.toDouble() - step/2,
                      tabIndex.toDouble(),
                    ],
                    outputRange: [1, 0, 0],
                  ).evaluate(
                    controller.animation,
                  ),
          tabBarSize.height);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _needsPaint = false;
    _painter ??= indicator.createBoxPainter(markNeedsPaint);
    final int currentIndex = controller.index;
    Rect preRect = indicatorRect(size, currentIndex);
    final ImageConfiguration configuration = ImageConfiguration(
      size: preRect.size,
      textDirection: currentTextDirection,
    );
    _painter.paint(canvas, preRect.topLeft, configuration);
  }

  @override
  bool shouldRepaint(IndicatorPainter old) {
    return _needsPaint || super.shouldRepaint(old);
  }
}
