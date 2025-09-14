import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

class AppPinTheme extends ThemeExtension<AppPinTheme> {
  final PinTheme? defaultPinTheme;
  final PinTheme? focusedPinTheme;
  final PinTheme? submittedPinTheme;
  final PinTheme? errorPinTheme;

  AppPinTheme({
    this.defaultPinTheme,
    this.focusedPinTheme,
    this.submittedPinTheme,
    this.errorPinTheme,
  });

  @override
  ThemeExtension<AppPinTheme> copyWith({
    PinTheme? defaultPinTheme,
    PinTheme? focusedPinTheme,
    PinTheme? submittedPinTheme,
    PinTheme? errorPinTheme,
  }) {
    return AppPinTheme(
      defaultPinTheme: defaultPinTheme ?? this.defaultPinTheme,
      focusedPinTheme: focusedPinTheme ?? this.focusedPinTheme,
      submittedPinTheme: submittedPinTheme ?? this.submittedPinTheme,
      errorPinTheme: errorPinTheme ?? this.errorPinTheme,
    );
  }

  @override
  ThemeExtension<AppPinTheme> lerp(
    ThemeExtension<AppPinTheme>? other,
    double t,
  ) {
    if (other is! AppPinTheme) {
      return this;
    }
    return t < 0.5 ? this : other;
  }
}
