import 'package:flutter/material.dart';


class ExercisesList {

  final String uid;
  final Color color;
  final String title;
  final List<WidgetBuilder>   list;

  ExercisesList({this.uid, this.title, this.color, this.list});
}