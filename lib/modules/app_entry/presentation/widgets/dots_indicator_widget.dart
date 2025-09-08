import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';

class DotsIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const DotsIndicatorWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index
                ? AppColorLight.primaryColor
                : Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
