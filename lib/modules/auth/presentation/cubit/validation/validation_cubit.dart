import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:bazar/core/utils/enums.dart';
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
  }) {
    final fields = <FormzInput<dynamic, dynamic>>[
      email ?? state.email,
      password ?? state.password,
      phone ?? state.phone,
    ];

    if (state.formType == AuthFormType.signUp) {
      fields.add(name ?? state.name);
    }

    return fields;
  }
}
