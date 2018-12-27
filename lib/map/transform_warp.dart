import 'package:flutter/material.dart';
import 'package:agent76/views/overlay.dart';

class MapTransformWarp extends StatefulWidget {

  final double contentScale;
  final double slideAmount;
  final double cornerRadius;
  final OverlayView child;
  final bool  isClosed;

  MapTransformWarp({this.contentScale,this.cornerRadius,this.slideAmount,this.child,this.isClosed});

  @override
  _MapTransformWarpState createState() => _MapTransformWarpState();
}

class _MapTransformWarpState extends State<MapTransformWarp> {

  @override
  Widget build(BuildContext context) {
    return new Transform(
      transform: new Matrix4
          .translationValues(0.0, widget.slideAmount, 2.0)
        ..scale(widget.contentScale,widget.contentScale),
      alignment: Alignment.bottomCenter,
      child: widget.child,
    );
  }
}
