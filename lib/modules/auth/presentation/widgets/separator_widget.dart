import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColorLight.hintTextColor, thickness: 0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Or with',
            style: AppTextStyles.bodyMediumRegular.copyWith(
              color: AppColorLight.hintTextColor,
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColorLight.hintTextColor, thickness: 0),
        ),
      ],
    );
  }
}
