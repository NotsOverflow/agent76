import 'package:flutter/material.dart';
import 'package:agent76/map/ville.dart';

class OverlayView extends StatefulWidget {

  final Ville town;
  final Function toggle;
  OverlayView({Key key, this.town, this.toggle}) : super(key: key);

  @override
  _OverlayViewState createState() => new _OverlayViewState();
}

class _OverlayViewState extends State<OverlayView> {


  void myOnTap(){
    widget.toggle();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final overlayWidth = screenSize.width - ( screenSize.width / 15 );
    final transparentHeight = screenSize.height / 5;
    final barHeight = screenSize.height / 30;
    final contentHeight = screenSize.height - transparentHeight;

    return new Stack(
          children: <Widget>[
            new Material(
              color: Colors.transparent,
              child: new InkWell(
                onTap: (){ myOnTap(); },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.transparent,
                ),
              ),
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                width: overlayWidth,
                height: contentHeight + barHeight,
                decoration: new BoxDecoration(
                  color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                  borderRadius: new BorderRadius.only(
                    topLeft:  const  Radius.circular(15.0),
                    topRight: const  Radius.circular(15.0),
                  ),
                  boxShadow: [
                    new BoxShadow(
                      color: const Color(0x55000000),
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 15.0,
                      spreadRadius: 0.3,
                    ),
                  ],
                ),
                child: new Column(
                  children: <Widget>[
                    new Material(
                      color: Colors.transparent,
                      child:  new InkWell(
                        onTap: (){ myOnTap(); },
                        child : new Container(
                          height: barHeight,
                          width: double.infinity,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Container(
                        height: contentHeight,
                        child: widget.town.content(context)
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
  }
}