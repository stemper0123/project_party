import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:project_party/controller/main_controller.dart';
import 'package:project_party/controller/pageview_controller.dart';
import 'package:project_party/models/models.dart';
import 'package:project_party/screens/main_pages/add_page.dart';
import 'package:project_party/screens/main_pages/favorites_page.dart';
import 'package:project_party/screens/main_pages/list_page.dart';
import 'package:project_party/screens/main_pages/map_page.dart';
import 'package:project_party/styles/static_colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../components/components.dart';
import 'main_pages/profile_page.dart';

class MainScreen extends GetView<MainController> {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('new');
    return PieCanvas(
      child: Scaffold(
        backgroundColor: StaticColors.secondary,
        bottomNavigationBar: Obx(() => SalomonBottomBar(
              currentIndex: controller.currentIndex.value,
              onTap: controller.changePage,
              items: _navigationBarItems(),
            )),
        body: Obx( () =>
          IndexedStack(
            key: Get.nestedKey(1),
            index: controller.currentIndex.value,
            children: controller.pages,
          ),
        ),
      ),
    );
  }

  List<SalomonBottomBarItem> _navigationBarItems() {
    return [
      SalomonBottomBarItem(
        icon: Icon(Icons.celebration_outlined),
        activeIcon: Icon(Icons.celebration),
        title: Text("Partys"),
        selectedColor: StaticColors.primary,
      ),

      /// Likes
      SalomonBottomBarItem(
        icon: Icon(Icons.favorite_border),
        activeIcon: Icon(Icons.favorite),
        title: Text("Favorites"),
        selectedColor: Colors.pink,
      ),

      /// Search
      SalomonBottomBarItem(
        icon: Icon(Icons.map_outlined),
        activeIcon: Icon(Icons.map),
        title: Text("Karte"),
        selectedColor: StaticColors.primary,
      ),
      SalomonBottomBarItem(
        icon: Icon(Icons.add),
        activeIcon: Icon(Icons.add_circle_rounded),
        title: Text("Hinzufügen"),
        selectedColor: StaticColors.primary,
      ),

      /// Profile
      SalomonBottomBarItem(
        icon: Icon(Icons.person_outlined),
        activeIcon: Icon(Icons.person),
        title: Text("Profil"),
        selectedColor: StaticColors.primary,
      ),
    ];
  }
}
