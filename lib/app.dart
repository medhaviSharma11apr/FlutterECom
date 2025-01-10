import 'package:flutter/material.dart';
import 'package:flutterstore/bindings/general_binding.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/theme/theme.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      // SHOW LOADER MEANWHILE AUTHENTICATION REPO IS DECIDING WHICH SCREEN TO SHOW
      home: const Scaffold(
        backgroundColor: TColors.primaryColor,
        body: Center(
          child: CircularProgressIndicator(
            color: TColors.white,
          ),
        ),
      ),
    );
  }
}
