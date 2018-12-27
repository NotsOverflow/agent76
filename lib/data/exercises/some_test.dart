import 'package:agent76/cards/exercises.dart';
import 'package:flutter/material.dart';


ExercisesList ex1 = new ExercisesList (
  uid: "first_town_beginier",
  title: "Beginer",
  color: Colors.greenAccent,
  list: <WidgetBuilder>[
    (BuildContext context) {return new Container(color: Colors.blue);},
    (BuildContext context) {return new Container(color: Colors.orange);},
    (BuildContext context) {return new Container(color: Colors.green);},
  ],
);


ExercisesList  ex2 = new ExercisesList (
  uid: "first_tow_intermediate",
  title: "Intermediate",
  color: Colors.cyanAccent,
  list: <WidgetBuilder>[
        (BuildContext context) {return new Container(color: Colors.purple);},
        (BuildContext context) {return new Container(color: Colors.white);},
        (BuildContext context) {return new Container(color: Colors.red);},
  ],
);