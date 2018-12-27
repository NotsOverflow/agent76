import 'package:flutter/material.dart';
import 'package:agent76/cards/card_view.dart';
import 'package:agent76/cards/card.dart';
import 'dart:math';
import 'package:agent76/main.dart';
import 'package:agent76/cards/bound.dart';
import 'package:agent76/cards/decision.dart';
import 'package:agent76/cards/exercises.dart';
import 'package:agent76/cards/button.dart';
import 'package:agent76/cards/exercise_view.dart';


class CardsWidget extends StatefulWidget {

  final List<CardItem> cards;

  final int currentIndex;

  final List<ExercisesList> listOfExercisesList;

  CardsWidget({
    @required this.cards,
    @required this.currentIndex,
    @required this.listOfExercisesList,
  });

  @override
  _CardsWidgetState createState() => _CardsWidgetState();
}

class _CardsWidgetState extends State<CardsWidget> with TickerProviderStateMixin{

  int currentIndex;
  int randNext;
  Random random;
  Offset cardOffset = const Offset(0.0, 0.0);
  Offset dragStart;
  Offset dragPosition;
  Offset slideBackStart;
  AnimationController slideBackAnimation;
  Tween<Offset> slideOutTween;
  AnimationController slideOutAnimation;
  Decision decision = Decision.none;
  Widget bottomCard;
  Widget topCard;
  bool  inExercise = false;
  WidgetBuilder exercise;
  bool upDone = false;


  AnimationController switchExeciseAndCards;
  Tween<double> switchExerciseAndCardTween = Tween( begin:1.0 , end:0.8 );
  CurvedAnimation switchAnimationCurve ;
  Animation<double> switchAnimation;

