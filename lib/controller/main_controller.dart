import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/main_pages/add_page.dart';
import '../screens/main_pages/favorites_page.dart';
import '../screens/main_pages/list_page.dart';
import '../screens/main_pages/map_page.dart';
import '../screens/main_pages/profile_page.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  final currentIndex = 0.obs;
  final List<Widget> pages = [ListPage(), FavoritesPage(), MapPage(), AddPage(), ProfilePage()];

  void changePage(int index) {
    currentIndex.value = index;
  }

}