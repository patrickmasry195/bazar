import 'package:formz/formz.dart';

enum PhoneValidationError { invalid }

class PhoneValidator extends FormzInput<String, PhoneValidationError> {
  const PhoneValidator.pure() : super.pure('');
  const PhoneValidator.dirty([super.value = '']) : super.dirty();

  static final _phoneRegExp = RegExp(r'^[+]?\d{7,15}$');

  @override
  PhoneValidationError? validator(String value) {
    return _phoneRegExp.hasMatch(value) ? null : PhoneValidationError.invalid;
  }
}
