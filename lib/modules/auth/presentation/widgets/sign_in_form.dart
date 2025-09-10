import 'package:bazar/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/modules/auth/presentation/widgets/text_form_field_widget.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});
  //! TODO Implement Validation
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          CustomButton(buttonName: "Login", onPressed: () {}),
        ],
      ),
    );
  }
}
