import 'package:bazar/core/utils/enums.dart';
import 'package:formz/formz.dart';

class EmailValidator extends FormzInput<String, FieldValidationError> {
  const EmailValidator.pure() : super.pure('');

  const EmailValidator.dirty([super.value = '']) : super.dirty();

  static final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  @override
  FieldValidationError? validator(String value) {
    if (value == '') {
      return FieldValidationError.empty;
    } else if (!emailRegExp.hasMatch(value)) {
      return FieldValidationError.invalid;
    } else {
      return null;
    }
  }
}
