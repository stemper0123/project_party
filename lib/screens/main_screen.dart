import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:pie_menu/pie_menu.dart';
import 'package:project_party/controller/main_controller.dart';
import 'package:project_party/styles/static_colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../components/components.dart';
import 'main_pages/profile_page.dart';

class MainScreen extends GetView<MainController> {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        icon: const Icon(Icons.celebration_outlined),
        activeIcon: const Icon(Icons.celebration),
        title: const Text("Partys"),
        selectedColor: StaticColors.primary,
      ),

      /// Likes
      SalomonBottomBarItem(
        icon: const Icon(Icons.favorite_border),
        activeIcon: const Icon(Icons.favorite),
        title: const Text("Favorites"),
        selectedColor: Colors.pink,
      ),

      /// Search
      SalomonBottomBarItem(
        icon: const Icon(Icons.map_outlined),
        activeIcon: const Icon(Icons.map),
        title: const Text("Karte"),
        selectedColor: StaticColors.primary,
      ),
      SalomonBottomBarItem(
        icon: const Icon(Icons.add),
        activeIcon: const Icon(Icons.add_circle_rounded),
        title: const Text("Hinzufügen"),
        selectedColor: StaticColors.primary,
      ),

      /// Profile
      SalomonBottomBarItem(
        icon: const Icon(Icons.person_outlined),
        activeIcon: const Icon(Icons.person),
        title: const Text("Profil"),
        selectedColor: StaticColors.primary,
      ),
    ];
  }
}
