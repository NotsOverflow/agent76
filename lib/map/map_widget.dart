import 'package:flutter/material.dart';
import 'package:agent76/map/ville.dart';
import 'package:agent76/map/map_overlay.dart';
import 'package:agent76/map/controller.dart';
import 'package:agent76/map/map_view.dart';
import 'package:agent76/map/region.dart';
import 'package:agent76/data/map.dart';

MapController overlayController;
Ville currentTown ;
List<Region> regionList;

class MapMenu extends StatefulWidget {

  final List<Region>  items;

  MapMenu({
    this.items,
  });

  @override
  _MapMenuState createState() => new _MapMenuState();
}


class _MapMenuState extends State<MapMenu> {

  MapView mapView;
  MapOverlay mapOverlay;

  @override
  void initState(){
    super.initState();
    currentTown = widget.items.first.towns.first;
    regionList = widget.items;
    mapOverlay = new MapOverlay();
    mapView = new MapView(mapData: mapData,);
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        mapView,
        mapOverlay,
      ],
    );
  }
}