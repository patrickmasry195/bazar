enum FieldValidationError { invalid, empty }

enum PasswordValidationError { empty, tooShort, noNumber, noLetter }

enum NameValidationError {
  empty,
  tooShort,
  tooLong,
  invalidCharacters,
  invalidFormat,
}

enum AuthFormType { signIn, signUp }

enum ResetMethod {
  email,
  phone;

  static ResetMethod fromString(String? method) {
    return method?.toLowerCase() == 'phone'
        ? ResetMethod.phone
        : ResetMethod.email;
  }
}
