import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutterstore/data/repositories/auth/auth_repositories.dart';
import 'package:flutterstore/features/shop/screens/brand/all_brands.dart';
import 'package:flutterstore/app.dart';
import 'package:flutterstore/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Add widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Init Local Storage
  await GetStorage.init();

  // Await NAtive Spalash

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Init Payment Method

  //Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
).then((value) {
   Get.put(AuthenticationRepository());
});

  // Initialize AUthentication

// Load all Material design / theme / localization /Bindings
  runApp(const MyApp());
  // runApp(const TestApp());
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
      home: const AllBrandsScreen(),
    );
  }
}
