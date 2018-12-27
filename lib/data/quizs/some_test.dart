import 'package:flutter/material.dart';
import 'package:agent76/cards/exercises.dart';


ExercisesList  quiz1 = new ExercisesList (
  uid: "first_town_quiz",
  title: "Quiz",
  color: Colors.blue,
  list: <WidgetBuilder>[
        (BuildContext context) {return new Container(color: Colors.purple);},
        (BuildContext context) {return new Container(color: Colors.white);},
        (BuildContext context) {return new Container(color: Colors.red);},
  ],
);