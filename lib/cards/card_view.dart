import 'package:flutter/material.dart';


class CardView extends StatefulWidget {

  final String image;
  final String text;

  CardView({@required this.image,@required this.text});
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10.0),
        boxShadow: [
          new BoxShadow(
            color: const Color(0x11000000),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: new ClipRRect(
        borderRadius: new BorderRadius.circular(10.0),
        child: new Material(
          child: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildBackGround(),
              _buildTopShadow(),
              _buildSynopsis(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopShadow(){
    return new FractionallySizedBox(
        widthFactor: 1.0,
        heightFactor: 0.3,
        alignment: Alignment.topCenter,
        child: new Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(10.0),
            gradient: new LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ]
            ),
          ),
      ),
    );
  }

  Widget _buildBackGround() {
    return new Image.asset(
      widget.image,
      fit: BoxFit.cover,
    );
  }

  Widget _buildSynopsis() {
    return new Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ]
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child:
            new Text(
              widget.text,
              textAlign: TextAlign.center,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            )
      ),
    );
  }
}
