import 'package:flutter/material.dart';
import 'package:agent76/menu/items_widget.dart';
import 'package:agent76/menu/title_widget.dart';

class MenuContainer extends StatefulWidget {

  final String backgroundImage;

  MenuContainer({Key key, this.backgroundImage}) : super(key: key);

  @override
  _MenuContainerState createState() => new _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer>{



  @override
  Widget build(BuildContext context) {
    return new Container(
          width: double.infinity,
          height: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(widget.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: new Material(
            color: Colors.transparent,
            child: new Stack(
              children: <Widget>[
                new MenuTitle(
                  title: "Logo Here",
                ),
                new MenuItems(),
              ],
            ),
          ),
        );
  }
}


