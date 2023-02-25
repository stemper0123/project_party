import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';

import '../../components/components.dart';
import '../../models/models.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var _indexPage = 0;

  @override
  Widget build(BuildContext context) {
    print("Testing");
    return GlobalComponents.getFilter(
        maxHeight: MediaQuery.of(context).size.height - 80,
        minHeight: 150,
        body: PageView.builder(
          itemCount: listOfTestParties.length,
          onPageChanged: (i) => setState(() {
            _indexPage = i;
          }),
          itemBuilder: (_, index) {
            return GlobalComponents.getPartyListView(testParties, context);
          },
        ));
  }
}
