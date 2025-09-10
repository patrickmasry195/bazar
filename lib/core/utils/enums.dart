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
