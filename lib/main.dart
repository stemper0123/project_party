import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_party/controller/map_controller.dart';
import 'package:project_party/controller/pageview_controller.dart';
import 'package:project_party/screens/login_screen.dart';
import 'package:project_party/screens/main_pages/list_page.dart';
import 'package:project_party/screens/main_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_party/styles/static_colors.dart';

import 'bingings/main_binding.dart';
void main() {
  Get.lazyPut(() => MapPageController());
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: StaticColors.secondary,
          systemNavigationBarColor: StaticColors.secondary,
          statusBarBrightness: Brightness.light,
        )
    );
    final PageViewController c = Get.put(PageViewController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: StaticColors.secondary,
        fontFamily: 'Inter',
      ),
      transitionDuration: Duration(seconds:1),
      title: 'Flutter Demo',
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => MainScreen(),
          binding: MainBinding()
        ),

      ],
    );
  }
}

