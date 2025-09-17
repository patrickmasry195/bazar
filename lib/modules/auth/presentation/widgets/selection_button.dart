import 'package:flutter/material.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';

class SelectionButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = isSelected
        ? AppColorLight.primaryColor
        : Colors.grey;

    final Color backgroundColor = isSelected
        ? Colors.transparent
        : Colors.grey.shade100;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 158,
        height: 151,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.transparent,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: primaryColor, size: 30),
            const SizedBox(height: 12),
            Text(title, style: AppTextStyles.bodyMediumMedium),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppTextStyles.bodySmallMedium.copyWith(
                color: AppColorLight.hintTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
