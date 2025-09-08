part of 'onboarding_cubit.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

class OnboardingLoaded extends OnboardingState {
  final int currentPage;
  final bool isLastPage;
  final String buttonText;

  const OnboardingLoaded({
    required this.currentPage,
    required this.isLastPage,
    required this.buttonText,
  });

  @override
  List<Object> get props => [currentPage, isLastPage, buttonText];

  OnboardingLoaded copyWith({
    int? currentPage,
    bool? isLastPage,
    String? buttonText,
  }) {
    return OnboardingLoaded(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      buttonText: buttonText ?? this.buttonText,
    );
  }
}
