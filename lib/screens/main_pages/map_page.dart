import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:project_party/controller/map_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_party/styles/static_colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../components/components.dart';
import '../../models/models.dart';

class MapPage extends GetView<MapPageController> {
  MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalComponents.getMapPartyTile(
      maxHeight: 500,
      minHeight: 0,
      controller: controller.panelController,
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
                builder: (ctx) =>
                    GestureDetector(
                      onTap: () async {
                        if (controller.panelController.isPanelClosed) {
                          controller.panelController.open();
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        transform: Matrix4.translationValues(-10, -25.0, 0.0),
                        child:
                        Icon(Icons.location_on, color: Colors.green, size: 50),
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Hero(
        tag: "MapTile${party.partyId}"
        child: Container(
          margin: EdgeInsets.all(8),
          height: 300,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 4)
              ],
              borderRadius: BorderRadius.circular(30),
              color: StaticColors.secondary),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(party.pictureSource),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalComponents.getColumnDistance(15),
                        _getItemSet(
                            text: party.locationName,
                            iconData: Icons.location_on,
                            alignment: MainAxisAlignment.start,
                            textStyle: TextStyle(fontWeight: FontWeight.bold)),
                        _getItemSet(
                            text: party.genres ?? "Keine Angabe",
                            iconData: Icons.music_note,
                            alignment: MainAxisAlignment.start,
                            wholeLength: true),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _getItemSet(
                                iconData: Icons.timer_outlined,
                                text: DateFormat('HH:mm').format(party.time)),
                            _getItemSet(
                                iconData: Icons.attach_money,
                                text: party.cost.toString() + "€"),
                            _getItemSet(
                                iconData: Icons.safety_check,
                                text: party.minAge.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GlobalComponents.getButton("Mehr Infos",
                                color: StaticColors.primary,
                                textColor: StaticColors.secondary,
                                padding: 7),
                            GlobalComponents.getButton("Route",
                                color: StaticColors.primary,
                                textColor: StaticColors.secondary,
                                padding: 7),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      color: StaticColors.primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      party.name,
                      style: TextStyle(color: StaticColors.secondary),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


Row _getItemSet({required String text,
  required IconData iconData,
  MainAxisAlignment alignment = MainAxisAlignment.center,
  TextStyle? textStyle,
  bool wholeLength = false}) {
  return Row(
      mainAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData),
        wholeLength
            ? Expanded(
            child: Text(
              text,
              style: textStyle,
              softWrap: true,
            ))
            : Text(
          text,
          style: textStyle,
          softWrap: true,
        )
      ]);
}

