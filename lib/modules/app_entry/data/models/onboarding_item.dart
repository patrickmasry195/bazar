import 'package:equatable/equatable.dart';

class OnboardingItem extends Equatable {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [imagePath, title, description];
}
