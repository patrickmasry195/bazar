import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatelessWidget {
  const NavigationButtonWidget({
    super.key,
    this.onPressed,
    required this.buttonText,
  });
  final void Function()? onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(buttonText, style: AppTextStyles.h6),
      ),
    );
  }
}
