import 'package:bazar/core/utils/enums.dart';
import 'package:formz/formz.dart';

class NameValidator extends FormzInput<String, NameValidationError> {
  const NameValidator.pure() : super.pure('');
  const NameValidator.dirty([super.value = '']) : super.dirty();

  static final _invalidCharsRegExp = RegExp(r"[^a-zA-Z\u0600-\u06FF\s'-]");

  static final _invalidFormatRegExp = RegExp(
    r"(^\s|^\-|^'|\s$|\-$|'$)|(\s{2,}|\-{2,}|'{2,})",
  );

  @override
  NameValidationError? validator(String value) {
    final trimmedValue = value.trim();

    // 1. Check for empty or whitespace-only strings
    if (trimmedValue.isEmpty) {
      return NameValidationError.empty;
    }

    // 2. Check for minimum length
    if (trimmedValue.length < 2) {
      return NameValidationError.tooShort;
    }

    // 3. Check for maximum length
    if (trimmedValue.length > 50) {
      return NameValidationError.tooLong;
    }

    // 4. Check for invalid characters (like numbers or symbols)
    if (_invalidCharsRegExp.hasMatch(trimmedValue)) {
      return NameValidationError.invalidCharacters;
    }

    // 5. Check for invalid formatting (like double spaces or leading/trailing hyphens)
    if (_invalidFormatRegExp.hasMatch(trimmedValue)) {
      return NameValidationError.invalidFormat;
    }

    // If all checks pass, the name is valid
    return null;
  }
}
