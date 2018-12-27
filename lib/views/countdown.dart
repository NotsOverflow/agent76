import 'package:flutter/material.dart';
import 'dart:math';

class CountDown extends StatefulWidget {

  final int startingCount;
  final WidgetBuilder childWidget;
  final Color color;
  final List<Color> colorList = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.orange,
  ];

  CountDown({@required this.startingCount, @required this.childWidget, this.color,});

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> with TickerProviderStateMixin{

  int currentCount;
  Random random;
  Color color;

  AnimationController switchController;
  Tween<double> switchTween = Tween( begin:0.5 , end:1.0 );
  CurvedAnimation switchAnimationCurve ;
  Animation<double> switchAnimation;

  @override
  void dispose(){
    switchController.dispose();
    super.dispose();
  }

  @override
    void initState() {
      super.initState();

      if(widget.color == null){
        random = new Random();
        random = Random(random.nextInt(5555));
        color = widget.colorList[random.nextInt(widget.colorList.length)];
      }
      else color = widget.color;

      currentCount = widget.startingCount;
      switchController = new AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      );
      switchAnimationCurve = CurvedAnimation(parent: switchController, curve: Curves.easeOut);
      switchAnimation = switchTween.animate(switchAnimationCurve);
      switchAnimation.addListener(() {
        setState((){});
      });
      switchAnimation.addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            switchController.reverse();
            break;
          case AnimationStatus.dismissed:
            if(currentCount > 0){
              currentCount--; 
              if(widget.color == null){
                color = widget.colorList[random.nextInt(widget.colorList.length)];
              }
              switchController.forward();
            }
            break;
          default:
        }
      });
      switchController.forward();
    }

  @override
  Widget build(BuildContext context) {
    if(currentCount > 0){
        return _buildCountDown(context);
    }
    return widget.childWidget(context);
  }
        
  Widget _buildCountDown(BuildContext context) {
    return Container(
      child: new Center(
        child: new Opacity(
          opacity: switchAnimation.value,
          child: new Text(
            currentCount.toString(),
            style: TextStyle(
              color: color,
              fontSize: 60.0 * switchAnimation.value,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }


}