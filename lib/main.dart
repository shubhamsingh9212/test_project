import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_project/home_module/bindings/home_binding.dart';
import 'package:test_project/home_module/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: "/homePage",
      getPages: [
        GetPage(
          name: "/homePage",
          page: () => const HomeScreenView(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
