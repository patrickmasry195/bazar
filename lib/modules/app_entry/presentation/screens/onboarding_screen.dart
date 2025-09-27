import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/utils/app_strings.dart';
import 'package:bazar/modules/app_entry/presentation/widgets/dots_indicator_widget.dart';
import 'package:bazar/modules/app_entry/presentation/widgets/page_slider_widget.dart';
import 'package:bazar/modules/app_entry/presentation/widgets/navigation_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bazar/core/utils/assets_paths.dart';
import 'package:bazar/modules/app_entry/data/models/onboarding_item.dart';
import 'package:bazar/modules/app_entry/presentation/controllers/onboarding_cubit/onboarding_cubit.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      imagePath: AssetsPaths.onboarding1,
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingDescriptopn1,
    ),
    OnboardingItem(
      imagePath: AssetsPaths.onboarding2,
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDescriptopn2,
    ),
    OnboardingItem(
      imagePath: AssetsPaths.onboarding3,
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingDescriptopn3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(totalPages: onboardingItems.length),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (BuildContext context, state) {
              final cubit = context.read<OnboardingCubit>();

              if (state is OnboardingInitial) {
                return Center(child: CircularProgressIndicator());
              }

              final currentState = state as OnboardingLoaded;
              final currentItem = onboardingItems[currentState.currentPage];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () =>
                            GoRouter.of(context).go(RoutePaths.kSignInPath),
                        child: Text('Skip'),
                      ),
                    ),
                    PageSliderWidget(
                      controller: cubit.pageController,
                      onPageChanged: (int page) {
                        cubit.goToPage(page);
                      },
                      itemCount: onboardingItems.length,
                      imagePathBuilder: (index) =>
                          onboardingItems[index].imagePath,
                      title: currentItem.title,
                      description: currentItem.description,
                    ),
                    SizedBox(height: 20),
                    DotsIndicatorWidget(
                      currentPage: currentState.currentPage,
                      totalPages: onboardingItems.length,
                    ),
                    SizedBox(height: 40),
                    NavigationButtonWidget(
                      onPressed: () {
                        if (!state.isLastPage) {
                          cubit.nextPage();
                        } else {
                          GoRouter.of(
                            context,
                          ).pushReplacement(RoutePaths.kSignInPath);
                        }
                      },
                      buttonText: state.buttonText,
                    ),
                    Spacer(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
