import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/widgets/custom_button.dart';
import 'package:bazar/modules/auth/presentation/widgets/otp_widget.dart';
import 'package:bazar/modules/auth/presentation/widgets/suggestion_widget.dart';

class PhoneNumberVerificationScreen extends StatelessWidget {
  const PhoneNumberVerificationScreen({super.key});

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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 26,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_rounded),
                          onPressed: () => GoRouter.of(
                            context,
                          ).push(RoutePaths.kPhoneNumberScreenPath),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text("Phone Verification", style: AppTextStyles.h3),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16.0,
                            color: AppColorLight.hintTextColor,
                          ),

                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'Please enter the code we just sent to phone number ',
                            ),
                            TextSpan(
                              text: '(+20) 123477092 299',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    OtpWidget(),
                    SizedBox(height: 24),
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
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).go(RoutePaths.kSuccessVerificationScreenPath);
                  //! Implement continue to success logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
