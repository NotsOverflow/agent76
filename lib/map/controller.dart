import 'package:flutter/material.dart';
import 'package:agent76/map/states.dart';

class MapController extends ChangeNotifier{

  final TickerProvider vsync;
  final AnimationController _animationController;

  MapState state       = MapState.closed;

  MapController({
    this.vsync
  }) : _animationController = new AnimationController(vsync: vsync){
    _animationController
    ..duration = const Duration(milliseconds: 250)
    ..addListener((){
      notifyListeners();
    })
    ..addStatusListener((AnimationStatus status){
      switch (status){
        case AnimationStatus.forward:
          state = MapState.opening;
          break;
        case AnimationStatus.reverse:
          state = MapState.closing;
          break;
        case AnimationStatus.completed:
          state = MapState.open;
          break;
        case AnimationStatus.dismissed:
          state = MapState.closed;
          break;
      }
      notifyListeners();
    });
  }

  @override
  dispose(){
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen{
    return 1.0 - _animationController.value;
  }

  open(){
    _animationController.forward();
  }

  close(){
    _animationController.reverse();
  }

  toggle(){
    print("map controller");
    if (state == MapState.open){
      close();
    }
    else if(state == MapState.closed){
      open();
    }
  }

}