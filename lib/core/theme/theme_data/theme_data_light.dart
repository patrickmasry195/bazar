import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_sizes.dart';
import 'package:bazar/core/theme/theme_data/pin_theme_extension.dart';

ThemeData getLightTheme() {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: const TextStyle(fontSize: 22, color: AppColorLight.textColor),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.white, width: 2),
    ),
  );

  final appPinTheme = AppPinTheme(
    defaultPinTheme: defaultPinTheme,
    focusedPinTheme: defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColorLight.primaryColor, width: 2),
      ),
    ),
    submittedPinTheme: defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
        border: Border.all(width: 2, color: AppColorLight.primaryColor),
      ),
    ),
    errorPinTheme: defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.redAccent, width: 2),
      ),
    ),
  );

  return ThemeData(
    primaryColor: AppColorLight.primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColorLight.appbarColor,
      iconTheme: IconThemeData(color: AppColorLight.iconColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColorLight.foregroundColor,
        backgroundColor: AppColorLight.primaryColor,
        shadowColor: AppColorLight.shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.elevatedButtonShape),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xffE8E8E8)),
        foregroundColor: AppColorLight.textColor,
        shadowColor: AppColorLight.shadowColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        foregroundColor: WidgetStateProperty.all(AppColorLight.primaryColor),
        overlayColor: WidgetStateProperty.all(
          Colors.grey.withValues(alpha: 0.3),
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        iconColor: WidgetStateProperty.all(Colors.black),
        iconSize: WidgetStateProperty.all(24),
      ),
    ),
    extensions: [appPinTheme],
  );
}
