import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/core/validators/email_validator.dart';
import 'package:bazar/core/validators/name_validator.dart';
import 'package:bazar/core/validators/password_validator.dart';

part 'validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  void toggleShowPassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  ValidationCubit() : super(ValidationState());

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
    emit(
      state.copyWith(
        password: password,
        passwordInteracted: true,
        isValid: Formz.validate(_fieldsToValidate(password: password)),
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

  /// Dynamically choose which fields to validate
  List<FormzInput<dynamic, dynamic>> _fieldsToValidate({
    EmailValidator? email,
    PasswordValidator? password,
    NameValidator? name,
  }) {
    final fields = <FormzInput<dynamic, dynamic>>[
      email ?? state.email,
      password ?? state.password,
    ];

    if (state.formType == AuthFormType.signUp) {
      fields.add(name ?? state.name);
    }

    return fields;
  }
}
