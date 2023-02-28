import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_party/styles/static_colors.dart';

import '../components/components.dart';
import '../models/models.dart';

class PartyDetailScreen extends StatelessWidget {
  final Party party;
  PartyDetailScreen({required this.party});

  @override
  Widget build(BuildContext context) {
    var id = party.partyId;
    print(id);
    return Scaffold(
      body: CustomScrollView(
        controller: ScrollController(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                party.pictureSource,
                fit: BoxFit.cover,
              ),
            ),
            centerTitle: true,
            backgroundColor: StaticColors.primary,
            elevation: 0,
            pinned: true,
            foregroundColor: StaticColors.secondary,
            title: Text(party.name, style: TextStyle(color: Colors.white)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalComponents.getColumnDistance(15),
                  Text(party.locationName),
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
                  Text("Beschreibung"),
                  Text(party.description),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Row _getItemSet(
    {required String text,
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
