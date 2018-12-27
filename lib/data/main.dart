import 'package:flutter/material.dart';
import 'package:agent76/menu/item.dart';
import 'package:agent76/data/map.dart';
import 'package:agent76/map/map_widget.dart';
import 'package:agent76/views/countdown.dart';


final String backgroundTextData = "hellow";

final String backgroundImageData = "assets/dark-stone.jpg";

final List<MenuItem> itemsData = [
  new MenuItem(
    title: "HOME",
    background: "assets/home.jpg",
    isSelected: true,
    colorSwatch: ColorSwatch(0xFFFF0000, {50: Color(0xFFFCE4EC), 300: Color(0xFFF06292), 900: Color(0xFF880E4F)}),
    content: (BuildContext context) {return new MapMenu(items: mapData);},
  ),
  new MenuItem(
    title: "OTHER1",
    background: "assets/home.jpg",
    isSelected: false,
    colorSwatch: ColorSwatch(0xFFFF0000, {50: Color(0xFFFCE4EC), 300: Color(0xFFF06292), 900: Color(0xFF880E4F)}),
    content: (BuildContext context) {return new CountDown(startingCount: 10, childWidget: 
      (BuildContext context){
        return new Container(
          color: Colors.green,
        );
      }
    ,);},
  ),
  new MenuItem(
    title: "OTHER2",
    background: "assets/home.jpg",
    isSelected: false,
    colorSwatch: ColorSwatch(0xFFFF0000, {50: Color(0xFFFCE4EC), 300: Color(0xFFF06292), 900: Color(0xFF880E4F)}),
    content: (BuildContext context) {return new Container();},
  ),
];