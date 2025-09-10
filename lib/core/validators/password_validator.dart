import 'package:formz/formz.dart';

enum PasswordValidationError { empty, tooShort, noNumber, noLetter }

class PasswordValidator extends FormzInput<String, PasswordValidationError> {
  const PasswordValidator.pure() : super.pure('');
  const PasswordValidator.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value.length < 8) return PasswordValidationError.tooShort;
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return PasswordValidationError.noNumber;
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return PasswordValidationError.noLetter;
    }
    return null;
  }

  bool get hasMinLength => value.length >= 8;
  bool get hasNumber => RegExp(r'[0-9]').hasMatch(value);
  bool get hasLetter => RegExp(r'[A-Za-z]').hasMatch(value);
}
