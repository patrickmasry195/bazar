import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/core/validators/confirm_password_validator.dart';
import 'package:bazar/core/validators/email_validator.dart';
import 'package:bazar/core/validators/name_validator.dart';
import 'package:bazar/core/validators/password_validator.dart';
import 'package:bazar/core/validators/phone_validator.dart';

part 'validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(const ValidationState());

  void toggleShowPassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void setFormType(AuthFormType type) {
    emit(state.copyWith(formType: type));
  }

  void emailChanged(String value) {
    final email = EmailValidator.dirty(value);
    emit(
      state.copyWith(
        email: email,
        emailInteracted: true,
        isValid: Formz.validate(_fieldsToValidate(email: email)),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordValidator.dirty(value);

    final updatedConfirm = ConfirmPasswordValidator.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmPassword: updatedConfirm,
        passwordInteracted: true,
        isValid: Formz.validate(
          _fieldsToValidate(
            password: password,
            confirmPassword: updatedConfirm,
          ),
        ),
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final confirm = ConfirmPasswordValidator.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmPassword: confirm,
        confirmPasswordInteracted: true,
        isValid: Formz.validate(_fieldsToValidate(confirmPassword: confirm)),
      ),
    );
  }

  void nameChanged(String value) {
    final name = NameValidator.dirty(value);
    emit(
      state.copyWith(
        name: name,
        nameInteracted: true,
        isValid: Formz.validate(_fieldsToValidate(name: name)),
      ),
    );
  }

  void phoneChanged(String value) {
    final phone = PhoneValidator.dirty(value);
    emit(
      state.copyWith(
        phone: phone,
        phoneInteracted: true,
        isValid: Formz.validate(_fieldsToValidate(phone: phone)),
      ),
    );
  }

  List<FormzInput<dynamic, dynamic>> _fieldsToValidate({
    EmailValidator? email,
    PasswordValidator? password,
    NameValidator? name,
    PhoneValidator? phone,
    ConfirmPasswordValidator? confirmPassword,
  }) {
    if (state.formType == AuthFormType.signUp) {
      return <FormzInput<dynamic, dynamic>>[
        email ?? state.email,
        password ?? state.password,
        name ?? state.name,
      ];
    } else {
      final fields = <FormzInput<dynamic, dynamic>>[
        email ?? state.email,
        password ?? state.password,
        phone ?? state.phone,
      ];

      final cp = confirmPassword ?? state.confirmPassword;
      if (confirmPassword != null || cp.value.isNotEmpty) {
        fields.add(cp);
      }

      return fields;
    }
  }
}
