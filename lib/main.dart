import 'package:flutter/material.dart';
import 'package:flutterstore/navigation_menu.dart';
import 'package:flutterstore/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const NavigationMenu(),
    );
  }
}
