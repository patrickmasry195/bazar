part of 'validation_cubit.dart';

class ValidationState extends Equatable {
  const ValidationState({
    this.formType = AuthFormType.signIn,
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.name = const NameValidator.pure(),
    this.isValid = false,
    this.nameInteracted = false,
    this.emailInteracted = false,
    this.passwordInteracted = false,
    this.showPassword = false,
  });

  final AuthFormType formType;
  final EmailValidator email;
  final PasswordValidator password;
  final NameValidator name;
  final bool isValid;
  final bool nameInteracted;
  final bool emailInteracted;
  final bool passwordInteracted;
  final bool showPassword;

  @override
  List<Object?> get props => [
    formType,
    email,
    password,
    name,
    isValid,
    nameInteracted,
    emailInteracted,
    passwordInteracted,
    showPassword,
  ];

  ValidationState copyWith({
    AuthFormType? formType,
    EmailValidator? email,
    PasswordValidator? password,
    NameValidator? name,
    bool? isValid,
    bool? nameInteracted,
    bool? emailInteracted,
    bool? passwordInteracted,
    bool? showPassword,
  }) {
    return ValidationState(
      formType: formType ?? this.formType,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      isValid: isValid ?? this.isValid,
      nameInteracted: nameInteracted ?? this.nameInteracted,
      emailInteracted: emailInteracted ?? this.emailInteracted,
      passwordInteracted: passwordInteracted ?? this.passwordInteracted,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
