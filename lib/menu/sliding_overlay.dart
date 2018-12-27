import 'package:flutter/material.dart';
import 'package:agent76/menu/controller.dart';
import 'package:agent76/views/base.dart';
import 'package:agent76/menu/transform_warp.dart';
import 'package:agent76/menu/states.dart';
import 'package:agent76/menu/menu_widget.dart';

class MenuSlideView extends StatefulWidget {

  @override
  _MenuSlideViewState createState() => _MenuSlideViewState();
}

class _MenuSlideViewState extends State<MenuSlideView> with TickerProviderStateMixin {

  MenuController controller;

  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve  = new Interval(0.0,1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  double slideAmount;
  double contentScale;
  double cornerRadius;

  @override
  void initState(){
    super.initState();

    controller = new MenuController(
      vsync: this,
    )
    ..addListener(() => setState((){}));

    menuController = controller;
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var slidePercent, scalePercent;
    switch(controller.state){
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(controller.percentOpen);
        scalePercent = scaleDownCurve.transform(controller.percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(controller.percentOpen);
        scalePercent = scaleUpCurve.transform(controller.percentOpen);
    }

    slideAmount = screenSize.width * 0.75 * slidePercent;
    contentScale = 1.0 - ( 0.2 * scalePercent);
    cornerRadius = 10.0 * controller.percentOpen;
    bool isClosed = controller.state == MenuState.closed;
    return new MenuTransformWarp(
      slideAmount: slideAmount,
      contentScale: contentScale,
      cornerRadius: cornerRadius,
      child: new BaseView(
        data: menuItem,
        toggle: controller.toggle,
      ),
      isClosed: isClosed,
    );
  }
}
