import 'package:agent76/cards/exercises.dart';
import 'package:flutter/material.dart';
import 'package:agent76/map/region.dart';
import 'package:agent76/map/ville.dart';
import 'package:agent76/cards/cards_widget.dart';
import 'package:agent76/data/cards.dart';
import 'package:agent76/data/exercises/some_test.dart';
import 'package:agent76/data/quizs/some_test.dart';

List<Region> mapData = <Region>[
  new Region(
    towns: <Ville>[
      new Ville(
        isSelected: false,
        posX: 1,
        posY: 1,
        iconComplete: "assets/lol.png",
        iconIncomplete: "assets/lol.png",
        content: (BuildContext context) {return new CardsWidget(
            cards: card1,
            currentIndex: 0,
            listOfExercisesList: <ExercisesList>[
              ex1,
              ex2,
              quiz1,
            ],
          );
        },
        title: "new town",

      ),
      new Ville(
        isSelected: false,
        posX: 2,
        posY: 5,
        iconComplete: "assets/lol.png",
        iconIncomplete: "assets/lol.png",
        content: (BuildContext context) {return new Container(color: Colors.cyan,);},
        title: "new town",
      ),
      new Ville(
        isSelected: false,
        posX: 0,
        posY: 3,
        iconComplete: "assets/lol.png",
        iconIncomplete: "assets/lol.png",
        content: (BuildContext context) {return new Container();},
        title: "new town",
      ),
    ],
    backgroundComplete: "assets/left.png",
    backgroundIncomplete: "assets/left.png",
  ),
  new Region(
    towns: <Ville>[
      new Ville(
        isSelected: false,
        posX: 2,
        posY: 0,
        iconComplete: "assets/lol.png",
        iconIncomplete: "assets/lol.png",
        content: (BuildContext context) {return new Container();},
        title: "new town",
      ),
      new Ville(
        isSelected: false,
        posX: 0,
        posY: 2,
        iconComplete: "assets/lol.png",
        iconIncomplete: "assets/lol.png",
        content: (BuildContext context) {return new Container();},
        title: "new town",
      ),
      new Ville(
        isSelected: false,
        posX: 2,
        posY: 5,
        iconComplete: "assets/lol.png",
        iconIncomplete: "assets/lol.png",
        content: (BuildContext context) {return new Container();},
        title: "new town",
      ),
      new Ville(
        isSelected: false,
        posX: 1,
        posY: 2,
        iconComplete: "assets/lol.png",
        iconIncomplete: "assets/lol.png",
        content: (BuildContext context) {return new Container();},
        title: "new town",
      ),
    ],
    backgroundComplete: "assets/middle.png",
    backgroundIncomplete: "assets/middle.png",
  ),
  new Region(
    towns: <Ville>[
      new Ville(
        isSelected: false,
        posX: 0,
        posY: 1,
        iconComplete: "assets/lol.png",
        iconIncomplete: "assets/lol.png",
        content: (BuildContext context) {return new Container();},
        title: "new town",
      ),
      new Ville(
        isSelected: false,
        posX: 1,
        posY: 5,
        iconComplete: "assets/lol.png",
        iconIncomplete: "assets/lol.png",
        content: (BuildContext context) {return new Container();},
        title: "new town",
      ),
    ],
    backgroundComplete: "assets/right.png",
    backgroundIncomplete: "assets/right.png",
  ),
];