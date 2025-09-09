import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/utils/assets_paths.dart';
import 'package:bazar/modules/auth/presentation/widgets/text_form_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(child: Icon(Icons.arrow_back_rounded)),
              SizedBox(height: 16),
              Text("Welcome Back 👋", style: AppTextStyles.h3),
              SizedBox(height: 8),
              Text(
                "Sign in to your account",
                style: AppTextStyles.bodyLargeRegular.copyWith(
                  color: AppColorLight.hintTextColor,
                ),
              ),
              SizedBox(height: 24),
              Text("Email", style: AppTextStyles.bodyMediumBold),
              SizedBox(height: 6),
              TextFormFieldWidget(
                hintText: 'Your Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              Text("Password", style: AppTextStyles.bodyMediumBold),
              SizedBox(height: 6),
              TextFormFieldWidget(
                hintText: 'Your Password',
                obscureText: true,
                enableSuggestions: false,
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColorLight.hintTextColor,
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: AppTextStyles.bodyMediumSemiBold,
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Login', style: AppTextStyles.h6),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextStyles.bodyLargeMedium.copyWith(
                      color: AppColorLight.hintTextColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.bodyLargeMedium,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColorLight.hintTextColor,
                      thickness: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or with',
                      style: AppTextStyles.bodyMediumRegular.copyWith(
                        color: AppColorLight.hintTextColor,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: AppColorLight.hintTextColor,
                      thickness: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(AssetsPaths.googleLogo),
                  label: Text('Sign in with Google'),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(AssetsPaths.appleLogo),
                  label: Text('Sign in with Apple'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
