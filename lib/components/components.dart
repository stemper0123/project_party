import 'package:flutter/material.dart';
import 'package:input_form_field/input_form_field.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:slide_switcher/slide_switcher.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../models/models.dart';
import '../screens/detail_screen.dart';
import 'package:get/get.dart';

import '../styles/static_colors.dart';
import 'package:animations/animations.dart';

class GlobalComponents {
  static Widget getFilter(
      {required double maxHeight, required double minHeight, Widget? body}) {
    return SlidingUpPanel(
        renderPanelSheet: false,
        panel: FilterComponents.getFilterExpanded(),
        maxHeight: maxHeight,
        minHeight: minHeight,
        collapsed: FilterComponents.getFilter(),
        body: body);
  }

  static Widget getMapPartyTile(
      {required double maxHeight,
      required double minHeight,
      Widget? background,
      Widget? partyTile,
      PanelController? controller}) {
    return SlidingUpPanel(
        controller: controller,
        renderPanelSheet: false,
        maxHeight: maxHeight,
        minHeight: minHeight,
        panel: partyTile,
        body: background);
  }

  static Widget getPartyListView(List<Party> parties, BuildContext context) {
    return ListView.builder(
      itemCount: parties.length,
      itemBuilder: (context, index) {
        var party = parties[index];
        return getPartyTile(context, party);
      },
    );
  }

  static Widget getMinButton(String text,
      {double? fontSize,
      bool? isRounded,
      Color color = Colors.white,
      Color textColor = Colors.black,
      double? padding,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(isRounded ?? false ? 50 : 5)),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 0),
          child: Center(
            child: Text(text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                )),
          ),
        ),
      ),
    );
  }

  static Widget getPartyTile(BuildContext context, Party party) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: StaticColors.secondary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {

              Navigator.push(
                  context,
                  MaterialPageRoute(

                      builder: (context) => PartyDetailScreen(party: party)));
            },
          child: Row(
            children: [
              Container(
                width: 80,
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  image: DecorationImage(
                      image: NetworkImage(party.flyerSource),
                      fit: BoxFit.cover),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    party.name,
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_getSimpleDate(party.time)),
                  Text(party.locationName),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  static String _getSimpleDate(DateTime dateTime) {
    return DateFormat('dd.MM HH:mm').format(dateTime);
  }

  static Widget getButton(String text,
      {double? fontSize,
      bool? isRounded,
      Color color = Colors.white,
      Color textColor = Colors.black,
      bool isInfinityWidth = false,
      double padding = 10,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isInfinityWidth ? double.infinity : null,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(isRounded ?? false ? 50 : 5)),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Center(
            child: Text(text,
                style: TextStyle(fontSize: fontSize, color: textColor)),
          ),
        ),
      ),
    );
  }

  static Widget getColumnDistance(double height) {
    return SizedBox(height: height);
  }
}

class SigningComponents {
  static Widget getTemplate(BuildContext context,
      {required List<Widget> children}) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: StaticColors.signingBackground,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget getInputFormField(
      {required TextEditingController controller,
      IconData? prefixIcon,
      IconData? suffixIcon,
      String? labelText,
      String? hintText,
      bool? isPassword}) {
    print(isPassword);
    return InputFormField(
      textEditingController: controller,
      prefix: _getIcon(prefixIcon),
      fillColor: Colors.white,
      labelText: labelText,
      labelTextStyle: TextStyle(color: StaticColors.primary, fontSize: 15),
      height: 50,
      hintText: hintText,
      suffix: _getIcon(suffixIcon),
      borderType: BorderType.outlined,
      borderColor: Colors.transparent,
      password: (isPassword ?? false)
          ? EnabledPassword(
              showPasswordIcon: const Icon(
                Icons.add,
                color: Colors.amber,
              ),
              hidePasswordIcon: const Icon(
                Icons.visibility_off_sharp,
                color: Colors.amber,
              ),
            )
          : null,
      bottomMargin: 10,
      // Optional
    );
  }

  static Widget? _getIcon(IconData? iconData) {
    return Icon(iconData, color: StaticColors.primary);
  }
}

class FilterComponents {
  static Widget getFilter() {
    final now = DateTime.now();
    initializeDateFormatting();
// Create a list of the next 14 days
    final List<DateTime> dates = List.generate(14, (index) {
      return now.add(Duration(days: index));
    });

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 24.0, 0, 0.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: StaticColors.secondary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                            Text("Frankfurt am Main"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: StaticColors.primaryLowerOpacity),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                                child: Row(
                              children: [
                                Text(
                                  "+1000 km",
                                  style: TextStyle(color: StaticColors.primary),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: StaticColors.primaryLowerOpacity),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.filter_list_alt,
                              color: StaticColors.primary,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                  getDateListContainer(dates)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Container getDateListContainer(List<DateTime> dates) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (BuildContext context, int index) {
          final date = dates[index];
          final dayOfWeek = DateFormat('E', 'de_DE')
              .format(date); // Short German abbreviation of the day of the week
          final formattedDate =
              DateFormat('dd.MM').format(date); // Format the date as "DD.MM"
          final isWeekend = _isWeekend(date);
          return Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 2, 2, 2),
            child: Container(
              decoration: BoxDecoration(
                  color: isWeekend
                      ? StaticColors.primary
                      : StaticColors.primaryLowerOpacity,
                  borderRadius: BorderRadius.circular(10)),
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dayOfWeek,
                      style: TextStyle(
                          fontSize: 13,
                          color: isWeekend ? Colors.white : Colors.black)),
                  Text(formattedDate,
                      style: TextStyle(
                          fontSize: 13,
                          color: isWeekend ? Colors.white : Colors.black)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static bool _isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday ||
        date.weekday == DateTime.sunday ||
        date.weekday == DateTime.friday;
  }

  static Widget getFilterExpanded() {
    return Container(
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: StaticColors.secondary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Colors.grey.withOpacity(0.2),
              ),
            ]),
        margin: const EdgeInsets.fromLTRB(0, 24.0, 0, 0.0),
        child: Column(children: [
          Center(
              child: Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(3)),
          )),
          GlobalComponents.getColumnDistance(150),
          Row(
            children: [],
          ),
        ]));
  }
}
