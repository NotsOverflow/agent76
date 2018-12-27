import 'package:flutter/material.dart';

class Ville{

  final int               posX;
  final int               posY;
  final String            iconComplete;
  final String            iconIncomplete;
  final String            title;
  final WidgetBuilder     content;
  bool                    isSelected;

  Ville({this.posX,this.posY,this.iconComplete,this.iconIncomplete, this.title, this.content,this.isSelected});
}