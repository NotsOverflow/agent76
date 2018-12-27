import 'package:flutter/material.dart';
import 'package:agent76/map/controller.dart';
import 'package:agent76/views/overlay.dart';
import 'package:agent76/map/transform_warp.dart';
import 'package:agent76/map/states.dart';
import 'package:agent76/map/map_widget.dart';

class MapOverlay extends StatefulWidget {

  @override
  _MapOverlayState createState() => _MapOverlayState();
}

class _MapOverlayState extends State<MapOverlay> with TickerProviderStateMixin{

  MapController controller;

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

    controller = new MapController(
      vsync: this,
    )
    ..addListener(() => setState((){}));
    overlayController = controller;
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
      case MapState.closed:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MapState.open:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MapState.opening:
        slidePercent = slideOutCurve.transform(controller.percentOpen);
        scalePercent = scaleDownCurve.transform(controller.percentOpen);
        break;
      case MapState.closing:
        slidePercent = slideInCurve.transform(controller.percentOpen);
        scalePercent = scaleUpCurve.transform(controller.percentOpen);
    }

    slideAmount = screenSize.height * slidePercent;
    contentScale = 1.0 - ( 0.5 * scalePercent);
    cornerRadius = 10.0 * controller.percentOpen;
    bool isClosed = controller.state == MapState.closed;
    return new MapTransformWarp(
      slideAmount: slideAmount,
      contentScale: contentScale,
      cornerRadius: cornerRadius,
      child: new OverlayView(
        town: currentTown,
        toggle: controller.toggle,
      ),
      isClosed: isClosed,
    );
  }
}
