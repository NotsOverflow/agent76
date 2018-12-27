import 'package:flutter/material.dart';
import 'package:agent76/menu/item.dart';

class BaseView extends StatefulWidget {

  final MenuItem data;
  final Function toggle;
  BaseView({Key key, this.data, this.toggle}) : super(key: key);

  @override
  _BaseViewState createState() => new _BaseViewState();
}

class _BaseViewState extends State<BaseView> {


  @override
  Widget build(BuildContext context) {

    return new Material(
      child: new Stack(
        children: <Widget>[
          widget.data.content(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 24.0,0.0,0.0),
            child: new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: (){
                widget.toggle();
              },
            ),
          ),
        ],
      ),
    );
  }
}