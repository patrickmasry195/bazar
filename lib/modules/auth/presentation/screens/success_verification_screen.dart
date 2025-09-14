import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/utils/assets_paths.dart';
import 'package:bazar/core/widgets/custom_button.dart';

class SuccessVerificationScreen extends StatelessWidget {
  const SuccessVerificationScreen({super.key});

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
                Text("Congratulation!", style: AppTextStyles.h3),
                SizedBox(height: 8),
                Text(
                  "your account is complete, please enjoy the\nbest menu from us.",
                  style: AppTextStyles.bodyLargeRegular.copyWith(
                    color: AppColorLight.hintTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                CustomButton(
                  buttonName: "Get Started",
                  onPressed: () {
                    //! Nav to home after success register
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
