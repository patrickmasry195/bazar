import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/modules/auth/presentation/controllers/validation/validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/utils/assets_paths.dart';
import 'package:bazar/modules/auth/presentation/widgets/third_party_auth_button.dart';
import 'package:bazar/modules/auth/presentation/widgets/separator_widget.dart';
import 'package:bazar/modules/auth/presentation/widgets/sign_in_form.dart';
import 'package:bazar/modules/auth/presentation/widgets/suggestion_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ValidationCubit()..setFormType(AuthFormType.signIn),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back 👋", style: AppTextStyles.h3),
                  SizedBox(height: 8),
                  Text(
                    "Sign in to your account",
                    style: AppTextStyles.bodyLargeRegular.copyWith(
                      color: AppColorLight.hintTextColor,
                    ),
                  ),
                  SizedBox(height: 24),
                  SignInForm(),
                  SizedBox(height: 24),
                  SuggestionWidget(
                    onPressed: () => GoRouter.of(
                      context,
                    ).pushReplacement(RoutePaths.kSignUpPath),
                    suggestion: 'Don’t have an account?',
                    buttonName: 'Sign Up',
                  ),
                  SeparatorWidget(),
                  SizedBox(height: 24),
                  ThirdPartyAuthButton(
                    onPressed: () {},
                    thirdPartyName: "Sign in with Google",
                    thirdPartyIcon: AssetsPaths.googleLogo,
                  ),
                  SizedBox(height: 8),
                  ThirdPartyAuthButton(
                    onPressed: () {},
                    thirdPartyName: "Sign in with Apple",
                    thirdPartyIcon: AssetsPaths.appleLogo,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
