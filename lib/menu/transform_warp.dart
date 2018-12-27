import 'package:flutter/material.dart';
import 'package:agent76/views/base.dart';

class MenuTransformWarp extends StatefulWidget {

  final double contentScale;
  final double slideAmount;
  final double cornerRadius;
  final BaseView child;
  final bool  isClosed;

  MenuTransformWarp({this.contentScale,this.cornerRadius,this.slideAmount,this.child,this.isClosed});

  @override
  _MenuTransformWarpState createState() => _MenuTransformWarpState();
}

class _MenuTransformWarpState extends State<MenuTransformWarp> {

  @override
  Widget build(BuildContext context) {
    return new Transform(
      transform: new Matrix4
          .translationValues(widget.slideAmount, 0.0, 0.0)
        ..scale(widget.contentScale,widget.contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: const Color(0xFF000000),
                offset: const Offset(0.0, 5.0),
                blurRadius: 20.0,
                spreadRadius: 10.0,
              ),
            ]
        ),
        child: new ClipRRect(
          borderRadius: new BorderRadius.circular(widget.cornerRadius),
          child: widget.isClosed ? widget.child : new Stack(
            children: <Widget>[
              widget.child,
              new Material(
                color: Colors.transparent,
                child: new InkWell(
                  onTap: (){
                    widget.child.toggle();
                  },
                  child: new Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
