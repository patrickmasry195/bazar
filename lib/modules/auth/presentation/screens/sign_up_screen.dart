import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/modules/auth/presentation/cubit/validation/validation_cubit.dart';
import 'package:bazar/modules/auth/presentation/widgets/auth_suggestion_widget.dart';
import 'package:bazar/modules/auth/presentation/widgets/sign_up_form.dart';
import 'package:bazar/modules/auth/presentation/widgets/user_policy_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ValidationCubit()..setFormType(AuthFormType.signUp),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () =>
                        GoRouter.of(context).push(RoutePaths.kSignInPath),
                    child: Icon(Icons.arrow_back_rounded),
                  ),
                  SizedBox(height: 16),
                  Text("Sign Up", style: AppTextStyles.h3),
                  SizedBox(height: 8),
                  Text(
                    "Create account and choose favorite menu",
                    style: AppTextStyles.bodyLargeRegular.copyWith(
                      color: AppColorLight.hintTextColor,
                    ),
                  ),
                  SizedBox(height: 24),
                  SignUpForm(),
                  SizedBox(height: 24),
                  AuthSuggestionWidget(
                    onPressed: () => GoRouter.of(
                      context,
                    ).push(RoutePaths.kSignInPath),
                    suggestion: "Have an account?",
                    buttonName: "Sign In",
                  ),
                  Gap(90),
                  UserPolicyButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
