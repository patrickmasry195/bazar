import 'package:bazar/core/routing/route_paths.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/core/widgets/custom_button.dart';
import 'package:bazar/modules/auth/presentation/cubit/validation/validation_cubit.dart';
import 'package:bazar/modules/auth/presentation/widgets/phone_number_input_field.dart';
import 'package:bazar/modules/auth/presentation/widgets/text_form_field_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ResetMethod resetMethod;

  const ResetPasswordScreen({super.key, required this.resetMethod});

  @override
  Widget build(BuildContext context) {
    final bool isEmail = resetMethod == ResetMethod.email;
    final String instructionText = isEmail
        ? 'Please enter your email, we will send a verification code to your email.'
        : 'Please enter your phone number, we will send a verification code to your phone number.';
    final String labelText = isEmail ? 'Email' : 'Phone Number';

    return BlocProvider(
      create: (_) => ValidationCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
            child: BlocBuilder<ValidationCubit, ValidationState>(
              builder: (BuildContext context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => context.pop(),
                      borderRadius: BorderRadius.circular(24),
                      child: const Icon(Icons.arrow_back_rounded, size: 28),
                    ),
                    const SizedBox(height: 16),
                    Text("Reset Password", style: AppTextStyles.h3),
                    const SizedBox(height: 8),
                    Text(
                      instructionText,
                      style: AppTextStyles.bodyLargeRegular.copyWith(
                        color: AppColorLight.hintTextColor,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(labelText, style: AppTextStyles.bodyMediumBold),
                    const SizedBox(height: 8),

                    if (isEmail)
                      TextFormFieldWidget(
                        hintText: 'Your Email',
                        keyboardType: TextInputType.emailAddress,
                        errText: state.email.isNotValid && state.emailInteracted
                            ? 'Please enter a valid email'
                            : null,
                        onChanged: (value) =>
                            context.read<ValidationCubit>().emailChanged(value),
                      )
                    else
                      PhoneNumberInputField(
                        hintText: 'Phone Number',
                        onInputChanged: (phone) {
                          context.read<ValidationCubit>().phoneChanged(
                            phone.completeNumber,
                          );
                        },
                      ),

                    const SizedBox(height: 32),
                    CustomButton(
                      buttonName: "Send",
                      onPressed: () {
                        final cubit = context.read<ValidationCubit>();
                        final state = cubit.state;

                        final isEmail = resetMethod == ResetMethod.email;

                        if (isEmail && state.email.isValid) {
                          context.push(
                            '${RoutePaths.kEmailVerificationPath}?email=${state.email.value}&source=${VerificationSource.passwordReset.name}',
                          );
                        } else if (!isEmail && state.phone.isValid) {
                          context.push(
                            '${RoutePaths.kPhoneNumberVerificationScreenPath}?phone=${state.phone.value}&source=${VerificationSource.passwordReset.name}',
                          );
                        } else {
                          if (isEmail) {
                            cubit.emailChanged(state.email.value);
                          } else {
                            cubit.phoneChanged(state.phone.value);
                          }
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