  @override
  void dispose(){
    slideBackAnimation.dispose();
    slideOutAnimation.dispose();
    switchExeciseAndCards.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    //Todo: resume where user left
    currentIndex = widget.currentIndex;
    random = new Random();
    random = Random(random.nextInt(5555));
    _setCurrentCard();
    _setBottomCard();
    slideBackAnimation = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )
      ..addListener(() => setState((){
        cardOffset = Offset.lerp(slideBackStart, const Offset(0.0, 0.0 ), Curves.elasticOut.transform(slideBackAnimation.value));
      }))..addStatusListener((AnimationStatus status){
        if (status == AnimationStatus.completed){
          setState(() {
            dragStart = null;
            slideBackStart = null;
            dragPosition = null;
          });
        }
      });
    slideOutAnimation = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )
    ..addListener((){
      setState(() {
        cardOffset = slideOutTween.evaluate(slideOutAnimation);
      });
    })
    ..addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.completed){
        setState(() {
          dragStart = null;
          slideOutTween = null;
          dragPosition = null;
          cardOffset = const Offset(0.0, 0.0);
          _setCurrentCard();
        });
      }
    });

    switchExeciseAndCards = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
    switchAnimationCurve = CurvedAnimation(parent: switchExeciseAndCards, curve: Curves.easeOut);
    switchAnimation = switchExerciseAndCardTween.animate(switchAnimationCurve);
    switchAnimation.addListener(() {
      setState((){});
    });
    switchAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if(inExercise){
          inExercise = false;
          exercise = null;
        } 
        else inExercise = true;
        switchExeciseAndCards.reverse();
      }
    });
  }

  @override
  void didUpdateWidget(CardsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.currentIndex != oldWidget.currentIndex){
      setState(() {
        currentIndex = widget.currentIndex;
      });
    }
  }

  void _setBottomCard(){
    switch(decision){
      case Decision.right:
        bottomCard = _buildCardWidget(_previousCard());
        break;
      case Decision.left:
        bottomCard = _buildCardWidget(_nextCard());
        break;
      case Decision.up:
        if(upDone == false) {
          upDone = true;
          randNext = _randCard();
          bottomCard = _buildCardWidget(randNext);
        }
        break;
      default:
        bottomCard = new Container(color: Colors.transparent,);
        break;
    }
  }
  void _setCurrentCard(){
    switch(decision){
      case Decision.right:
        currentIndex = _previousCard();
        break;
      case Decision.left:
        currentIndex = _nextCard();
        break;
      case Decision.up:
        currentIndex = randNext;
        upDone = false;
        break;
      default:
        break;
    }
    topCard = _buildCardWidget(currentIndex);
  }

  int _previousCard(){
    return currentIndex > 0 ? currentIndex - 1 : 0 ;

  }

  int _nextCard(){
    return currentIndex < widget.cards.length - 1 ? currentIndex + 1 : currentIndex ;
  }

  void _playCard(){
    if(textToSpeechObject.isPlaying) textToSpeechObject.stop();
    textToSpeechObject.speak(widget.cards[currentIndex].audio, (){});
  }
  int _randCard(){
      return random.nextInt(widget.cards.length) ;
  }

  void _onPanStart(DragStartDetails details){
    dragStart = details.globalPosition;
    decision = Decision.none;
    upDone = false;
    if(slideBackAnimation.isAnimating){
      slideBackAnimation.stop(canceled: true);
    }
    if(slideOutAnimation.isAnimating){
      slideOutAnimation.stop(canceled: true);
    }
  }
  void _onPanUpdate(DragUpdateDetails details){
    final isInLeftRegion = (cardOffset.dx / context.size.width) < 0.0;
    final isInRightRegion = (cardOffset.dx / context.size.width) > 0.0;
    final isInUpRegion  = (cardOffset.dy / context.size.height) < -0.0;
    if(isInRightRegion) decision = Decision.right;
    else if(isInLeftRegion) decision = Decision.left;
    else if(isInUpRegion) decision = Decision.up;
    else decision = Decision.none;

    if(upDone == false) _setBottomCard();

    setState(() {
      dragPosition = details.globalPosition;
      cardOffset = dragPosition - dragStart;
    });
  }
  void _onPanEnd(DragEndDetails details){

    final dragVector = cardOffset / cardOffset.distance;
    final isInLeftRegion = (cardOffset.dx / context.size.width) < -0.45;
    final isInRightRegion = (cardOffset.dx / context.size.width) > 0.45;
    final isInUpRegion  = (cardOffset.dy / context.size.height) < -0.40;

    setState(() {
      if(isInLeftRegion || isInRightRegion){
        if(isInRightRegion) decision = Decision.right;
        if(isInLeftRegion) decision = Decision.left;
        slideOutTween = new Tween(begin: cardOffset, end: dragVector * (2 * context.size.width));
        slideOutAnimation.forward(from: 0.0);
      }
      else if(isInUpRegion){
        decision = Decision.up;
        slideOutTween = new Tween(begin: cardOffset,end: dragVector * ( 2 * context.size.height));
        slideOutAnimation.forward(from: 0.0);
      }
      else{
        decision = Decision.none;
        slideBackStart = cardOffset;
        slideBackAnimation.forward(from: 0.0);
      }
    });


  }

  double _rotation(Bound bound){
    if(dragStart != null){
      final rotCornMultiplier = dragStart.dy >= bound.topLeft.dy + (bound.bounds.dy/2) ? -1 : 1 ;
      return (pi / 8 ) * (cardOffset.dx / bound.bounds.dx) * rotCornMultiplier;
    }
    return 0.0;
  }

  Offset _rotationOrigin(Bound bound) {
    if (dragStart != null) return dragStart - bound.topLeft;
    return const Offset(0.0, 0.0);
  }


  @override
  Widget build(BuildContext context) {

    return new FractionallySizedBox(
      widthFactor: switchAnimation.value,
      heightFactor: switchAnimation.value,
      alignment: Alignment.center,
      child: _buildMainContent(context),
    );
  }


  Widget _buildMainContent(BuildContext context){
    if(inExercise == false) return _buildFrontWidget(context) ;
    return new ExerciseView(
      child: exercise(context),
      returnFunction: _resumeCards,
    );
  }

  Widget _buildFrontWidget(BuildContext context){

    final screenSize = MediaQuery.of(context).size;
    final bound = new Bound(
      bounds: new Offset(screenSize.width * 0.8, screenSize.height * 0.6),
      topLeft: new Offset(screenSize.width * 0.1, screenSize.height * 0.2),
    );

    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 0.30,
          alignment: Alignment.bottomCenter,
          child: _buildButtons(context),
        ),
        new FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 0.7,
          alignment: Alignment.topCenter,
          child: new Container(
            child: Padding(
              padding: const EdgeInsets.only(left:16.0,right: 16.0),
              child: new Stack(
                children: <Widget>[
                  bottomCard,
                  new GestureDetector(
                    onPanStart: _onPanStart,
                    onPanUpdate: _onPanUpdate,
                    onPanEnd: _onPanEnd,
                    child: new Transform(
                      transform: new Matrix4.translationValues(cardOffset.dx, cardOffset.dy, 0.0)
                        ..rotateZ(_rotation(bound)),
                      origin: _rotationOrigin(bound),
                      child: topCard,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardWidget(int index){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new CardView(image: widget.cards[index].image, text: widget.cards[index].text),
        _buildVolumeControls(),
      ],
    );
  }

  Widget _buildVolumeControls() {
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Align(
            alignment: Alignment.topRight,
            child: new InkWell(
              onTap: _playCard,
              child: new Icon(
                Icons.volume_up,
                color: Colors.white,
              ),
            ),
          ),
    );
  }

  void _changeToGameCards(List<WidgetBuilder> exercises){
    assert(exercises.length > 0);

    if(exercises.length == 1){
      exercise = exercises[0];
    }
    else exercise = exercises[random.nextInt(exercises.length)];

    switchExeciseAndCards.forward();
  }
  void _resumeCards(){
    switchExeciseAndCards.forward();
  }

  Widget _buildButtons(BuildContext context) {
    List<Widget> list = new List();
    for (var exercisesList in widget.listOfExercisesList) {
      list.add(
          new CardButton(
            title: exercisesList.title,
            color: exercisesList.color,
            onTap: () {
              _changeToGameCards(exercisesList.list);
            },
          )
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: new ListView(
        padding: const EdgeInsets.all(0.0),
        children: list,
      ),
    );
  }
}
