import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/core/widgets/custom_button.dart';
import 'package:bazar/modules/auth/presentation/widgets/otp_widget.dart';
import 'package:bazar/modules/auth/presentation/widgets/suggestion_widget.dart';

class EmailVerificationScreen extends StatelessWidget {
  final String email;
  final VerificationSource source;

  const EmailVerificationScreen({
    super.key,
    required this.source,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    void onContinuePressed() {
      switch (source) {
        case VerificationSource.signUp:
          GoRouter.of(context).push(
            '${RoutePaths.kPhoneNumberScreenPath}?email=${Uri.encodeComponent(email)}&source=${VerificationSource.signUp.name}',
          );
          break;
        case VerificationSource.passwordReset:
          // GoRouter.of(context).push(RoutePaths.kCreateNewPasswordPath);
          break;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 26,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_rounded),
                          onPressed: () => context.pop(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text("Email Verification", style: AppTextStyles.h3),
                    const SizedBox(height: 8),
                    Text(
                      "Please enter the code we just sent to email",
                      style: AppTextStyles.bodyLargeRegular.copyWith(
                        color: AppColorLight.hintTextColor,
                      ),
                    ),
                    Text(email, style: AppTextStyles.bodyLargeRegular),
                    const SizedBox(height: 40),
                    const OtpWidget(),
                    const SizedBox(height: 24),
                    SuggestionWidget(
                      suggestion: "If you didn’t receive a code?",
                      buttonName: "Resend",
                      onPressed: () {
                        //! Implement resend logic
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 43),
              child: CustomButton(
                buttonName: "Continue",
                onPressed: onContinuePressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
