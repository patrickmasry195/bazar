import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final int totalPages;
  final PageController pageController = PageController();

  OnboardingCubit({required this.totalPages})
    : super(const OnboardingInitial()) {
    emit(
      OnboardingLoaded(
        currentPage: 0,
        isLastPage: totalPages == 1,
        buttonText: _getButtonText(0, totalPages),
      ),
    );
  }

  static String _getButtonText(int currentPage, int totalPages) {
    return currentPage == totalPages - 1 ? 'Get Started' : 'Continue';
  }

  void goToPage(int page) {
    if (state is OnboardingLoaded) {
      pageController.jumpToPage(page);

      final currentState = state as OnboardingLoaded;
      emit(
        currentState.copyWith(
          currentPage: page,
          isLastPage: page == totalPages - 1,
          buttonText: _getButtonText(page, totalPages),
        ),
      );
    }
  }

  void nextPage() {
    if (state is OnboardingLoaded) {
      final currentState = state as OnboardingLoaded;
      final nextPage = currentState.currentPage + 1;

      if (nextPage < totalPages) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );

        emit(
          currentState.copyWith(
            currentPage: nextPage,
            isLastPage: nextPage == totalPages - 1,
            buttonText: _getButtonText(nextPage, totalPages),
          ),
        );
      }
    }
  }

  void previousPage() {
    if (state is OnboardingLoaded) {
      final currentState = state as OnboardingLoaded;
      final previousPage = currentState.currentPage - 1;

      if (previousPage >= 0) {
        pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );

        emit(
          currentState.copyWith(
            currentPage: previousPage,
            isLastPage: previousPage == totalPages - 1,
            buttonText: _getButtonText(previousPage, totalPages),
          ),
        );
      }
    }
  }

  bool get isFirstPage {
    return state is OnboardingLoaded &&
        (state as OnboardingLoaded).currentPage == 0;
  }

  bool get isLastPage {
    return state is OnboardingLoaded && (state as OnboardingLoaded).isLastPage;
  }

  int get currentPage {
    return state is OnboardingLoaded
        ? (state as OnboardingLoaded).currentPage
        : 0;
  }

  String get buttonText {
    return state is OnboardingLoaded
        ? (state as OnboardingLoaded).buttonText
        : 'Continue';
  }
}
