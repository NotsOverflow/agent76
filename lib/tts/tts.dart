import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped }

class TextToSpeechObject {
  FlutterTts flutterTts ;
  TtsState ttsState;
  Future<dynamic> languages ;
  Function whenStop;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;

  Future speak(String msg, Function callback) async {
    var result = await flutterTts.speak(msg);
    if (result == 1){
      ttsState = TtsState.playing;
      whenStop = callback;
    }
  }

  Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1) {
      ttsState = TtsState.stopped;
      whenStop();
    }
  }

  TextToSpeechObject() {
    flutterTts = new FlutterTts();
    ttsState = TtsState.stopped;
    languages = flutterTts.getLanguages;
    flutterTts.setLanguage("en-US");
    flutterTts.setPitch(0.9);

    flutterTts.setStartHandler(() {
        ttsState = TtsState.playing;
    });

    flutterTts.setCompletionHandler(() {
        ttsState = TtsState.stopped;
        whenStop();
    });

    flutterTts.setErrorHandler((msg) {
        ttsState = TtsState.stopped;
        whenStop();
    });
  }



}

