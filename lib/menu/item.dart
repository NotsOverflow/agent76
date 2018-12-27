import 'package:flutter/material.dart';

class MenuItem {
  final String            title;
  final String            background;
  bool                    isSelected;
  final ColorSwatch       colorSwatch;
  final WidgetBuilder     content;

  MenuItem({
    this.title,
    this.background,
    this.isSelected,
    this.colorSwatch,
    this.content,
  });
}