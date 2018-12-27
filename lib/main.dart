import 'package:flutter/material.dart';
import 'package:agent76/views/app.dart';
import 'package:agent76/data/main.dart';
import 'package:agent76/tts/tts.dart';

TextToSpeechObject textToSpeechObject = new TextToSpeechObject();

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Demo",
      theme: new ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: new MenuApp(
        items: itemsData,
        backgroundText: backgroundTextData,
        backgroundImage: backgroundImageData,
      ),
    );
  }
}
