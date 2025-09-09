import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_sizes.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme() => ThemeData(
  primaryColor: AppColorLight.primaryColor,

  appBarTheme: AppBarThemeData(
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
      side: BorderSide(color: const Color(0xffE8E8E8)),
      foregroundColor: AppColorLight.textColor,
      shadowColor: AppColorLight.shadowColor,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      foregroundColor: WidgetStateProperty.all(AppColorLight.primaryColor),
      overlayColor: WidgetStateProperty.all(Colors.grey[30]),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      iconColor: WidgetStateProperty.all(Colors.black),
      iconSize: WidgetStateProperty.all(24),
    ),
  ),
);
