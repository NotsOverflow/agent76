import 'package:flutter/material.dart';

class MenuTitle extends StatefulWidget {
  final String title;
  MenuTitle({this.title});

  @override
  _MenuTitleState createState() => _MenuTitleState();
}

class _MenuTitleState extends State<MenuTitle>{


  @override
  Widget build(BuildContext context) {

    return new OverflowBox(
          maxWidth: double.infinity,
          alignment: Alignment.bottomLeft,
          child: new Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Text(
              widget.title,
              style: new TextStyle(
                color: const Color(0x88444444),
                fontSize: 40.0,
                fontFamily: 'mermaid',
              ),
              textAlign: TextAlign.left,
              softWrap: false,
            ),
          ),
        );
    }
}
