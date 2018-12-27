

import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {

  final String title;
  final Color  color;
  final Function onTap;

  CardButton({@required this.title, @required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 45.0,
      child: Padding(
        padding: const EdgeInsets.only(left:16.0,right: 16.0,top: 5.0,bottom: 5.0),
        child: new ClipRRect(
          borderRadius: new BorderRadius.circular(50.0),
          child: new InkWell(
            onTap: onTap,
            child: new Container(
              color: color,
              child: new Center(
                  child: new Text(
                      title,
                    style: new TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
