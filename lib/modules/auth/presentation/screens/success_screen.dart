import 'package:bazar/core/routing/route_paths.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/utils/assets_paths.dart';
import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    this.source = VerificationSource.signUp,
    this.onButtonPressed,
  });

  final VerificationSource source;

  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsPaths.successImg),
                SizedBox(height: 40),
                Text(
                  source == VerificationSource.passwordReset
                      ? 'Password Changed!'
                      : 'Congratulation!',
                  style: AppTextStyles.h3,
                ),
                SizedBox(height: 8),
                Text(
                  source == VerificationSource.passwordReset
                      ? 'Password changed successfully, you can\nlogin again with a new password'
                      : 'your account is complete, please enjoy the\nbest menu from us.',
                  style: AppTextStyles.bodyLargeRegular.copyWith(
                    color: AppColorLight.hintTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                CustomButton(
                  buttonName: source == VerificationSource.passwordReset
                      ? 'Login'
                      : 'Get Started',
                  onPressed:
                      onButtonPressed ??
                      () {
                        if (source == VerificationSource.signUp) {
                          GoRouter.of(
                            context,
                          ).pushReplacement(RoutePaths.kHomeScreenPath);
                        } else {
                          GoRouter.of(context).go(RoutePaths.kSignInPath);
                        }
                      },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
