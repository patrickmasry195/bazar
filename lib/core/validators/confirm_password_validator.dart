import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError { empty, mismatch }

class ConfirmPasswordValidator
    extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPasswordValidator.pure({this.password = ''}) : super.pure('');
  const ConfirmPasswordValidator.dirty({
    required this.password,
    String value = '',
  }) : super.dirty(value);

  final String password;

  @override
  ConfirmPasswordValidationError? validator(String value) {
    if (value.isEmpty) return ConfirmPasswordValidationError.empty;
    return password == value ? null : ConfirmPasswordValidationError.mismatch;
  }
}
