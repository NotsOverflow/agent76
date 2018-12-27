import 'package:flutter/material.dart';

class ExerciseView extends StatefulWidget {

  final Widget child;
  final Function returnFunction;

  ExerciseView({@required this.child, @required this.returnFunction});

  @override
  _ExerciseViewState createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,bottom: 16.0, right: 16.0),
      child: new Stack(
        children: <Widget>[
          new ClipRRect(
              borderRadius: new BorderRadius.circular(10.0),
              child: widget.child
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: widget.returnFunction,
              child: Row(
                children: <Widget>[
                  new Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                  ),
                  new Text(
                    "back",
                    style: new TextStyle(
                     color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
