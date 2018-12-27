import 'package:flutter/material.dart';
import 'package:agent76/menu/item.dart';
import 'package:agent76/menu/sliding_overlay.dart';
import 'package:agent76/menu/controller.dart';
import 'package:agent76/menu/menu_container.dart';

MenuController menuController;
MenuItem menuItem ;
List<MenuItem> menuList;

class MenuWidget extends StatefulWidget {

  final List<MenuItem>  items;
  final String          backgroundImage;

  MenuWidget({
    this.items,
    this.backgroundImage,
  });

  @override
  _MenuWidgetState createState() => new _MenuWidgetState();
}


class _MenuWidgetState extends State<MenuWidget> {

  MenuContainer menuContainer;
  MenuSlideView zoomSlideView;

  @override
  void initState(){
    super.initState();
    menuItem = widget.items.first;
    menuList = widget.items;
    zoomSlideView = new MenuSlideView();
    menuContainer = new MenuContainer(
        backgroundImage: widget.backgroundImage
    );
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        menuContainer,
        zoomSlideView,
      ],
    );
  }
}