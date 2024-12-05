import 'package:flutter/material.dart';
import 'package:flutterstore/utils/theme/custom_theme/Bottom_sheet_theme.dart';
import 'package:flutterstore/utils/theme/custom_theme/appbar_theme.dart';
import 'package:flutterstore/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:flutterstore/utils/theme/custom_theme/chip_theme.dart';
import 'package:flutterstore/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:flutterstore/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:flutterstore/utils/theme/custom_theme/text_field_theme.dart';
import 'package:flutterstore/utils/theme/custom_theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTexttheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: TBottomThemeSheet.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTexttheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: TBottomThemeSheet.darkBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darktOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
