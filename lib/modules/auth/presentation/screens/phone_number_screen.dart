import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/widgets/custom_button.dart';
import 'package:bazar/modules/auth/presentation/widgets/phone_number_input_field.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 26,
                        horizontal: 16,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_rounded),
                          onPressed: () => GoRouter.of(
                            context,
                          ).push(RoutePaths.kEmailVerificationPath),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text("Phone Number", style: AppTextStyles.h3),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Please enter your phone number, so we can\nmore easily deliver your order",
                        style: AppTextStyles.bodyLargeRegular.copyWith(
                          color: AppColorLight.hintTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Phone Number",
                          style: AppTextStyles.bodyMediumMedium,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: PhoneNumberInputField(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 43),
              child: CustomButton(
                buttonName: "Continue",
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).push(RoutePaths.kPhoneNumberVerificationScreenPath);
                  //! Implement continue to phone num verify logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
