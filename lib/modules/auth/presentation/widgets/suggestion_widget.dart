import 'package:flutter/material.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({
    super.key,
    required this.suggestion,
    required this.buttonName,
    this.onPressed,
  });

  final String suggestion;
  final String buttonName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          suggestion,
          style: AppTextStyles.bodyLargeMedium.copyWith(
            color: AppColorLight.hintTextColor,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonName, style: AppTextStyles.bodyLargeMedium),
        ),
      ],
    );
  }
}
