import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageSliderWidget extends StatelessWidget {
  const PageSliderWidget({
    super.key,
    this.onPageChanged,
    required this.itemCount,
    required this.imagePathBuilder,
    this.controller,
    required this.title,
    required this.description,
  });

  final Function(int)? onPageChanged;
  final int itemCount;
  final String Function(int) imagePathBuilder;
  final PageController? controller;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: PageView.builder(
        controller: controller,
        onPageChanged: onPageChanged,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final imagePath = imagePathBuilder(index);
          return Column(
            children: [
              SvgPicture.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Placeholder(
                    fallbackHeight: 200,
                    child: Center(child: Text('Image not found')),
                  );
                },
              ),
              Text(title, style: AppTextStyles.h3),
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLargeRegular.copyWith(
                  color: Color(0xffA5A5A5),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
