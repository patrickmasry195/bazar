import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/widgets/custom_button.dart';
import 'package:bazar/modules/auth/presentation/cubit/validation/validation_cubit.dart';
import 'package:bazar/modules/auth/presentation/widgets/password_checklist.dart';
import 'package:bazar/modules/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:bazar/core/utils/enums.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      builder: (BuildContext context, state) {
        return Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name", style: AppTextStyles.bodyMediumBold),
              SizedBox(height: 6),
              TextFormFieldWidget(
                hintText: 'Your Name',
                keyboardType: TextInputType.text,
                errText: state.name.isNotValid && state.nameInteracted
                    ? 'Please enter a valid name'
                    : null,
                onChanged: (value) =>
                    context.read<ValidationCubit>().nameChanged(value),
              ),
              SizedBox(height: 16),
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
                errText: state.password.isNotValid && state.passwordInteracted
                    ? 'Please enter a valid password'
                    : null,
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
              if (state.passwordInteracted)
                PasswordChecklist(password: state.password),
              SizedBox(height: 16),
              CustomButton(
                onPressed: state.isValid
                    ? () {
                        debugPrint(
                          "Form is valid: "
                          "Email=${state.email.value}, "
                          "Password=${state.password.value}, "
                          "Name=${state.name.value}",
                        );
                        GoRouter.of(context).push(
                          '${RoutePaths.kEmailVerificationPath}?email=${Uri.encodeComponent(state.email.value)}&source=${VerificationSource.signUp.name}',
                        );
                      }
                    : null,
                buttonName: "Register",
              ),
            ],
          ),
        );
      },
    );
  }
}
