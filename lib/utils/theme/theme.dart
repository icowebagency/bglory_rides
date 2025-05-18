import 'package:bglory_rides/utils/theme/widget_themes/appbar_theme.dart';
import 'package:bglory_rides/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:bglory_rides/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:bglory_rides/utils/theme/widget_themes/chip_theme.dart';
import 'package:bglory_rides/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:bglory_rides/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:bglory_rides/utils/theme/widget_themes/text_field_theme.dart';
import 'package:bglory_rides/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    colorScheme: const ColorScheme.light(
      primary: TColors.primary,
      onPrimary: TColors.white,
      primaryContainer: TColors.primaryLight,
      onPrimaryContainer: TColors.white,
      secondary: TColors.secondary,
      onSecondary: TColors.black,
      secondaryContainer: TColors.secondaryLight,
      onSecondaryContainer: TColors.black,
      tertiary: TColors.tertiary,
      onTertiary: TColors.white,
      tertiaryContainer: TColors.tertiaryLight,
      onTertiaryContainer: TColors.white,
      error: TColors.error,
      surface: TColors.lightContainer,
      onSurface: TColors.textPrimary,
    ),
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.light,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    dividerTheme: const DividerThemeData(
      color: TColors.divider,
      thickness: 1,
    ),
    cardTheme: CardTheme(
      color: TColors.lightContainer,
      elevation: 2,
      shadowColor: TColors.shadow,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    colorScheme: ColorScheme.dark(
      primary: TColors.primary,
      onPrimary: TColors.white,
      primaryContainer: TColors.primaryLight,
      onPrimaryContainer: TColors.white,
      secondary: TColors.secondary,
      onSecondary: TColors.black,
      secondaryContainer: TColors.secondaryLight,
      onSecondaryContainer: TColors.black,
      tertiary: TColors.tertiary,
      onTertiary: TColors.white,
      tertiaryContainer: TColors.tertiaryLight,
      onTertiaryContainer: TColors.white,
      error: TColors.error,
      surface: TColors.darkContainer,
      onSurface: TColors.white,
    ),
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.dark,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    dividerTheme: const DividerThemeData(
      color: TColors.dividerDark,
      thickness: 1,
    ),
    cardTheme: CardTheme(
      color: TColors.darkContainer,
      elevation: 2,
      shadowColor: TColors.black.withOpacity(0.3),
    ),
  );
}