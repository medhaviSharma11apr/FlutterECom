import 'package:flutter/material.dart';
import 'package:flutterstore/navigation_menu.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  // runApp(const MyApp());
  runApp(const TestApp());
}

// For Testing only

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: NavigationMenu(),
    );
  }
}
