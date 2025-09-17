import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/core/widgets/custom_button.dart';
import 'package:bazar/modules/auth/presentation/widgets/selection_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ResetMethod _selectedMethod = ResetMethod.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => GoRouter.of(context).push(RoutePaths.kSignInPath),
                child: Icon(Icons.arrow_back_rounded),
              ),
              SizedBox(height: 16),
              Text("Forgot Password", style: AppTextStyles.h3),
              SizedBox(height: 8),
              Text(
                "Select which contact details should we use to reset your password",
                style: AppTextStyles.bodyLargeRegular.copyWith(
                  color: AppColorLight.hintTextColor,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectionButton(
                    title: "Email",
                    subtitle: "Send to your email",
                    icon: Icons.email,
                    isSelected: _selectedMethod == ResetMethod.email,
                    onTap: () {
                      setState(() {
                        _selectedMethod = ResetMethod.email;
                      });
                    },
                  ),
                  SizedBox(width: 16),
                  SelectionButton(
                    title: "Phone Number",
                    subtitle: "Send to your phone",
                    icon: Icons.phone,
                    isSelected: _selectedMethod == ResetMethod.phone,
                    onTap: () {
                      setState(() {
                        _selectedMethod = ResetMethod.phone;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 49),
              CustomButton(
                buttonName: "Continue",
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).push('/reset-password/${_selectedMethod.name}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
