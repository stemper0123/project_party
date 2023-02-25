import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'package:project_party/styles/static_colors.dart';
import '../../components/components.dart';
import '../../controller/test_controller.dart';
import '../../models/models.dart';


class MapPage extends GetView<MapPageController> {
  MapPage({Key? key}) : super(key: key);

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    print('Rendering');
    return GlobalComponents.getMapPartyTile(
      maxHeight: 500,
      minHeight: 300,
      partyTile: showMapTile(testParties[0]),
      background: FlutterMap(
        options: MapOptions(center: LatLng(51, 9), zoom: 17),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(
            markers: [
              Marker(
                rotate: true,
                point: LatLng(51, 9),
                builder: (ctx) => GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    transform: Matrix4.translationValues(-10, -25.0, 0.0),
                    child: Icon(Icons.location_on,
                        color: Colors.green, size: 50),
                    alignment: AlignmentDirectional.center,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget showMapTile(Party party) {
    return PartyTile();
  }
}

class PartyTile extends StatelessWidget {
  const PartyTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.all(8),
        height: 300,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 4)
        ], borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Stack(
          children: [
           FractionallySizedBox(
             heightFactor: 0.5,
             widthFactor: 1,
             child: Container(
               color: Colors.black12,
             ),
           ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: StaticColors.primary
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Test",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
