import 'package:bazar/core/theme/theme_data/pin_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key, this.onCompleted});

  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final pinTheme = Theme.of(context).extension<AppPinTheme>()!;
    return Pinput(
      showCursor: false,
      length: 4,
      defaultPinTheme: pinTheme.defaultPinTheme,
      focusedPinTheme: pinTheme.focusedPinTheme,
      submittedPinTheme: pinTheme.submittedPinTheme,
      errorPinTheme: pinTheme.errorPinTheme,
      onCompleted: onCompleted,
    );
  }
}
