import 'package:flutter/material.dart';
import 'package:agent76/menu/item.dart';
import 'package:agent76/menu/menu_widget.dart';

class MenuApp extends StatefulWidget {

  final List<MenuItem> items;
  final String backgroundText;
  final String backgroundImage;

  MenuApp({Key key, this.items, this.backgroundText, this.backgroundImage}) : super(key: key);

  @override
  _MenuAppState createState() => new _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {

  @override
  Widget build(BuildContext context) {
    return new MenuWidget(
      items: widget.items,
      backgroundImage: widget.backgroundImage,
    );
  }
}