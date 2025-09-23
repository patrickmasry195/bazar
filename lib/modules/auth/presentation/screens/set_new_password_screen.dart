import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/core/widgets/custom_button.dart';
import 'package:bazar/modules/auth/presentation/cubit/validation/validation_cubit.dart';
import 'package:bazar/modules/auth/presentation/widgets/text_form_field_widget.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ValidationCubit?>() ?? ValidationCubit();

    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<ValidationCubit, ValidationState>(
        builder: (context, state) {
          final passwordError =
              state.passwordInteracted && !state.password.isValid
              ? 'Password must be at least 8 characters and include letters and numbers.'
              : null;

          final confirmError =
              state.confirmPasswordInteracted &&
                  state.confirmPassword.value.isNotEmpty &&
                  state.confirmPassword.validator(
                        state.confirmPassword.value,
                      ) !=
                      null
              ? 'Passwords do not match.'
              : null;

          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 34,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => context.pop(),
                            child: Icon(Icons.arrow_back),
                          ),
                          SizedBox(height: 16),
                          Text("New Password", style: AppTextStyles.h3),
                          SizedBox(height: 8),
                          Text(
                            "Create your new password, so you can login\nto your account.",
                            style: AppTextStyles.bodyLargeRegular.copyWith(
                              color: AppColorLight.hintTextColor,
                            ),
                          ),
                          SizedBox(height: 24),
                          Text("Password", style: AppTextStyles.bodyMediumBold),
                          SizedBox(height: 6),
                          TextFormFieldWidget(
                            hintText: 'Your Password',
                            obscureText: !state.showPassword,
                            enableSuggestions: false,
                            onChanged: (value) => context
                                .read<ValidationCubit>()
                                .passwordChanged(value),
                            errText: passwordError,
                            suffixIcon: GestureDetector(
                              onTap: () => context
                                  .read<ValidationCubit>()
                                  .toggleShowPassword(),
                              child: Icon(
                                state.showPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColorLight.hintTextColor,
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Confirm Password",
                            style: AppTextStyles.bodyMediumBold,
                          ),
                          SizedBox(height: 6),
                          TextFormFieldWidget(
                            hintText: 'Confirm Password',
                            obscureText: !state.showPassword,
                            enableSuggestions: false,
                            onChanged: (value) => context
                                .read<ValidationCubit>()
                                .confirmPasswordChanged(value),
                            errText: confirmError,
                            suffixIcon: GestureDetector(
                              onTap: () => context
                                  .read<ValidationCubit>()
                                  .toggleShowPassword(),
                              child: Icon(
                                state.showPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColorLight.hintTextColor,
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const Spacer(),
                          CustomButton(
                            onPressed:
                                state.password.isValid &&
                                    state.confirmPassword.validator(
                                          state.confirmPassword.value,
                                        ) ==
                                        null
                                ? () {
                                    context.go(
                                      RoutePaths.kSuccessScreenPath,
                                      extra: VerificationSource.passwordReset,
                                    );
                                    // TODO: call repository to set new password
                                  }
                                : null,
                            buttonName: "Send",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
