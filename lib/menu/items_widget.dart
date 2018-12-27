import 'package:flutter/material.dart';
import 'package:agent76/menu/item.dart';
import 'package:agent76/menu/item_widget.dart';
import 'package:agent76/menu/menu_widget.dart';

class MenuItems extends StatefulWidget {
  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {

  selectMe(MenuItem item){
    menuList.forEach((element) => element.isSelected = false );
    item.isSelected = true;
    menuItem = item;
    setState((){});
    menuController.toggle();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Transform(
      transform: new Matrix4.translationValues(0.0, 105.0, 0.0),
      child: Column(
        children: menuList.map((x) => MenuItemWidget(title : x.title, isSelected: x.isSelected, onTap: (){selectMe(x);},)).toList(),
      ),
    );
  }
}

