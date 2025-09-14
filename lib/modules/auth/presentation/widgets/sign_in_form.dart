import 'package:bazar/core/widgets/custom_button.dart';
import 'package:bazar/modules/auth/presentation/cubit/validation/validation_cubit.dart';
import 'package:flutter/material.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/modules/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      builder: (context, state) {
        return Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email", style: AppTextStyles.bodyMediumBold),
              SizedBox(height: 6),
              TextFormFieldWidget(
                hintText: 'Your Email',
                keyboardType: TextInputType.emailAddress,
                errText: state.email.isNotValid && state.emailInteracted
                    ? 'Please enter a valid email'
                    : null,
                onChanged: (value) =>
                    context.read<ValidationCubit>().emailChanged(value),
              ),
              SizedBox(height: 16),
              Text("Password", style: AppTextStyles.bodyMediumBold),
              SizedBox(height: 6),
              TextFormFieldWidget(
                hintText: 'Your Password',
                obscureText: !state.showPassword,
                enableSuggestions: false,
                onChanged: (value) =>
                    context.read<ValidationCubit>().passwordChanged(value),
                suffixIcon: GestureDetector(
                  onTap: () =>
                      context.read<ValidationCubit>().toggleShowPassword(),
                  child: Icon(
                    state.showPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColorLight.hintTextColor,
                  ),
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
      },
    );
  }
}
