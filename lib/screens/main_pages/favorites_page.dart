import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_party/components/components.dart';
import 'package:project_party/models/models.dart';

import '../../controller/test_controller.dart';

class FavoritesPage extends GetView<FavoritesPageController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GlobalComponents.getPartyListView(testParties, context),
    );
  }
}
