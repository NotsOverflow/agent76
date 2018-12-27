import 'package:flutter/material.dart';
import 'package:agent76/map/region.dart';
import 'package:agent76/map/map_widget.dart';
import 'package:agent76/map/ville.dart';

class MapView extends StatefulWidget {

  final List<Region> mapData;

  MapView({this.mapData});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  selectMe(Ville town){
    regionList.forEach((region) => region.towns.forEach((town) => town.isSelected = false ));
    town.isSelected = true;
    currentTown = town;
    setState((){});
    overlayController.toggle();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final townHeight = screenSize.height / 7;
    final townWidth = screenSize.width / 4;

    return new Material(
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: widget.mapData.map((region) => new Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(region.backgroundIncomplete),
                fit: BoxFit.cover,
              ),
            ),
            child: new Stack(
              children: region.towns.map((town) =>new Transform(
                transform: new Matrix4.translationValues(townWidth * town.posX, townHeight * town.posY, 0.0),
                child: new InkWell(
                  onTap: (){
                    selectMe(town);
                  },
                  child : new Container(
                    width: townWidth,
                    height: townHeight,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/epoint.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )).toList(),
            )
        )).toList(),
      ),
    );
  }
}