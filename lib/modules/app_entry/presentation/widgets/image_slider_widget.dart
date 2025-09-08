import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageSliderWidget extends StatelessWidget {
  const ImageSliderWidget({
    super.key,
    this.onPageChanged,
    required this.itemCount,
    required this.imagePathBuilder,
    this.controller,
  });

  final Function(int)? onPageChanged;
  final int itemCount;
  final String Function(int) imagePathBuilder;
  final PageController? controller;

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
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Placeholder(
                  fallbackHeight: 200,
                  child: Center(child: Text('Image not found')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
